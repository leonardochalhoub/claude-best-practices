---
description: Review the current git diff against the best-practices discipline (over-engineering, decision ladder, surgical diff, verification, non-negotiables). Pass --fix to apply high-confidence simplifications.
argument-hint: "[base-ref] [--fix]"
allowed-tools: Bash, Read, Grep, Glob, Edit
---

Review the working changes through the **/best-practices** discipline (decision
ladder + the four principles). Be lazy about the solution, diligent about reading.

## Scope the diff

```
git diff --stat ${1:-HEAD}
git diff ${1:-HEAD}
```
Read the changed files and trace the real flow before judging. If `$ARGUMENTS`
names a base ref, diff against it; otherwise use the working tree vs `HEAD`.

## Check each change

For every hunk, ask the ladder: did it need to exist (YAGNI)? Could it reuse
something already here? Stdlib / native feature / installed dep / one line? Then:

- **Over-engineering** — unrequested abstractions, speculative options, a
  framework where a function would do, a re-implementation of an existing helper.
- **Surgical?** — only what the task needs; style matched; no formatting/comment
  noise; only obsolete code removed (flag pre-existing dead code, don't delete it).
- **Verified?** — are there success criteria? do tests/typecheck/lint cover it?
- **Non-negotiables intact?** — input/trust-boundary validation, data-loss/error
  handling, security, accessibility, and anything explicitly requested are
  **never** simplified away. Flag any that were.

## Output

```
Verdict: <1-2 lines — lean? where does it bleed?>

## Over-engineering found
- [critical|medium|low · confidence X] file:line — <what> → <ladder rung that solved it>

## Non-negotiables: <ok | violation at file:line>
```

## If `--fix` is in $ARGUMENTS

Apply only the **high-confidence, low-risk, behavior-preserving** simplifications
surgically (minimal diff, match style). Then **verify**: run the project's
`typecheck` / `lint` / `test` (detect from package.json / Makefile / Cargo.toml).
Revert any change that breaks a check. Leave larger/riskier refactors as
proposals — don't ship them by surprise. Report changes first, then ≤3 lines on
what you skipped and when to add it.
