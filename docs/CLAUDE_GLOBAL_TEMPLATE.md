# Global CLAUDE.md Template

Suggested path: `~/.claude/CLAUDE.md`

Use this only if you want these rules to apply to all projects. Global memory is powerful but blunt; prefer project-level `./CLAUDE.md` for project-specific architecture.

```md
# Global Claude Code Rules

## Default Language

- Communicate with me in Chinese by default unless I ask otherwise.
- Keep code identifiers, file names, commit messages, and API names in concise English.

## Working Style

- Be proactive, but do not make irreversible or global changes without explicit confirmation.
- For non-trivial tasks, first inspect the repository and existing conventions.
- Prefer small, verifiable changes over one-shot rewrites.
- Explain important tradeoffs and residual risks clearly.
- Do not claim production readiness unless checks have run and risks are documented.

## Git Safety

- Never run destructive commands like `git reset --hard`, `git checkout --`, or force push unless I explicitly ask.
- Do not amend commits unless I explicitly ask.
- Preserve unrelated user changes.
- Commit after meaningful milestones when requested or when the workflow clearly expects versioning.

## Tool / MCP Policy

- Use GitHub tools for issues, PRs, CI, review, and release workflows.
- Use Browser Use for local/preview web UI inspection and screenshots.
- Use official docs or trusted primary sources before integrating third-party libraries.
- Do not treat MCP tools as application runtime dependencies.

## Security Defaults

- Never put secrets in frontend code or committed files.
- Validate user input at server/API boundaries.
- Treat user data, location, uploaded files, auth state, and analytics as privacy-sensitive.
- Prefer least privilege for database and storage policies.

## Testing Defaults

- Run the project’s documented check/test command before committing.
- If no test command exists, identify that gap and add one when reasonable.
- For complex logic, prefer TDD or add tests/checks alongside implementation.
```
