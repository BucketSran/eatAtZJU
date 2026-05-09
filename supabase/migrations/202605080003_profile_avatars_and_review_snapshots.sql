alter table public.app_users
  add column if not exists avatar_type text not null default 'preset' check (avatar_type in ('preset', 'custom')),
  add column if not exists avatar_preset text not null default 'rice';

alter table public.reviews
  add column if not exists avatar_snapshot jsonb not null default jsonb_build_object(
    'type', 'preset',
    'preset', 'rice',
    'text', '饭',
    'color', '#f0aa38'
  );

create index if not exists app_users_primary_channel_idx on public.app_users(primary_channel);
create index if not exists reviews_avatar_snapshot_gin_idx on public.reviews using gin(avatar_snapshot);
