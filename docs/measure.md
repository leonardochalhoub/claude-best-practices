# Measuring the impact (make the numbers yours)

The headline numbers in [`sources.md`](sources.md) are **ponytail's**, not ours.
Don't quote borrowed numbers as if they were measured here — run your own A/B and
report what *you* see. This is how.

## The protocol

For a **real task** in a real repo:

1. **Freeze the start.** Note the starting commit. Write a one-paragraph task
   spec so both runs solve exactly the same thing.
2. **Run A — control.** Fresh agent session, discipline **off** (no `CLAUDE.md`
   best-practices block, no `/best-practices`). Finish the task on a branch.
3. **Run B — discipline.** Fresh session from the same start, discipline **on**
   (`CLAUDE.md` loaded and/or `/best-practices full`). Same task, same model.
4. **Record both** (table below). Repeat for **n ≥ 3–4 tasks** — single runs are
   noise.

## What to record per run

| Signal | How |
|---|---|
| **Net LOC** | `./scripts/measure.sh <start> <branch> <label>` (deterministic) |
| **Files touched** | same command |
| **Tokens / cost** | from the agent's own usage report at end of session |
| **Wall-clock** | start/stop time of the session |
| **Correctness** | did the project's tests/typecheck/lint pass? (a run that ships broken code doesn't count as "less code") |

## Honesty rules

- **Control for the variables:** same model, same task spec, same starting commit.
  A different model or a vaguer task invalidates the comparison.
- **Variance is large.** Report the spread (min/median/max), not one cherry-picked
  run. ponytail itself flags that its older single-shot numbers were inflated by
  conversational padding — learn from that.
- **Safety is a gate, not a metric.** Fewer lines only counts if the
  non-negotiables (validation, error handling, security, accessibility) survived
  and the checks pass.
- **Report failures too.** If the discipline *didn't* help on a task, that's a
  finding — write it down.

## Logging results

Append each task's rows to [`../benchmarks/README.md`](../benchmarks/README.md)
and, once you have a few, summarize the median deltas in the README so the
project's claims are backed by your own evidence.
