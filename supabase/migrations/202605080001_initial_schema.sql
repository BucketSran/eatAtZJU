create extension if not exists pgcrypto;

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create table if not exists public.admin_users (
  user_id uuid primary key references auth.users(id) on delete cascade,
  role text not null check (role in ('moderator', 'admin')),
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now()
);

alter table public.admin_users enable row level security;

create or replace function public.is_platform_admin(uid uuid default auth.uid())
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.admin_users
    where user_id = uid
      and role in ('moderator', 'admin')
  );
$$;

revoke all on function public.is_platform_admin(uuid) from public;
grant execute on function public.is_platform_admin(uuid) to authenticated;

create policy "admins can read admin users"
  on public.admin_users
  for select
  to authenticated
  using (public.is_platform_admin(auth.uid()));

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default 'ZJU student',
  avatar_url text,
  preferences text[] not null default array[]::text[],
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint profiles_display_name_length check (char_length(display_name) between 1 and 40),
  constraint profiles_preferences_length check (coalesce(array_length(preferences, 1), 0) <= 20)
);

create trigger set_profiles_updated_at
  before update on public.profiles
  for each row execute function public.set_updated_at();

alter table public.profiles enable row level security;

create policy "users can read own profile"
  on public.profiles
  for select
  to authenticated
  using (auth.uid() = id);

create policy "users can insert own profile"
  on public.profiles
  for insert
  to authenticated
  with check (auth.uid() = id);

create policy "users can update own profile"
  on public.profiles
  for update
  to authenticated
  using (auth.uid() = id)
  with check (auth.uid() = id);

