alter table public.app_users
  add column if not exists default_campus text not null default '紫金港';

alter table public.app_users
  drop constraint if exists app_users_default_campus_valid;

alter table public.app_users
  add constraint app_users_default_campus_valid
  check (default_campus in ('紫金港', '玉泉', '西溪', '华家池', '之江', '海宁'));

update public.app_users
set default_campus = '紫金港'
where default_campus is null
  or default_campus not in ('紫金港', '玉泉', '西溪', '华家池', '之江', '海宁');
