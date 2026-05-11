alter table public.submissions
  add column if not exists source_content_change_request_id text references public.content_change_requests(id) on delete set null;

alter table public.submissions
  drop constraint if exists submissions_status_check;

alter table public.submissions
  add constraint submissions_status_check
  check (status in ('pending', 'reviewing', 'approved', 'rejected'));

create unique index if not exists submissions_source_content_change_request_unique_idx
  on public.submissions(source_content_change_request_id)
  where source_content_change_request_id is not null;

alter table public.content_change_requests
  add column if not exists queued_at timestamptz,
  add column if not exists review_note text,
  add column if not exists materialized_target_table text,
  add column if not exists materialized_target_id text;

create index if not exists content_change_requests_materialized_target_idx
  on public.content_change_requests(materialized_target_table, materialized_target_id);
