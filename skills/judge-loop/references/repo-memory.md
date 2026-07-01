# Repo Memory Files

Create these files when setting up a repo.

## `docs/HANDOFF.md`

```md
# HANDOFF

> Raw repo memory. No hype. No narrative grading.

## Project

| Field | Value |
| --- | --- |
| Name | |
| Owner | |
| Current objective | |
| Current slice | |
| Frozen gate file | |
| Lane reports | |
| Last updated | |

## Current state

| Area | Raw fact | Evidence |
| --- | --- | --- |
| Repo | | |
| Product | | |
| Tests | | |
| Deploy | | |

## Commands run

| Command | Exit code | Result | Relevant output |
| --- | ---: | --- | --- |
| | | | |

## Open defects

| ID | Severity | Defect | Evidence | Owner | Status |
| --- | --- | --- | --- | --- | --- |
| | | | | | |
```

Create these directories too:

```txt
docs/gates/
docs/lanes/
docs/prd/
docs/research/
```

## `docs/CONTRACTS.md`

```md
# CONTRACTS

> Frozen APIs, schemas, interfaces, file formats, commands, and ownership rules.

## Freeze status

| Field | Value |
| --- | --- |
| Current slice | |
| Freeze timestamp | |
| Can change this slice? | No, unless human explicitly approves |

## Public interfaces

| Name | Type | Location | Contract |
| --- | --- | --- | --- |
| | | | |
```

## `docs/EVALS.md`

```md
# EVALS

> The scoreboard. Success criteria must be frozen before results exist.

## Current slice gates

| Gate ID | Requirement | Verification command / method | Pass condition | Status |
| --- | --- | --- | --- | --- |
| G-001 | | | | pending |
```

## `docs/NEXT_SLICE.md`

```md
# NEXT SLICE

## Slice

| Field | Value |
| --- | --- |
| Slice ID | |
| Title | |
| Objective | |

## Acceptance criteria

| ID | Criteria | Evidence required |
| --- | --- | --- |
| AC-001 | | |

## Explicit out-of-scope

- 
- 
- 
```
