alter table public.restaurants
  add column if not exists campus_key text,
  add column if not exists campus_label text,
  add column if not exists campus_distance numeric(5,2);

create index if not exists restaurants_campus_key_idx on public.restaurants(campus_key);
create index if not exists restaurants_campus_label_idx on public.restaurants(campus_label);

update public.restaurants
set
  campus_label = coalesce(
    campus_label,
    case
      when tags @> array['紫金港']::text[] or suited_for @> array['紫金港']::text[] or reason like '%距离紫金港约%' then '紫金港'
      when tags @> array['玉泉']::text[] or suited_for @> array['玉泉']::text[] or reason like '%距离玉泉约%' then '玉泉'
      when tags @> array['西溪']::text[] or suited_for @> array['西溪']::text[] or reason like '%距离西溪约%' then '西溪'
      when tags @> array['华家池']::text[] or suited_for @> array['华家池']::text[] or reason like '%距离华家池约%' then '华家池'
      when tags @> array['之江']::text[] or suited_for @> array['之江']::text[] or reason like '%距离之江约%' then '之江'
      when tags @> array['海宁']::text[] or suited_for @> array['海宁']::text[] or reason like '%距离海宁约%' then '海宁'
    end
  ),
  campus_key = coalesce(
    campus_key,
    case
      when tags @> array['紫金港']::text[] or suited_for @> array['紫金港']::text[] or reason like '%距离紫金港约%' then 'zijingang'
      when tags @> array['玉泉']::text[] or suited_for @> array['玉泉']::text[] or reason like '%距离玉泉约%' then 'yuquan'
      when tags @> array['西溪']::text[] or suited_for @> array['西溪']::text[] or reason like '%距离西溪约%' then 'xixi'
      when tags @> array['华家池']::text[] or suited_for @> array['华家池']::text[] or reason like '%距离华家池约%' then 'huajiachi'
      when tags @> array['之江']::text[] or suited_for @> array['之江']::text[] or reason like '%距离之江约%' then 'zhijiang'
      when tags @> array['海宁']::text[] or suited_for @> array['海宁']::text[] or reason like '%距离海宁约%' then 'haining'
    end
  ),
  campus_distance = coalesce(campus_distance, distance)
where campus_label is null or campus_key is null or campus_distance is null;
