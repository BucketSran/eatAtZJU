create or replace function public.review_clean_text(value text, fallback text default '')
returns text
language sql
immutable
as $$
  select coalesce(nullif(btrim(value), ''), fallback)
$$;

create or replace function public.review_to_numeric(value jsonb, fallback numeric, min_value numeric, max_value numeric)
returns numeric
language plpgsql
immutable
as $$
declare
  parsed numeric;
begin
  begin
    if value is null or value = 'null'::jsonb then
      parsed := fallback;
    else
      parsed := trim(both '"' from value::text)::numeric;
    end if;
  exception when others then
    parsed := fallback;
  end;

  return least(max_value, greatest(min_value, parsed));
end;
$$;

create or replace function public.review_clean_text_array(values_in text[], max_items integer default 12)
returns text[]
language sql
immutable
as $$
  select coalesce(array(
    select tag
    from (
      select distinct on (btrim(value)) btrim(value) as tag, ord
      from unnest(coalesce(values_in, array[]::text[])) with ordinality as input(value, ord)
      where btrim(coalesce(value, '')) <> ''
      order by btrim(value), ord
    ) deduped
    order by ord
    limit greatest(max_items, 0)
  ), array[]::text[])
$$;

create or replace function public.review_clean_tags(value jsonb, max_items integer default 12)
returns text[]
language sql
immutable
as $$
  select public.review_clean_text_array(
    array(
      select jsonb_array_elements_text(
        case when jsonb_typeof(value) = 'array' then value else '[]'::jsonb end
      )
    ),
    max_items
  )
$$;

create or replace function public.review_id_from_submission(prefix text, submission_id text)
returns text
language sql
immutable
as $$
  select coalesce(nullif(prefix, ''), 'sub') || '_' || coalesce(
    nullif(right(regexp_replace(coalesce(submission_id, ''), '[^0-9A-Za-z]', '', 'g'), 24), ''),
    'missing'
  )
$$;

create or replace function public.review_append_source_ref(existing jsonb, next_ref jsonb)
returns jsonb
language sql
immutable
as $$
  with raw_items as (
    select value, ord::numeric as ord
    from jsonb_array_elements(
      case when jsonb_typeof(existing) = 'array' then existing else '[]'::jsonb end
    ) with ordinality as refs(value, ord)
    union all
    select next_ref, 1000000000::numeric
  ), ranked as (
    select value, ord, row_number() over (order by ord desc) as reverse_rank
    from raw_items
  )
  select coalesce(jsonb_agg(value order by ord), '[]'::jsonb)
  from ranked
  where reverse_rank <= 20
$$;

create or replace function public.review_submission_atomic(
  p_submission_id text,
  p_action text,
  p_reviewer_id uuid,
  p_review_note text default null,
  p_payload_override jsonb default null
)
returns jsonb
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_submission public.submissions%rowtype;
  v_payload jsonb;
  v_now timestamptz := now();
  v_status text;
  v_materialized jsonb;
  v_skipped boolean := false;
  v_skip_reason text;
  v_operation text;
  v_target_table text;
  v_target_id text;
  v_before_data jsonb;
  v_after_data jsonb;
  v_restaurant public.restaurants%rowtype;
  v_restaurant_id text;
  v_campus text;
  v_campus_key text;
  v_distance numeric;
  v_latitude numeric;
  v_longitude numeric;
  v_title text;
  v_dining_mode text;
  v_meal_period text;
  v_service_modes text[];
  v_meal_periods text[];
  v_constraint_tags text[];
  v_source_ref jsonb;
  v_source_refs jsonb;
  v_patch jsonb;
  v_tags text[];
  v_price integer;
  v_avatar_snapshot jsonb;
