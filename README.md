# Fable + Codex Loop

> **Fable decides. Codex builds. The repo remembers. You judge.**

A small, opinionated system for using Claude Fable 5 as scarce judgment and
GPT-5.5 Codex as sustained execution.

The point is not to make Fable type all day. The point is to spend Fable only
where expensive intelligence changes the outcome: architecture, scope control,
arbitration, evidence review, and next-slice planning.

Fable is the edge. Codex is the hands. The repo is the brain.

---

## Why this exists

Fable 5 is powerful, but access and cost can change. On July 1, 2026, Anthropic
said Fable 5 would return globally across Claude surfaces, with limited weekly
included usage for some plans through July 7 and usage credits after that.

So the right workflow is not:

> use Fable for everything

The right workflow is:

> use Fable only at checkpoints where judgment matters

Let Codex do the long loops: edits, tests, refactors, terminal work, and raw
evidence collection. Let Fable decide whether the work was worth doing and
whether the result actually passed.

---

## 60-second quickstart

```bash
git clone https://github.com/jumperz11/fable-codex-loop my-project
cd my-project

./install.sh    # optional: install the Codex skill globally
make init      # create docs/ repo memory
# edit docs/NEXT_SLICE.md with your first PR-sized task
make doctor    # check the repo is ready for a build block
```

Then run the loop:

1. Paste [`prompts/01-fable-architect.md`](prompts/01-fable-architect.md) to **Fable**.
2. Paste Fable's generated block to **Codex** using [`prompts/02-codex-builder.md`](prompts/02-codex-builder.md).
3. Paste Codex's raw results back to Fable with [`prompts/03-fable-review.md`](prompts/03-fable-review.md).
4. Repeat. You make the kill/continue calls.

Want to see it first? Read the worked example in
[`examples/demo-run/`](examples/demo-run/README.md).

Want the comparison against another implementation? Read
[`docs/REFERENCE_GAPS.md`](docs/REFERENCE_GAPS.md).

---

## What Fable does

In this workflow, **Fable is the architect and judge**.

Fable does not write feature code by default. Its job is to:

- read repo memory
- rule on disagreements
- freeze contracts before implementation
- keep work PR-sized
- define what is out of scope
- judge raw evidence against frozen gates
- write the next slice
- stop scope creep

Fable time is checkpoint time.

---

## What Codex does

**Codex is the builder.**

Codex edits files, runs commands, writes tests, verifies APIs and formats against
reality, records raw results, and updates repo memory.

Codex reports evidence. Fable gives verdicts. The human decides.

---

## The loop

```txt
[FABLE: edge] -- spec + verdicts --> [CODEX: hands] -- raw results --> [REPO: brain]
      ^                                |                              |
      |                                v                              |
      +-------------------------- [YOU: judge] <----------------------+
```

---

## Repo memory

| File | Role |
| --- | --- |
| `docs/HANDOFF.md` | Raw state after every work block. |
| `docs/CONTRACTS.md` | Frozen APIs, schemas, interfaces, file formats, ownership. |
| `docs/DECISIONS.md` | Accepted and rejected decisions with reasons. |
| `docs/EVALS.md` | Success gates frozen before results exist. |
| `docs/NEXT_SLICE.md` | The next small, PR-sized mission. |
| `docs/gates/` | Per-slice frozen gate files. Builder edits here fail the slice. |
| `docs/lanes/` | Per-lane raw reports from Codex. Evidence only, no verdicts. |
| `docs/prd/` | Optional short PRDs produced from research or product judgment. |
| `docs/research/` | Optional research reports. |

If it is not in repo memory, it did not happen.

`make doctor` checks these docs before a build block starts.

---

## Two modes

**Manual mode** is the default:

1. Fable writes the architect block.
2. You paste it into Codex with `/goal`.
3. Codex updates repo memory with raw evidence.
4. You paste the evidence back to Fable for judgment.

**Headless mode** is optional:

- Fable writes builder blocks into `.architect/`.
- One `codex exec` runs per lane.
- Parallel lanes use separate git worktrees.
- Each lane writes a report to `docs/lanes/`.
- Fable verifies gates and boundaries before anything is integrated.

Use manual mode first. Use headless mode when a slice is big enough that
parallel lanes and unattended runs actually buy you something.

---

## The 9 rules

1. **Fable is for judgment, not typing.**
2. **Codex is for building, testing, and evidence.**
3. **Repo docs are memory.** Not in `docs/` = unknown.
4. **The builder never grades its own work.**
5. **Disagreement is mandatory.** Silent compliance = failure.
6. **Acceptance criteria freeze before results exist.**
7. **If Fable is down or expensive, Codex continues only from frozen specs and records unresolved decisions for the next Fable checkpoint.**
8. **Builder edits to frozen gates fail the slice.**
9. **Parallel lanes need disjoint file ownership or they do not run in parallel.**

If the workflow dies when Fable is unavailable, you built dependency, not
leverage.

---

## Install as a Codex skill

```bash
./install.sh
```

Then ask Codex:

```txt
Use the fable-codex-loop skill to set up this repo for Fable architecture.
```

---

## What's in here

```txt
.
|-- README.md
|-- Makefile
|-- scripts/
|   |-- doctor.py
|   `-- init.py
|-- docs/
|-- prompts/
|-- tests/
|-- install.sh
|-- install.ps1
|-- examples/demo-run/
|-- skills/fable-codex-loop/
|-- templates/
`-- .github/workflows/
```

---

## FAQ

**Do I need two different models?**

No. The roles matter more than the names. But using a separate architect/judge
model helps because the builder does not get to grade itself.

**Why not let Fable build too?**

You can, but that is usually the expensive path. Spend frontier-model time on
decisions, arbitration, and evidence review. Spend builder time on typing.

**What happens if Fable refuses, times out, or becomes expensive mid-project?**

Codex can continue only from frozen specs. Any strategic decision, changed gate,
or unresolved disagreement gets recorded in `docs/HANDOFF.md` for the next Fable
checkpoint.

**Is this tied to a specific language or framework?**

No. The loop is language-agnostic.

---

## License

MIT. Share it, remix it, ship with it.
