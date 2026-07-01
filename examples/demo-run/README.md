# Example Run - "Add a /health endpoint"

A complete, real-shaped trace of one loop on a tiny API project. Read it in order
to see how Fable, Codex, the repo, and the human interact on a single slice.

| Step | File | What it shows |
| --- | --- | --- |
| 0 | [`before.md`](before.md) | Repo state before the slice |
| 1 | [`fable-spec.md`](fable-spec.md) | Fable's architect output + Codex block |
| 2 | [`codex-output.md`](codex-output.md) | Codex's PHASE 0-5 builder run |
| 3 | [`review-verdict.md`](review-verdict.md) | Fable judging raw evidence |
| - | [`repo/docs/`](repo/docs) | The filled repo memory after the slice (passes `doctor`) |

Validate the example's memory:

```bash
python3 scripts/doctor.py examples/demo-run/repo
```
