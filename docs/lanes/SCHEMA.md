# Lane Report Schema

Lane reports are Markdown for humans, with a few required fields for tools.

Required:

```yaml
slice: S-001
lane: lane-1
builder: GPT-5.5 Codex
status: COMPLETE
files_touched:
  - src/server.js
commands:
  - cmd: node --test
    exit_code: 0
reviewer_result: APPROVE
unresolved_risks: []
```

Markdown lane reports may use tables instead of YAML, but they must end with
one status line:

```txt
STATUS: COMPLETE
```

Allowed status values:

- `COMPLETE`
- `COMPLETE_WITH_CONCERNS`
- `BLOCKED`

Verdicts such as `PASS` and `FAIL` belong to the architect and human, not the
builder.
