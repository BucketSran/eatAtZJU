revoke all on function public.review_submission_atomic(text, text, uuid, text, jsonb) from public;
revoke all on function public.review_submission_atomic(text, text, uuid, text, jsonb) from anon;
revoke all on function public.review_submission_atomic(text, text, uuid, text, jsonb) from authenticated;
grant execute on function public.review_submission_atomic(text, text, uuid, text, jsonb) to service_role;

alter table public.audit_logs
  add column if not exists rollback_of text references public.audit_logs(id) on delete set null;

create index if not exists audit_logs_rollback_of_idx on public.audit_logs(rollback_of);

create or replace function public.rollback_audit_log_atomic(
  p_audit_log_id text,
  p_actor_id uuid,
  p_reason text default 'Manual rollback'
)
returns jsonb
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_audit public.audit_logs%rowtype;
  v_table text;
  v_target_id text;
  v_before_data jsonb;
  v_after_data jsonb;
  v_set_clause text;
  v_sql text;
  v_reason text;
  v_rollback_id text;
begin
  if p_audit_log_id is null or btrim(p_audit_log_id) = '' then
    raise exception 'Missing auditLogId' using errcode = '22023';
  end if;

  if p_actor_id is null or not public.is_platform_admin(p_actor_id) then
    raise exception 'Admin access required' using errcode = '42501';
  end if;

  select *
  into v_audit
  from public.audit_logs
  where id = p_audit_log_id
  for update;

  if not found then
    raise exception 'Audit log not found' using errcode = 'P0002';
  end if;

  if v_audit.action = 'rollback' then
    raise exception 'Rollback logs cannot be rolled back directly' using errcode = '22023';
  end if;

  if exists (select 1 from public.audit_logs where rollback_of = p_audit_log_id) then
    raise exception 'Audit log has already been rolled back' using errcode = 'P0002';
  end if;

  v_table := v_audit.target_table;
  v_target_id := v_audit.target_id;
  v_before_data := case when jsonb_typeof(v_audit.before_data) = 'object' then v_audit.before_data else null end;
  v_after_data := case when jsonb_typeof(v_audit.after_data) = 'object' then v_audit.after_data else null end;
  v_reason := nullif(left(coalesce(p_reason, 'Manual rollback'), 500), '');

  if v_table not in ('submissions', 'restaurants', 'dishes', 'reviews', 'content_change_requests') then
    raise exception 'Unsupported rollback target' using errcode = '22023';
  end if;

  if v_before_data is null and v_after_data is null then
    raise exception 'Audit log has no rollback snapshot' using errcode = '22023';
  end if;

  if v_before_data is null then
    execute format('delete from public.%I where id = $1', v_table) using v_target_id;
  else
    select string_agg(format('%I = excluded.%I', column_name, column_name), ', ' order by ordinal_position)
    into v_set_clause
    from information_schema.columns
    where table_schema = 'public'
      and table_name = v_table
      and column_name <> 'id';

    if v_set_clause is null then
      raise exception 'Rollback target has no updatable columns' using errcode = '22023';
    end if;

    v_sql := format(
      'insert into public.%1$I select * from jsonb_populate_record(null::public.%1$I, $1) on conflict (id) do update set %2$s',
      v_table,
      v_set_clause
    );
    execute v_sql using v_before_data;
  end if;

  insert into public.audit_logs (actor_id, action, target_table, target_id, before_data, after_data, reason, rollback_of)
  values (p_actor_id, 'rollback', v_table, v_target_id, v_after_data, v_before_data, v_reason, p_audit_log_id)
  returning id into v_rollback_id;

  return jsonb_build_object('status', 'rolled_back', 'auditLogId', p_audit_log_id, 'rollbackAuditLogId', v_rollback_id);
end;
$$;

revoke all on function public.rollback_audit_log_atomic(text, uuid, text) from public;
revoke all on function public.rollback_audit_log_atomic(text, uuid, text) from anon;
revoke all on function public.rollback_audit_log_atomic(text, uuid, text) from authenticated;
grant execute on function public.rollback_audit_log_atomic(text, uuid, text) to service_role;
