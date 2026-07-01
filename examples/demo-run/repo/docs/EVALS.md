# EVALS

> The scoreboard. Success criteria must be frozen before results exist.

## Current slice gates

| Gate ID | Requirement | Verification command / method | Pass condition | Status |
| --- | --- | --- | --- | --- |
| `G-001` | `GET /health` returns 200. | `node --test` | Test passes. | `PASS` |
| `G-002` | Body matches frozen shape. | `node --test` | `status === "ok"` and `Number.isInteger(uptime_s)`. | `PASS` |
| `G-003` | `GET /` behavior unchanged. | `node --test` | Existing `/` test passes. | `PASS` |

## Required commands

| Command | Why | Required for PASS? |
| --- | --- | --- |
| `node --test` | Verify route behavior. | `yes` |

## Manual checks

| Check | Steps | Pass condition |
| --- | --- | --- |
| Diff scope | Inspect changed files. | Only server, tests, and docs changed. |

## Non-negotiables

- No silent scope additions.
- No editing frozen contracts after results exist.
- No claiming success without raw command output or inspection evidence.
- No builder self-grading.
- No "mostly works" PASS.

## Results history

| Date | Slice | Gate | Result | Evidence |
| --- | --- | --- | --- | --- |
| `2026-06-22` | `S-001` | `G-001..G-003` | `PASS` | `node --test`, exit 0 |
