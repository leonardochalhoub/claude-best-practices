# Operational discipline

The four principles say *how to write the code*. This is *how to run the loop
around it* — the concrete, language-agnostic moves that keep an agent honest.

Much of this is distilled from [`rtk-ai/rtk`](https://github.com/rtk-ai/rtk)'s
`CLAUDE.md` and `CONTRIBUTING.md` (credit in [`sources.md`](sources.md)).

## Before you start

- **Orient.** Run `pwd` and `git branch` (or your stack's equivalent). Never
  assume the working directory or the branch.
- **Name the success criteria** before writing (what command/test proves it works).

## The verify-gate (before "done" and before commit)

Run the project's full check and make it **all pass** — never commit code that
fails any of them:

```
format check  &&  lint (zero warnings)  &&  tests
```

- **Zero tolerance on lint warnings** — fix them, don't suppress them.
- **Tests pass, then run the thing** — manual runtime verification catches what
  unit tests don't.
- If a check fails, **report it with the output** — don't declare done.

## Anti-rabbit-hole

Staying lazy about the solution means not getting lost verifying it:

- **Cap exploratory verification** at ~3–4 commands. If you're past that and
  still unsure, **stop and ask** instead of spelunking.
- **Trust the tests.** Don't hand-verify 20 edge cases a snapshot test covers.
- **Don't clone/deep-read external repos** for an API signature — use the docs.
- Don't research framework/tooling internals beyond what the task needs.

## Graceful degradation

When an internal optimization or filter fails, **fall back to the safe default**
rather than erroring out — never break the user's flow over your own machinery.
(rtk's rule: "if filtering fails, execute the raw command unchanged.")

## One change per PR

The surgical principle, at PR granularity:

- **Each PR is a single feature/fix/change.** Out-of-scope refactors and
  drive-by fixes go in **separate** PRs.
- Split large features into **logical, independently-mergeable** chunks.
- Commit **after each logical step** in a multi-step plan; report blockers
  instead of skipping or reordering steps.

## Commits & comments

- **Conventional commits**, written for the reader: `<type>(<scope>): <desc>`
  (`feat`/`fix`/`perf`/`refactor`/`docs`/`chore`, `!` for breaking). Assume the
  message becomes a changelog entry a user will read.
- **Comments explain *why*, never *what*.** If the code already says it, delete
  the comment. Mark deliberate simplifications with the tradeoff + upgrade path.
- **Respect the existing folder structure and style.** Don't reorganize as a
  side effect.

## Plans with 3+ steps

Track them (a todo list / task tracker). Follow the numbered plan in order,
commit per step, and don't silently reorder — surface blockers.
