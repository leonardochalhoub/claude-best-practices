# Sources & credits

This repo is a synthesis, not original research. Full credit to:

## ponytail — the decision ladder + non-negotiables

- Repo: https://github.com/DietrichGebert/ponytail · License: MIT
- Philosophy: "The best code is the code you never wrote." Lazy about the
  solution, never about reading.
- Contributes: the 7-rung **decision ladder**, the **non-negotiables**
  ("Lazy, not negligent: trust-boundary validation, data-loss handling,
  security, and accessibility are never on the chopping block"), the
  **intensity levels** (lite / full / ultra), and the **output format**
  (code first, then ≤3 lines on what was skipped).
- Commands in the original plugin: `/ponytail [lite|full|ultra|off]`,
  `/ponytail-review`, `/ponytail-audit`, `/ponytail-debt`, `/ponytail-gain`.

### Metrics (as reported by ponytail)

Agentic benchmark — real Claude Code sessions, 12 feature tasks, n=4, Haiku 4.5:

| Metric | Result |
|---|---|
| Lines of code | **−54%** (up to −94%) |
| Tokens | **−22%** |
| Cost | **−20%** |
| Time | **−27%** |
| Safety | **100%** |

Older single-shot numbers ("80–94% less code") are flagged by the author as
inflated by conversational padding. Anchor on the agentic figures, and measure
in your own project.

## Andrej Karpathy skills — the four principles

- Repo: https://github.com/multica-ai/andrej-karpathy-skills
- A `CLAUDE.md` addressing four LLM-coder failure modes: unjustified assumptions,
  overcomplication, unintended edits, lack of verification.
- Contributes the four principles: **Think Before Coding**, **Simplicity First**
  ("if 200 lines could be 50, rewrite it"), **Surgical Changes** ("don't 'improve'
  adjacent code… match existing style"), **Goal-Driven Execution**.
- Reported to help agent performance materially when always loaded as a `CLAUDE.md`.

## What this repo adds

- A single **synthesis** of both, deduplicated and made consistent.
- A ready-to-use **`/best-practices` skill** and a **`claude-best-practices-specialist`
  subagent** (reviews *and* applies, then verifies).
- An **adoption path** (`install.sh` + `docs/adopt.md`) so existing and new
  projects can pull from one lighthouse and stay in sync.
