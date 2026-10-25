-- ════════════════════════════════════════════════════════════════════
-- Training Hub + AI Training Hub — shared feedback table security
--
-- What this does:
--   • Anyone (the public form) can ADD feedback, but cannot read,
--     edit or delete it.
--   • Only the admin (signed in on feedback-submissions.html) can
--     read, mark as actioned, or delete feedback.
--   • Limits the size of each field so the form can't be spammed
--     with huge messages.
--
-- How to run:
--   1. Replace every YOUR_ADMIN_EMAIL below (Find & Replace, 4 places)
--      with the email of the admin user you created in
--      Supabase → Authentication → Users. Do this in the SQL Editor
--      only — keep the placeholder in this file so your email isn't
--      published in the public repo.
--   2. Supabase dashboard → SQL Editor → paste this whole file → Run.
--   Safe to run more than once.
-- ════════════════════════════════════════════════════════════════════

-- 1. Turn on Row Level Security (nothing is allowed unless a policy says so)
alter table public.feedback enable row level security;

-- 2. Remove any old policies on this table so we start clean
do $$
declare p record;
begin
  for p in select policyname from pg_policies
           where schemaname = 'public' and tablename = 'feedback'
  loop
    execute format('drop policy %I on public.feedback', p.policyname);
  end loop;
end $$;

-- 3. Table-level permissions (explicit GRANTs, as Supabase now requires)
revoke all on public.feedback from anon, authenticated;
grant insert                         on public.feedback to anon, authenticated;
grant select, update, delete         on public.feedback to authenticated;
grant select, insert, update, delete on public.feedback to service_role;

-- 4. Policies
-- Public form: can insert new, un-actioned feedback only
create policy "public can submit feedback"
  on public.feedback for insert
  to anon, authenticated
  with check (coalesce(actioned, false) = false);

-- Admin only: read, update and delete
create policy "admin can read feedback"
  on public.feedback for select
  to authenticated
  using ((auth.jwt() ->> 'email') = 'YOUR_ADMIN_EMAIL');

create policy "admin can update feedback"
  on public.feedback for update
  to authenticated
  using      ((auth.jwt() ->> 'email') = 'YOUR_ADMIN_EMAIL')
  with check ((auth.jwt() ->> 'email') = 'YOUR_ADMIN_EMAIL');

create policy "admin can delete feedback"
  on public.feedback for delete
  to authenticated
  using ((auth.jwt() ->> 'email') = 'YOUR_ADMIN_EMAIL');

-- 5. Size limits (applied to new rows; existing rows are left alone)
alter table public.feedback drop constraint if exists feedback_name_len;
alter table public.feedback drop constraint if exists feedback_type_len;
alter table public.feedback drop constraint if exists feedback_message_len;

alter table public.feedback add constraint feedback_name_len
  check (char_length(name) <= 100) not valid;
alter table public.feedback add constraint feedback_type_len
  check (char_length(type) <= 60) not valid;
alter table public.feedback add constraint feedback_message_len
  check (char_length(message) between 1 and 2000) not valid;
