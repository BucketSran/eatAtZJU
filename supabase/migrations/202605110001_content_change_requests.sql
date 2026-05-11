create table if not exists public.content_change_requests (
  id text primary key default ('ccr_' || replace(gen_random_uuid()::text, '-', '')),
  action text not null check (action in ('demote', 'archive', 'edit', 'add')),
  status text not null default 'draft' check (status in ('draft', 'queued', 'materialized', 'rejected')),
  target_table text not null default 'restaurants' check (target_table in ('restaurants')),
  target_id text,
  target_name text not null,
  summary text not null,
  payload jsonb not null default '{}'::jsonb,
  submission_type text not null check (submission_type in ('restaurant', 'correction')),
  submission_payload jsonb not null default '{}'::jsonb,
  source_submission_id text references public.submissions(id) on delete set null,
  requester_id uuid references auth.users(id) on delete set null,
  reviewer_id uuid references auth.users(id) on delete set null,
  reviewed_at timestamptz,
  materialized_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint content_change_target_name_length check (char_length(target_name) between 1 and 120),
  constraint content_change_summary_length check (char_length(summary) between 1 and 1000),
  constraint content_change_payload_object check (jsonb_typeof(payload) = 'object'),
  constraint content_change_submission_payload_object check (jsonb_typeof(submission_payload) = 'object'),
  constraint content_change_payload_size check (octet_length(payload::text) <= 20000),
  constraint content_change_submission_payload_size check (octet_length(submission_payload::text) <= 20000)
);

create index if not exists content_change_requests_status_idx on public.content_change_requests(status);
create index if not exists content_change_requests_action_idx on public.content_change_requests(action);
create index if not exists content_change_requests_target_idx on public.content_change_requests(target_table, target_id);
create index if not exists content_change_requests_source_submission_idx on public.content_change_requests(source_submission_id);
create unique index if not exists content_change_requests_source_submission_unique_idx
  on public.content_change_requests(source_submission_id)
  where source_submission_id is not null;
create index if not exists content_change_requests_requester_idx on public.content_change_requests(requester_id);
create index if not exists content_change_requests_created_at_idx on public.content_change_requests(created_at desc);

create trigger set_content_change_requests_updated_at
  before update on public.content_change_requests
  for each row execute function public.set_updated_at();

alter table public.content_change_requests enable row level security;

create policy "admins can manage content change requests"
  on public.content_change_requests
  for all
  to authenticated
  using (public.is_platform_admin(auth.uid()))
  with check (public.is_platform_admin(auth.uid()));
