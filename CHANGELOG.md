# Changelog

All notable changes to this project. Format: [Keep a Changelog](https://keepachangelog.com/),
versioning is [SemVer](https://semver.org/). Keep entries written for a reader.

## [Unreleased]

## [1.1.0] — 2026-06-29

### Added
- `docs/workflow.md` — operational discipline (verify-gate, pre-work checks,
  anti-rabbit-hole, one-PR-one-change, conventional commits), distilled from
  [`rtk-ai/rtk`](https://github.com/rtk-ai/rtk).
- `examples/` — before/after demos, one per ladder rung / principle.
- `commands/bp-review.md` — `/bp-review` slash command to review (and `--fix`)
  the current diff against the discipline.
- `CONTRIBUTING.md`, `CHANGELOG.md`, and a CI offline link check.
- `rtk-ai/rtk` credited in `docs/sources.md`.

### Changed
- De-branded the specialist agent to a project-neutral version for universal
  adoption.
- `install.sh` now also vendors `commands/`.

## [1.0.0] — 2026-06-29

### Added
- Initial lighthouse: `README.md`, drop-in `CLAUDE.md`, the `/best-practices`
  skill (`lite`/`full`/`ultra`), the `claude-best-practices-specialist` agent,
  `docs/` (principles · sources · adopt), `install.sh`, MIT `LICENSE`.
- Synthesis of [`DietrichGebert/ponytail`](https://github.com/DietrichGebert/ponytail)
  (decision ladder, non-negotiables) and
  [`multica-ai/andrej-karpathy-skills`](https://github.com/multica-ai/andrej-karpathy-skills)
  (the four principles).
