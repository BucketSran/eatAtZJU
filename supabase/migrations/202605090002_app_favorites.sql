create table if not exists public.app_favorites (
  app_user_id uuid not null references public.app_users(id) on delete cascade,
  restaurant_id text not null references public.restaurants(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (app_user_id, restaurant_id)
);

create index if not exists app_favorites_restaurant_id_idx on public.app_favorites(restaurant_id);

alter table public.app_favorites enable row level security;

insert into public.app_favorites (app_user_id, restaurant_id, created_at)
select
  coalesce(identity_links.app_user_id, favorites.user_id),
  favorites.restaurant_id,
  favorites.created_at
from public.favorites
left join public.identity_links
  on identity_links.provider = 'supabase_auth'
  and identity_links.auth_user_id = favorites.user_id
on conflict (app_user_id, restaurant_id) do nothing;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'app_favorites' and policyname = 'users can read own app favorites'
  ) then
    create policy "users can read own app favorites"
      on public.app_favorites
      for select
      to authenticated
      using (
        exists (
          select 1
          from public.identity_links
          where identity_links.app_user_id = app_favorites.app_user_id
            and identity_links.provider = 'supabase_auth'
            and identity_links.auth_user_id = auth.uid()
        )
      );
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'app_favorites' and policyname = 'users can insert own app favorites'
  ) then
    create policy "users can insert own app favorites"
      on public.app_favorites
      for insert
      to authenticated
      with check (
        exists (
          select 1
          from public.identity_links
          where identity_links.app_user_id = app_favorites.app_user_id
            and identity_links.provider = 'supabase_auth'
            and identity_links.auth_user_id = auth.uid()
        )
      );
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'app_favorites' and policyname = 'users can delete own app favorites'
  ) then
    create policy "users can delete own app favorites"
      on public.app_favorites
      for delete
      to authenticated
      using (
        exists (
          select 1
          from public.identity_links
          where identity_links.app_user_id = app_favorites.app_user_id
            and identity_links.provider = 'supabase_auth'
            and identity_links.auth_user_id = auth.uid()
        )
      );
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'app_favorites' and policyname = 'admins can read app favorites'
  ) then
    create policy "admins can read app favorites"
      on public.app_favorites
      for select
      to authenticated
      using (public.is_platform_admin(auth.uid()));
  end if;
end $$;
