# Claude Best Practices 🗼

> A lighthouse for coding with AI agents. **Lazy about the solution, never about reading.**

A small, opinionated, **living** set of practices that make AI coding agents
(Claude Code, Agent SDK, and friends) write *less* code, *better* — without
cutting the things that must never be cut. Drop it into any project, or make it
global so every project inherits it.

It is a synthesis of two excellent sources (full credit in [`docs/sources.md`](docs/sources.md)):

- **[DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail)** — the simplicity-first *decision ladder* and the non-negotiables.
- **[multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills)** — the four principles that fix the common LLM-coder failure modes.

## Why

LLM coding agents fail in four recurring ways:

1. **Unjustified assumptions** — proceed without verifying understanding.
2. **Overcomplication** — abstractions and code nobody asked for.
3. **Unintended edits** — changes to code the task never touched.
4. **No verification** — "done" declared on inspection, not evidence.

This repo encodes the discipline that removes those failure modes.

## The discipline (TL;DR)

**1. Think before coding.** Read the code you'll touch and trace the real flow
first. State assumptions; if ambiguous, **ask** — don't guess silently.

**2. Simplicity first — the decision ladder.** For each thing you're about to
write, stop at the first rung that works:

```
1. Does it need to exist?   → no: skip it (YAGNI)
2. Already in the codebase?  → reuse, don't rewrite
3. Standard library?         → use it
4. Native platform feature?  → use it (CSS > JS, DB constraint > app logic)
5. Installed dependency?      → use it before adding a new one
6. One line?                  → one line
7. Only then:                 → the minimum that works
```

**3. Surgical changes.** Touch only what the task needs. Match existing style.
Don't "improve" adjacent code. Only remove code your change made obsolete.

**4. Goal-driven execution.** Turn the request into verifiable success criteria,
then loop until they pass (tests / typecheck / lint / run it). Report honestly.

**Never simplified away:** input/trust-boundary validation, error handling that
prevents data loss, security, accessibility, and anything explicitly requested.

**Output:** changes first, then ≤3 lines on what you skipped and when to add it.
Mark deliberate simplifications with a comment (tradeoff + upgrade path).

See [`docs/principles.md`](docs/principles.md) for the full version.

## What's in here

| Path | What it is |
|---|---|
| [`CLAUDE.md`](CLAUDE.md) | Drop-in, **always-on** rules. Copy into a project root or your global `~/.claude/CLAUDE.md`. |
| [`skills/best-practices/`](skills/best-practices/SKILL.md) | The `/best-practices` skill (`lite` / `full` / `ultra`). On-demand deep application. |
| [`agents/`](agents/claude-best-practices-specialist.md) | `claude-best-practices-specialist` — a subagent that **reviews diffs for over-engineering and applies surgical, verified fixes**. |
| [`commands/bp-review.md`](commands/bp-review.md) | `/bp-review [base] [--fix]` — run the discipline on the current diff. |
| [`examples/`](examples/README.md) | **Before/after** demos, one per ladder rung / principle. |
| [`docs/`](docs/) | [principles](docs/principles.md) · [workflow](docs/workflow.md) (verify-gate, anti-rabbit-hole, one-PR) · [sources](docs/sources.md) · [adopt](docs/adopt.md) |
| [`install.sh`](install.sh) | One command to install the skill + agent + command globally or into a project. |

## Adopt it

```bash
# Global — every project inherits the skill + agent:
./install.sh --global

# A specific project:
./install.sh /path/to/your/project
```

Three adoption models and what each touches are in [`docs/adopt.md`](docs/adopt.md).

## Honest metrics

ponytail's *agentic* benchmark (12 feature tasks, Haiku 4.5): **−54% LOC,
−22% tokens, −20% cost, −27% time, 100% safety.** Its older "80–94% less code"
single-shot figures are noted by the author as inflated by conversational
padding — anchor on the agentic numbers. Your mileage will vary; measure.

## Living document

This is meant to be **updated**. When you learn a practice worth keeping, add it
here (and bump the version in `CLAUDE.md`'s header). Projects that adopt it via
submodule or `install.sh --link` get updates for free.

## License

MIT — see [`LICENSE`](LICENSE). Built on MIT-licensed sources; credit preserved
in [`docs/sources.md`](docs/sources.md).
