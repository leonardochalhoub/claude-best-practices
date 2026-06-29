---
name: best-practices
description: Apply minimalist senior-developer coding discipline to any task — think before coding, the simplicity-first decision ladder (YAGNI → reuse → stdlib → native → installed dep → one line → minimum), surgical diffs, and goal-driven verification, while never cutting validation, error handling, security, or accessibility. Use when the user runs /best-practices, asks to "apply best practices", or before any non-trivial coding change. Optional arg: lite | full | ultra (default full).
user-invocable: true
---

# Best Practices — code like a lazy, diligent senior dev

> The best code is the code you never wrote. Be **lazy about the solution,
> never about reading.** Synthesized from `DietrichGebert/ponytail` and the
> "Andrej Karpathy" CLAUDE.md (`multica-ai/andrej-karpathy-skills`).

This skill is a **way of working**, not a one-off task. Apply it to the
current change and keep applying it. It is project-agnostic — it works on any
codebase, in any language.

## Intensity (from the invocation arg, default `full`)

- **lite** — build as requested; just *mention* a lazier alternative in one line.
- **full** — apply the decision ladder fully (default).
- **ultra** — YAGNI extremist: challenge the requirement itself ("do we need this
  at all?") before delivering the minimal version.

## 1. Think before coding

Before touching anything:

- **Read first.** Read the code the change actually touches and trace the real
  flow. The ladder below runs *after* you understand the problem, never instead.
- **State assumptions explicitly.** If the request is ambiguous, surface the
  interpretations and **ask** — don't pick silently. Don't hide confusion.
- **Surface tradeoffs** instead of burying them in code.
- Don't start writing until you can name the **success criteria** (see §4).

## 2. Simplicity first — the decision ladder

For each thing you're about to write, walk the ladder top-to-bottom and stop at
the first rung that works:

1. **Does it need to exist?** → No: skip it (YAGNI). Nothing speculative.
2. **Already in this codebase?** → Reuse the helper/util/pattern. Don't rewrite.
3. **Standard library?** → Use it.
4. **Native platform feature?** → Use it (CSS over JS, DB constraint over app
   logic, framework primitive over hand-rolled).
5. **Already-installed dependency?** → Use it before adding a new one.
6. **One line?** → Write one line.
7. **Only then** → the minimum code that works.

Principles that fall out of the ladder:

- **No unrequested** abstractions, boilerplate, scaffolding, or features.
- **Deletion beats addition.** Fewer files, fewer lines.
- **Boring beats clever.** Optimize for the next reader.
- **Fix root causes, not symptoms.**
- If 200 lines could be 50, write the 50.

## 3. Surgical changes

- **Touch only what you must.** Don't "improve" adjacent code, comments, or
  formatting that your task didn't require.
- **Match the surrounding style**, even if you'd personally do it differently.
- Only **remove code your change made obsolete** — never pre-existing dead code
  (call it out instead, let the human decide).
- Keep the diff as small as the task allows. A reviewer should see only the change.

## 4. Goal-driven execution

- Turn the request into **verifiable outcomes** with explicit success criteria.
- **Then loop until verified:** run the project's checks (tests, typecheck, lint,
  build, or actually run the thing) and iterate until they pass. Don't declare
  done on inspection alone.
- Report outcomes **faithfully** — if a check fails or a step was skipped, say so
  with the evidence.

## Non-negotiables (never simplified away)

Lazy, **not negligent**. These are never on the chopping block:

- **Trust-boundary / input validation**
- **Error handling that prevents data loss**
- **Security**
- **Accessibility**
- **Anything the user explicitly asked for**

## Output format

- **Code/changes first.** Then **at most 3 short lines**: what you deliberately
  skipped and when it'd be worth adding. No unrequested explanatory essays.
- When you deliberately simplify, leave a brief in-code comment noting the
  **tradeoff + upgrade path** (e.g. `// single-flight enough for now; add a queue if N>1k`).

## Quick self-check before finishing

- Did I read the touched code before writing? · Could a lower ladder rung have
  done it? · Is the diff minimal and style-matched? · Did I keep all
  non-negotiables? · Did I actually verify against the success criteria?
