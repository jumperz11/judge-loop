# Frozen Gates

Each slice gets one frozen gate file here before implementation starts:

```txt
docs/gates/S-001.md
```

Gate files are read-only after freeze. If a builder edits a gate file after
results exist, the slice fails until the human explicitly approves the change.

Use gate files for exact commands, thresholds, and manual checks that decide
PASS / FAIL / INVALID.
