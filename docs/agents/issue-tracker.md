# Issue tracker: GitHub

Issues and PRDs for this repo live as GitHub Issues in `BucketSran/eatAtZJU`. Use the `gh` CLI for all issue operations from inside this clone.

## Conventions

- **Create an issue**: `gh issue create --title "..." --body "..."`. Use a heredoc or temporary file for multi-line bodies.
- **Read an issue**: `gh issue view <number> --comments`, and fetch labels when triaging.
- **List issues**: `gh issue list --state open --json number,title,body,labels,comments` with appropriate `--label` and `--state` filters.
- **Comment on an issue**: `gh issue comment <number> --body "..."`
- **Apply / remove labels**: `gh issue edit <number> --add-label "..."` / `--remove-label "..."`
- **Close**: `gh issue close <number> --comment "..."`

`gh` should infer the repository from `git remote -v`, which points to `https://github.com/BucketSran/eatAtZJU.git`.

## When a skill says "publish to the issue tracker"

Create a GitHub issue unless the user explicitly asks for a local markdown draft instead.

## When a skill says "fetch the relevant ticket"

Run `gh issue view <number> --comments`.
