create table if not exists public.account_link_codes (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  app_user_id uuid not null references public.app_users(id) on delete cascade,
  created_by_provider text not null check (created_by_provider in ('supabase_auth', 'wechat_miniapp')),
  created_by_identity text not null,
  consumed_by_provider text check (consumed_by_provider in ('supabase_auth', 'wechat_miniapp')),
  consumed_by_identity text,
  metadata jsonb not null default '{}'::jsonb,
  expires_at timestamptz not null,
  consumed_at timestamptz,
  created_at timestamptz not null default now(),
  constraint account_link_codes_code_length check (char_length(code) between 6 and 32),
  constraint account_link_codes_identity_length check (char_length(created_by_identity) between 1 and 160)
);

create index if not exists account_link_codes_app_user_id_idx on public.account_link_codes(app_user_id);
create index if not exists account_link_codes_active_idx
  on public.account_link_codes(code, expires_at)
  where consumed_at is null;

alter table public.account_link_codes enable row level security;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'account_link_codes' and policyname = 'users can read own account link codes'
  ) then
    create policy "users can read own account link codes"
      on public.account_link_codes
      for select
      to authenticated
      using (
        exists (
          select 1
          from public.identity_links
          where identity_links.app_user_id = account_link_codes.app_user_id
            and identity_links.provider = 'supabase_auth'
            and identity_links.auth_user_id = auth.uid()
        )
      );
  end if;
end $$;
