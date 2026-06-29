# Contributing

This repo practices what it preaches: keep changes **small, boring, and
verified.** A change that adds a rule should itself follow the rules.

## What belongs here

Project-agnostic practices for coding with AI agents. If a rule only makes sense
in one stack, it belongs in that project's `.claude/`, not here.

## How to propose a change

1. **One change per PR.** A new practice, a fix, or an example — not three at
   once. Out-of-scope cleanups go in a separate PR.
2. **Keep it minimal.** If a paragraph could be a sentence, write the sentence.
   No speculative sections.
3. **Conventional commits**, written for a reader (they become the changelog):
   `feat: …`, `fix: …`, `docs: …`, `chore: …`, `!` for a breaking change.
4. **Verify before "done":** all relative links resolve (CI runs an offline
   link check), and any code snippet you add actually does what you claim.
5. **Update [`CHANGELOG.md`](CHANGELOG.md)** under `## [Unreleased]`.
6. **Credit your sources** in [`docs/sources.md`](docs/sources.md) — this repo is
   a synthesis; provenance matters.

## What we never water down

Even here, the non-negotiables hold: never publish guidance that trades away
input validation, data-loss/error handling, security, or accessibility for
brevity. "Lazy, not negligent."

## Layout

```
CLAUDE.md                       always-on rules (the summary)
skills/best-practices/          the /best-practices skill
agents/                         the specialist subagent
commands/                       slash commands (e.g. /bp-review)
docs/                           principles · workflow · sources · adopt
examples/                       before/after demos
install.sh                      vendor into a project or ~/.claude
```
