# Training Hub — rules for Claude Code

Static site on GitHub Pages. The only backend is Supabase, used for the feedback form.
The `feedback` table is SHARED with tony37uk/ai-training-hub — keep both repos' feedback code
and `supabase/security.sql` in step.

## Security rules (always follow)

- **Every new Supabase table needs explicit GRANTs.** Since 30 Oct 2026 Supabase no longer
  grants Data API access to new tables automatically. Put the `grant` statements in the same
  SQL that creates the table, plus `alter table ... enable row level security` and policies.
- **Row Level Security on every table.** Never add a policy like `for all to anon using (true)`.
  The public (anon) key is visible in the page source, so treat anything it can do as
  something anyone on the internet can do.
- **feedback table:** the public can only INSERT. Reading, updating and deleting require the
  admin to be signed in on `feedback-submissions.html`. The rules live in
  `supabase/security.sql` — update that file if the table changes.
- **Never commit secrets.** Only the publishable/anon key may appear in the code. Never put the
  `service_role` key, passwords or the admin email in this repo.
- **Escape user content.** Anything that came from a user (feedback name, type, message) must
  go through `escHtml()` before being placed in `innerHTML`.
- **New-tab links** use `target="_blank" rel="noopener noreferrer"`.
- Keep the form's `maxlength` values in step with the length limits in `supabase/security.sql`.