begin
  if p_action not in ('approve', 'reject') then
    raise exception 'Invalid review action' using errcode = '22023';
  end if;

  if p_submission_id is null or btrim(p_submission_id) = '' then
    raise exception 'Missing submission id' using errcode = '22023';
  end if;

  if p_reviewer_id is null or not public.is_platform_admin(p_reviewer_id) then
    raise exception 'Admin access required' using errcode = '42501';
  end if;

  if p_payload_override is not null and jsonb_typeof(p_payload_override) <> 'object' then
    raise exception 'Payload override must be an object' using errcode = '22023';
  end if;

  if p_payload_override is not null and octet_length(p_payload_override::text) > 20000 then
    raise exception 'Payload override too large' using errcode = '22023';
  end if;

  select *
  into v_submission
  from public.submissions
  where id = p_submission_id
    and status = 'pending'
  for update;

  if not found then
    if exists (select 1 from public.submissions where id = p_submission_id) then
      raise exception 'Submission has already been claimed or reviewed' using errcode = 'P0002';
    end if;
    raise exception 'Submission not found' using errcode = 'P0002';
  end if;

  v_payload := coalesce(v_submission.payload, '{}'::jsonb) || coalesce(p_payload_override, '{}'::jsonb);
  v_status := case when p_action = 'approve' then 'approved' else 'rejected' end;

  if p_action = 'reject' then
    v_skipped := true;
    v_skip_reason := 'rejected';
  elsif v_submission.type = 'restaurant' then
    v_target_table := 'restaurants';
    v_target_id := public.review_id_from_submission('r_sub', v_submission.id);
    v_operation := 'insert';
    v_title := public.review_clean_text(v_payload->>'title', '学生推荐餐厅');
    v_campus := public.review_clean_text(v_payload->>'campus', '紫金港');
    v_distance := public.review_to_numeric(v_payload->'distance', 1, 0, 20);
    v_dining_mode := public.review_clean_text(
      case when v_payload->>'serviceMode' = '都可以' then '' else v_payload->>'serviceMode' end,
      public.review_clean_text(v_payload->>'diningMode', '')
    );
    v_meal_period := public.review_clean_text(v_payload->>'mealPeriod', '');
    v_service_modes := public.review_clean_tags(v_payload->'serviceModes');
    if cardinality(v_service_modes) = 0 and v_dining_mode <> '' then
      v_service_modes := array[v_dining_mode];
    end if;
    v_meal_periods := public.review_clean_tags(v_payload->'mealPeriods');
    if cardinality(v_meal_periods) = 0 and v_meal_period <> '' then
      v_meal_periods := array[v_meal_period];
    end if;
    v_constraint_tags := public.review_clean_tags(v_payload->'constraintTags');
    if cardinality(v_constraint_tags) = 0 then
      v_constraint_tags := public.review_clean_text_array(array_cat(array_remove(array[
        case when public.review_clean_text(v_payload->>'spiceLevel', '') not in ('', '不限') then public.review_clean_text(v_payload->>'spiceLevel', '') end,
        case when public.review_clean_text(v_payload->>'loadLevel', '') not in ('', '不限') then public.review_clean_text(v_payload->>'loadLevel', '') end
      ], null), public.review_clean_tags(v_payload->'dietaryTags')));
    end if;

    v_latitude := case v_campus
      when '玉泉' then 30.2654
      when '西溪' then 30.2767
      when '华家池' then 30.2693
      when '之江' then 30.1974
      when '海宁' then 30.5164
      else 30.3088
    end;
    v_longitude := case v_campus
      when '玉泉' then 120.1236
      when '西溪' then 120.1392
      when '华家池' then 120.1969
      when '之江' then 120.1292
      when '海宁' then 120.6798
      else 120.0865
    end;

    v_campus_key := public.review_clean_text(v_payload->>'campusKey', public.review_clean_text(v_payload->>'campus_key', ''));
    select to_jsonb(restaurants.*) into v_before_data from public.restaurants where id = v_target_id;

    insert into public.restaurants (
      id, name, canonical_name, aliases, campus_label, campus_key, campus_distance,
      area, distance, walk_minutes, cuisine, price, rating, student_score, checkins,
      latitude, longitude, cover_icon, cover_color, tags, suited_for, service_modes,
      meal_periods, scenario_tags, constraint_tags, preference_tags, reason, source_refs,
      status, created_by
    ) values (
      v_target_id,
      v_title,
      v_title,
      array[]::text[],
      v_campus,
      nullif(v_campus_key, ''),
      v_distance,
      public.review_clean_text(v_payload->>'area', v_campus || '待补充区域'),
      v_distance,
      greatest(1, round(public.review_to_numeric(v_payload->'walkMinutes', v_distance * 12, 1, 240))::integer),
      public.review_clean_text(v_payload->>'cuisine', '学生推荐'),
      round(public.review_to_numeric(v_payload->'price', 30, 1, 999))::integer,
      public.review_to_numeric(v_payload->'rating', 4.2, 0, 5),
      0,
      0,
      public.review_to_numeric(v_payload->'latitude', v_latitude, -90, 90),
      public.review_to_numeric(v_payload->'longitude', v_longitude, -180, 180),
      public.review_clean_text(v_payload->>'coverIcon', substring(v_title from 1 for 1)),
      public.review_clean_text(v_payload->>'coverColor', '#f0aa38'),
      public.review_clean_tags(v_payload->'tags'),
      public.review_clean_text_array(array_cat(array_remove(array[v_dining_mode, v_meal_period], ''), public.review_clean_tags(v_payload->'suitedFor'))),
      v_service_modes,
      v_meal_periods,
      public.review_clean_tags(v_payload->'scenarioTags'),
      v_constraint_tags,
      public.review_clean_tags(v_payload->'preferenceTags'),
      public.review_clean_text(v_payload->>'content', '来自学生贡献，管理员已审核。'),
      jsonb_build_array(jsonb_build_object('type', 'submission', 'id', v_submission.id, 'submitter_id', v_submission.submitter_id, 'reviewer_id', p_reviewer_id, 'reviewed_at', v_now)),
      'published',
      v_submission.submitter_id
    )
    on conflict (id) do update set
      name = excluded.name,
      canonical_name = excluded.canonical_name,
      aliases = excluded.aliases,
      campus_label = excluded.campus_label,
      campus_key = excluded.campus_key,
      campus_distance = excluded.campus_distance,
      area = excluded.area,
      distance = excluded.distance,
      walk_minutes = excluded.walk_minutes,
      cuisine = excluded.cuisine,
      price = excluded.price,
      rating = excluded.rating,
      student_score = excluded.student_score,
      checkins = excluded.checkins,
      latitude = excluded.latitude,
      longitude = excluded.longitude,
      cover_icon = excluded.cover_icon,
      cover_color = excluded.cover_color,
      tags = excluded.tags,
      suited_for = excluded.suited_for,
      service_modes = excluded.service_modes,
      meal_periods = excluded.meal_periods,
      scenario_tags = excluded.scenario_tags,
      constraint_tags = excluded.constraint_tags,
      preference_tags = excluded.preference_tags,
      reason = excluded.reason,
      source_refs = excluded.source_refs,
      status = excluded.status,
      created_by = excluded.created_by
    returning to_jsonb(restaurants.*) into v_after_data;

  elsif v_submission.type = 'dish' then
    v_restaurant_id := public.review_clean_text(v_payload->>'restaurantId', public.review_clean_text(v_payload->>'restaurant_id', ''));
    if v_restaurant_id = '' then
      v_skipped := true;
      v_skip_reason := 'missing_restaurant_id';
    else
      v_target_table := 'dishes';
      v_target_id := public.review_id_from_submission('dish_sub', v_submission.id);
      v_operation := 'insert';
      select to_jsonb(dishes.*) into v_before_data from public.dishes where id = v_target_id;
      insert into public.dishes (id, restaurant_id, name, price, heat, tags, status)
      values (
        v_target_id,
        v_restaurant_id,
        public.review_clean_text(v_payload->>'title', '学生推荐菜品'),
        round(public.review_to_numeric(v_payload->'price', 20, 1, 999))::integer,
        round(public.review_to_numeric(v_payload->'heat', 50, 0, 100))::integer,
        public.review_clean_tags(v_payload->'tags'),
        'published'
      )
      on conflict (id) do update set
        restaurant_id = excluded.restaurant_id,
        name = excluded.name,
        price = excluded.price,
        heat = excluded.heat,
        tags = excluded.tags,
        status = excluded.status
      returning to_jsonb(dishes.*) into v_after_data;
    end if;

  elsif v_submission.type in ('review', 'checkin') then
    v_restaurant_id := public.review_clean_text(v_payload->>'restaurantId', public.review_clean_text(v_payload->>'restaurant_id', ''));
    if v_restaurant_id = '' then
      v_skipped := true;
      v_skip_reason := 'missing_restaurant_id';
    else
      v_target_table := 'reviews';
      v_target_id := public.review_id_from_submission('rv_sub', v_submission.id);
      v_operation := 'insert';
      v_avatar_snapshot := case when jsonb_typeof(v_payload->'avatarSnapshot') = 'object'
        then v_payload->'avatarSnapshot'
        else jsonb_build_object('type', 'preset', 'preset', 'rice', 'text', '饭', 'color', '#f0aa38')
      end;
      select to_jsonb(reviews.*) into v_before_data from public.reviews where id = v_target_id;
      insert into public.reviews (id, restaurant_id, user_id, display_name_snapshot, avatar_snapshot, rating, text, tags, status)
      values (
        v_target_id,
        v_restaurant_id,
        v_submission.submitter_id,
        public.review_clean_text(v_payload->>'displayName', 'ZJU student'),
        v_avatar_snapshot,
        round(public.review_to_numeric(v_payload->'rating', 4, 1, 5))::integer,
        left(public.review_clean_text(v_payload->>'content', public.review_clean_text(v_payload->>'title', '学生贡献评价')), 500),
        public.review_clean_tags(v_payload->'tags'),
        'approved'
      )
      on conflict (id) do update set
        restaurant_id = excluded.restaurant_id,
        user_id = excluded.user_id,
        display_name_snapshot = excluded.display_name_snapshot,
        avatar_snapshot = excluded.avatar_snapshot,
        rating = excluded.rating,
        text = excluded.text,
        tags = excluded.tags,
        status = excluded.status
      returning to_jsonb(reviews.*) into v_after_data;
    end if;

  elsif v_submission.type = 'correction' then
    if public.review_clean_text(v_payload->>'opsAction', '') not in ('demote', 'archive', 'edit') then
      v_skipped := true;
      v_skip_reason := 'manual_correction_only';
    else
      v_restaurant_id := public.review_clean_text(
        v_payload->>'restaurantId',
        public.review_clean_text(v_payload->>'restaurant_id', public.review_clean_text(v_payload #>> '{opsTarget,targetId}', ''))
      );
      if v_restaurant_id = '' then
        v_skipped := true;
        v_skip_reason := 'missing_restaurant_id';
      else
        select * into v_restaurant from public.restaurants where id = v_restaurant_id for update;
        if not found then
          v_skipped := true;
          v_skip_reason := 'restaurant_not_found';
        else
          v_target_table := 'restaurants';
          v_target_id := v_restaurant_id;
          v_operation := 'update';
          v_before_data := to_jsonb(v_restaurant);
          v_source_ref := jsonb_build_object(
            'type', 'admin_ops',
            'action', v_payload->>'opsAction',
            'submission_id', v_submission.id,
            'submitter_id', v_submission.submitter_id,
            'reviewer_id', p_reviewer_id,
            'reviewed_at', v_now
          );
          v_source_refs := public.review_append_source_ref(v_restaurant.source_refs, v_source_ref);

          if v_payload->>'opsAction' = 'demote' then
            update public.restaurants
            set
              constraint_tags = public.review_clean_text_array(array_cat(array['不主推'], coalesce(constraint_tags, array[]::text[]))),
              preference_tags = public.review_clean_text_array(array_cat(array['不主推'], coalesce(preference_tags, array[]::text[]))),
              source_refs = v_source_refs
            where id = v_restaurant_id
            returning to_jsonb(restaurants.*) into v_after_data;
          elsif v_payload->>'opsAction' = 'archive' then
            update public.restaurants
            set status = 'archived', source_refs = v_source_refs
            where id = v_restaurant_id
            returning to_jsonb(restaurants.*) into v_after_data;
          else
            v_patch := case when jsonb_typeof(v_payload->'patch') = 'object' then v_payload->'patch' else '{}'::jsonb end;
            if v_patch = '{}'::jsonb then
              v_skipped := true;
              v_skip_reason := 'empty_correction_patch';
            else
              v_tags := public.review_clean_tags(v_patch->'tags');
              v_price := case when v_patch ? 'price' then round(public.review_to_numeric(v_patch->'price', v_restaurant.price, 1, 999))::integer else v_restaurant.price end;
              update public.restaurants
              set
                name = public.review_clean_text(v_patch->>'name', name),
                canonical_name = public.review_clean_text(v_patch->>'name', canonical_name),
                area = public.review_clean_text(v_patch->>'area', area),
                cuisine = public.review_clean_text(v_patch->>'cuisine', cuisine),
                reason = public.review_clean_text(v_patch->>'reason', reason),
                price = v_price,
                tags = case when cardinality(v_tags) > 0 then v_tags else tags end,
                source_refs = v_source_refs
              where id = v_restaurant_id
              returning to_jsonb(restaurants.*) into v_after_data;
            end if;
          end if;
        end if;
      end if;
    end if;
  else
    v_skipped := true;
    v_skip_reason := 'manual_correction_only';
  end if;

  if v_skipped then
    v_materialized := jsonb_build_object('skipped', true, 'reason', v_skip_reason);
  else
    v_materialized := jsonb_build_object(
      'skipped', false,
      'operation', v_operation,
      'targetTable', v_target_table,
      'targetId', v_target_id,
      'beforeData', v_before_data,
      'data', v_after_data
    );
  end if;

  update public.submissions
  set
    status = v_status,
    payload = v_payload,
    reviewer_id = p_reviewer_id,
    reviewed_at = v_now,
    review_note = nullif(left(coalesce(p_review_note, ''), 500), '')
  where id = v_submission.id;

  if p_action = 'approve' and not v_skipped then
    update public.content_change_requests
    set
      status = 'materialized',
      reviewer_id = p_reviewer_id,
      reviewed_at = v_now,
      materialized_at = v_now,
      materialized_target_table = v_target_table,
      materialized_target_id = v_target_id,
      target_id = coalesce(target_id, v_target_id),
      review_note = nullif(left(coalesce(p_review_note, ''), 500), '')
    where source_submission_id = v_submission.id;
  else
    update public.content_change_requests
    set
      status = 'rejected',
      reviewer_id = p_reviewer_id,
      reviewed_at = v_now,
      review_note = nullif(left(coalesce(p_review_note, ''), 500), '')
    where source_submission_id = v_submission.id;
  end if;

  insert into public.audit_logs (actor_id, action, target_table, target_id, before_data, after_data, reason)
  values (
    p_reviewer_id,
    p_action,
    'submissions',
    v_submission.id,
    to_jsonb(v_submission),
    jsonb_build_object('id', v_submission.id, 'status', v_status, 'reviewed_at', v_now, 'materialized', v_materialized),
    nullif(left(coalesce(p_review_note, ''), 500), '')
  );

  if not v_skipped then
    insert into public.audit_logs (actor_id, action, target_table, target_id, before_data, after_data, reason)
    values (
      p_reviewer_id,
      'materialize_' || v_submission.type,
      v_target_table,
      v_target_id,
      v_before_data,
      v_after_data,
      'Approved submission ' || v_submission.id
    );
  end if;

  return jsonb_build_object(
    'id', v_submission.id,
    'status', v_status,
    'reviewed_at', v_now,
    'materialized', v_materialized
  );
end;
$$;

revoke all on function public.review_submission_atomic(text, text, uuid, text, jsonb) from public;
grant execute on function public.review_submission_atomic(text, text, uuid, text, jsonb) to authenticated;
