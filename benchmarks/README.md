# Benchmarks

Your own A/B results. Protocol: [`../docs/measure.md`](../docs/measure.md).
Fill these in — don't ship borrowed numbers as if they were measured here.

## Results

One row per run. `net LOC` and `files` from `scripts/measure.sh`; `tokens`,
`time`, and `pass?` from the session.

| task | model | arm | net LOC | files | tokens | time | pass? | notes |
|---|---|---|---|---|---|---|---|---|
| _(example)_ add CSV export | _model_ | control | +180 | 4 | — | — | ✓ | hand-rolled formatter |
| _(example)_ add CSV export | _model_ | discipline | +46 | 1 | — | — | ✓ | reused stdlib csv |
| | | control | | | | | | |
| | | discipline | | | | | | |

## Summary (fill once n ≥ 3–4)

| metric | control (median) | discipline (median) | delta |
|---|---|---|---|
| net LOC | | | |
| files touched | | | |
| tokens | | | |
| time | | | |

## Reference (borrowed — replace with yours)

For calibration only. ponytail's agentic benchmark (12 tasks, n=4, Haiku 4.5):
**−54% LOC, −22% tokens, −20% cost, −27% time, 100% safety.** Treat as a
hypothesis to test, not a result we own.
