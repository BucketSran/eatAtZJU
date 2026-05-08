create table if not exists public.app_users (
  id uuid primary key default gen_random_uuid(),
  display_name text not null default 'ZJU student',
  avatar_url text,
  preferences text[] not null default array[]::text[],
  primary_channel text not null default 'supabase_auth' check (primary_channel in ('supabase_auth', 'wechat_miniapp')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint app_users_display_name_length check (char_length(display_name) between 1 and 40),
  constraint app_users_preferences_length check (coalesce(array_length(preferences, 1), 0) <= 20)
);

create trigger set_app_users_updated_at
  before update on public.app_users
  for each row execute function public.set_updated_at();

alter table public.app_users enable row level security;

create table if not exists public.identity_links (
  id uuid primary key default gen_random_uuid(),
  app_user_id uuid not null references public.app_users(id) on delete cascade,
  provider text not null check (provider in ('supabase_auth', 'wechat_miniapp')),
  provider_user_id text not null,
  auth_user_id uuid references auth.users(id) on delete cascade,
  metadata jsonb not null default '{}'::jsonb,
  linked_at timestamptz not null default now(),
  last_seen_at timestamptz,
  unique (provider, provider_user_id),
  constraint identity_links_provider_user_id_length check (char_length(provider_user_id) between 1 and 160),
  constraint identity_links_supabase_auth_user_required check (
    provider <> 'supabase_auth'
    or auth_user_id is not null
  )
);

create index if not exists identity_links_app_user_id_idx on public.identity_links(app_user_id);
create index if not exists identity_links_auth_user_id_idx on public.identity_links(auth_user_id);

alter table public.identity_links enable row level security;

insert into public.app_users (id, display_name, avatar_url, preferences, primary_channel, created_at, updated_at)
select id, display_name, avatar_url, preferences, 'supabase_auth', created_at, updated_at
from public.profiles
on conflict (id) do nothing;

insert into public.identity_links (app_user_id, provider, provider_user_id, auth_user_id, metadata, linked_at)
select
  id,
  'supabase_auth',
  id::text,
  id,
  jsonb_build_object('backfilled_from', 'profiles'),
  now()
from public.profiles
on conflict (provider, provider_user_id) do nothing;

create policy "users can read own app user"
  on public.app_users
  for select
  to authenticated
  using (
    exists (
      select 1
      from public.identity_links
      where identity_links.app_user_id = app_users.id
        and identity_links.provider = 'supabase_auth'
        and identity_links.auth_user_id = auth.uid()
    )
  );

create policy "admins can read app users"
  on public.app_users
  for select
  to authenticated
  using (public.is_platform_admin(auth.uid()));

create policy "users can read own identity links"
  on public.identity_links
  for select
  to authenticated
  using (
    auth_user_id = auth.uid()
    or exists (
      select 1
      from public.identity_links own_link
      where own_link.app_user_id = identity_links.app_user_id
        and own_link.provider = 'supabase_auth'
        and own_link.auth_user_id = auth.uid()
    )
  );

create policy "admins can read identity links"
  on public.identity_links
  for select
  to authenticated
  using (public.is_platform_admin(auth.uid()));
