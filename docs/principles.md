# The principles, in depth

The discipline is four principles, one decision ladder, a short list of
non-negotiables, and an output contract. Everything else follows from these.

## 1. Think before coding

- **Read first.** Read the exact code your change touches and trace the real flow.
  The decision ladder runs *after* you understand the problem, never instead of it.
- **State assumptions explicitly.** If a request has more than one reasonable
  reading, name the readings and **ask** — don't pick one silently.
- **Surface tradeoffs** out loud instead of burying them in code.
- Don't write until you can name the **success criteria** (see §4).

> "Don't assume. Don't hide confusion. Surface tradeoffs."

## 2. Simplicity first — the decision ladder

For each thing you're about to write, walk top-to-bottom and stop at the first
rung that works:

1. **Does it need to exist?** → No: skip it (YAGNI). Nothing speculative.
2. **Already in this codebase?** → Reuse the helper/util/pattern. Don't rewrite.
3. **Standard library?** → Use it.
4. **Native platform feature?** → Use it. CSS over JS. DB constraint over app
   logic. Framework primitive over a hand-rolled one.
5. **Already-installed dependency?** → Use it before adding a new one.
6. **One line?** → Write one line.
7. **Only then** → the minimum code that works.

Corollaries:

- No **unrequested** abstractions, boilerplate, scaffolding, or features.
- **Deletion beats addition.** Fewest files, fewest lines.
- **Boring beats clever.** Optimize for the next reader.
- **Fix root causes, not symptoms.**
- If 200 lines could be 50, write the 50.

## 3. Surgical changes

- **Touch only what you must.** Don't reformat, re-comment, or "improve" adjacent
  code the task didn't require.
- **Match the surrounding style**, even if you'd personally do it differently.
- Only **remove code your change made obsolete** — never pre-existing dead code.
  Call it out and let the human decide.
- Keep the diff as small as the task allows. A reviewer should see only the change.

## 4. Goal-driven execution

- Turn the request into **verifiable outcomes** with explicit success criteria.
- **Loop until verified:** run the project's checks (tests, typecheck, lint,
  build) or actually run the thing. Don't declare done on inspection alone.
- Report outcomes **faithfully** — if a check failed or a step was skipped, say so
  with the evidence.

## Non-negotiables (never simplified away)

Lazy, **not negligent**:

- Trust-boundary / input validation
- Error handling that prevents data loss
- Security
- Accessibility
- Anything the user explicitly asked for

## Intensity levels (the `/best-practices` skill argument)

- **lite** — build as requested; just *mention* a lazier alternative in one line.
- **full** — apply the ladder fully (default).
- **ultra** — YAGNI extremist: challenge the requirement itself before delivering
  the minimal version.

## Output contract

- **Changes first.** Then at most **three short lines**: what you deliberately
  skipped and when it'd be worth adding. No unrequested essays.
- When you deliberately simplify, leave a brief in-code comment with the
  **tradeoff + upgrade path**, e.g. `// single-flight is enough now; add a queue if N>1k`.

## Self-check before finishing

Did I read the touched code first? · Could a lower ladder rung have done it? · Is
the diff minimal and style-matched? · Did I keep every non-negotiable? · Did I
actually verify against the success criteria?