create table if not exists public.user_trust (
  user_id uuid primary key references auth.users(id) on delete cascade,
  campus_email text,
  campus_email_verified boolean not null default false,
  credit_score integer not null default 50 check (credit_score between 0 and 100),
  contribution_count integer not null default 0 check (contribution_count >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger set_user_trust_updated_at
  before update on public.user_trust
  for each row execute function public.set_updated_at();

alter table public.user_trust enable row level security;

create policy "users can read own trust status"
  on public.user_trust
  for select
  to authenticated
  using (auth.uid() = user_id);

create policy "admins can read trust status"
  on public.user_trust
  for select
  to authenticated
  using (public.is_platform_admin(auth.uid()));

create table if not exists public.restaurants (
  id text primary key,
  name text not null,
  canonical_name text not null,
  aliases text[] not null default array[]::text[],
  area text not null,
  distance numeric(5,2) not null check (distance >= 0),
  walk_minutes integer not null check (walk_minutes >= 0),
  cuisine text not null,
  price integer not null check (price > 0 and price < 1000),
  rating numeric(2,1) not null default 0 check (rating >= 0 and rating <= 5),
  student_score integer not null default 0 check (student_score between 0 and 100),
  checkins integer not null default 0 check (checkins >= 0),
  latitude numeric(9,6) not null check (latitude between -90 and 90),
  longitude numeric(9,6) not null check (longitude between -180 and 180),
  cover_icon text not null,
  cover_color text not null,
  tags text[] not null default array[]::text[],
  suited_for text[] not null default array[]::text[],
  service_modes text[] not null default array[]::text[],
  meal_periods text[] not null default array[]::text[],
  scenario_tags text[] not null default array[]::text[],
  constraint_tags text[] not null default array[]::text[],
  preference_tags text[] not null default array[]::text[],
  reason text not null,
  source_refs jsonb not null default '[]'::jsonb,
  status text not null default 'draft' check (status in ('draft', 'published', 'archived')),
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists restaurants_status_idx on public.restaurants(status);
create index if not exists restaurants_tags_idx on public.restaurants using gin(tags);
create index if not exists restaurants_service_modes_idx on public.restaurants using gin(service_modes);
create index if not exists restaurants_meal_periods_idx on public.restaurants using gin(meal_periods);
create index if not exists restaurants_scenario_tags_idx on public.restaurants using gin(scenario_tags);
create index if not exists restaurants_constraint_tags_idx on public.restaurants using gin(constraint_tags);
create index if not exists restaurants_preference_tags_idx on public.restaurants using gin(preference_tags);
create index if not exists restaurants_area_idx on public.restaurants(area);

create trigger set_restaurants_updated_at
  before update on public.restaurants
  for each row execute function public.set_updated_at();

alter table public.restaurants enable row level security;

create policy "anyone can read published restaurants"
  on public.restaurants
  for select
  to anon, authenticated
  using (status = 'published');

create policy "admins can manage restaurants"
  on public.restaurants
  for all
  to authenticated
  using (public.is_platform_admin(auth.uid()))
  with check (public.is_platform_admin(auth.uid()));

create table if not exists public.dishes (
  id text primary key,
  restaurant_id text not null references public.restaurants(id) on delete cascade,
  name text not null,
  price integer not null check (price > 0 and price < 1000),
  heat integer not null default 0 check (heat between 0 and 100),
  tags text[] not null default array[]::text[],
  status text not null default 'draft' check (status in ('draft', 'published', 'archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists dishes_restaurant_id_idx on public.dishes(restaurant_id);
create index if not exists dishes_status_idx on public.dishes(status);

create trigger set_dishes_updated_at
  before update on public.dishes
  for each row execute function public.set_updated_at();

alter table public.dishes enable row level security;

create policy "anyone can read published dishes"
  on public.dishes
  for select
  to anon, authenticated
  using (
    status = 'published'
    and exists (
      select 1 from public.restaurants
      where restaurants.id = dishes.restaurant_id
        and restaurants.status = 'published'
    )
  );

create policy "admins can manage dishes"
  on public.dishes
  for all
  to authenticated
  using (public.is_platform_admin(auth.uid()))
  with check (public.is_platform_admin(auth.uid()));

create table if not exists public.reviews (
  id text primary key default ('rv_' || replace(gen_random_uuid()::text, '-', '')),
  restaurant_id text not null references public.restaurants(id) on delete cascade,
  user_id uuid references auth.users(id) on delete set null,
  display_name_snapshot text not null default 'ZJU student',
  rating integer not null check (rating between 1 and 5),
  text text not null check (char_length(text) between 1 and 500),
  tags text[] not null default array[]::text[],
  status text not null default 'pending' check (status in ('pending', 'approved', 'rejected')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists reviews_restaurant_id_idx on public.reviews(restaurant_id);
create index if not exists reviews_user_id_idx on public.reviews(user_id);
create index if not exists reviews_status_idx on public.reviews(status);

create trigger set_reviews_updated_at
  before update on public.reviews
  for each row execute function public.set_updated_at();

alter table public.reviews enable row level security;

create policy "anyone can read approved reviews"
  on public.reviews
  for select
  to anon, authenticated
  using (status = 'approved');

create policy "users can read own reviews"
  on public.reviews
  for select
  to authenticated
  using (auth.uid() = user_id);

create policy "users can submit pending reviews"
  on public.reviews
  for insert
  to authenticated
  with check (
    auth.uid() = user_id
    and status = 'pending'
    and exists (
      select 1 from public.restaurants
      where restaurants.id = reviews.restaurant_id
        and restaurants.status = 'published'
    )
  );

create policy "users can update own pending reviews"
  on public.reviews
  for update
  to authenticated
  using (auth.uid() = user_id and status = 'pending')
  with check (
    auth.uid() = user_id
    and status = 'pending'
    and exists (
      select 1 from public.restaurants
      where restaurants.id = reviews.restaurant_id
        and restaurants.status = 'published'
    )
  );

create policy "admins can manage reviews"
  on public.reviews
  for all
  to authenticated
  using (public.is_platform_admin(auth.uid()))
  with check (public.is_platform_admin(auth.uid()));

create table if not exists public.favorites (
  user_id uuid not null references auth.users(id) on delete cascade,
  restaurant_id text not null references public.restaurants(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, restaurant_id)
);

create index if not exists favorites_restaurant_id_idx on public.favorites(restaurant_id);

alter table public.favorites enable row level security;

create policy "users can read own favorites"
  on public.favorites
  for select
  to authenticated
  using (auth.uid() = user_id);

create policy "users can insert own favorites"
  on public.favorites
  for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "users can delete own favorites"
  on public.favorites
  for delete
  to authenticated
  using (auth.uid() = user_id);

create table if not exists public.submissions (
  id text primary key default ('sub_' || replace(gen_random_uuid()::text, '-', '')),
  type text not null check (type in ('restaurant', 'dish', 'review', 'checkin', 'correction')),
  payload jsonb not null,
  submitter_id uuid not null references auth.users(id) on delete cascade,
  status text not null default 'pending' check (status in ('pending', 'approved', 'rejected')),
  reviewer_id uuid references auth.users(id) on delete set null,
  review_note text,
  created_at timestamptz not null default now(),
  reviewed_at timestamptz,
  updated_at timestamptz not null default now(),
  constraint submissions_payload_object check (jsonb_typeof(payload) = 'object'),
  constraint submissions_payload_size check (octet_length(payload::text) <= 20000)
);

create index if not exists submissions_submitter_id_idx on public.submissions(submitter_id);
create index if not exists submissions_status_idx on public.submissions(status);
create index if not exists submissions_type_idx on public.submissions(type);

create trigger set_submissions_updated_at
  before update on public.submissions
  for each row execute function public.set_updated_at();

alter table public.submissions enable row level security;

create policy "users can read own submissions"
  on public.submissions
  for select
  to authenticated
  using (auth.uid() = submitter_id);

create policy "users can create pending submissions"
  on public.submissions
  for insert
  to authenticated
  with check (
    auth.uid() = submitter_id
    and status = 'pending'
    and reviewer_id is null
    and reviewed_at is null
  );

create policy "admins can manage submissions"
  on public.submissions
  for all
  to authenticated
  using (public.is_platform_admin(auth.uid()))
  with check (public.is_platform_admin(auth.uid()));

create table if not exists public.audit_logs (
  id text primary key default ('aud_' || replace(gen_random_uuid()::text, '-', '')),
  actor_id uuid references auth.users(id) on delete set null,
  action text not null,
  target_table text not null,
  target_id text not null,
  before_data jsonb,
  after_data jsonb,
  reason text,
  created_at timestamptz not null default now()
);

create index if not exists audit_logs_actor_id_idx on public.audit_logs(actor_id);
create index if not exists audit_logs_target_idx on public.audit_logs(target_table, target_id);

alter table public.audit_logs enable row level security;

create policy "admins can read audit logs"
  on public.audit_logs
  for select
  to authenticated
  using (public.is_platform_admin(auth.uid()));

create policy "admins can insert audit logs"
  on public.audit_logs
  for insert
  to authenticated
  with check (public.is_platform_admin(auth.uid()));
