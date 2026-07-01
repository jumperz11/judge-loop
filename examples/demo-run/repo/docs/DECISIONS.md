# DECISIONS

> Architecture and product decisions. Short, blunt, and traceable.

## Decision log

| ID | Date | Decision | Status | Why | Evidence |
| --- | --- | --- | --- | --- | --- |
| `ADR-001` | `2026-06-22` | Use integer seconds for `uptime_s`. | accepted | Stable response shape for tests and monitors. | `docs/CONTRACTS.md` |

## Rejected ideas

| ID | Idea | Rejected because | Can revisit when |
| --- | --- | --- | --- |
| `R-001` | Add metrics library. | Out of scope for health endpoint slice. | Monitoring slice is approved. |

## Human product calls

| Date | Call | Why | Impact |
| --- | --- | --- | --- |
| `2026-06-22` | Keep `/health` minimal. | Need uptime check only. | No dependencies added. |
