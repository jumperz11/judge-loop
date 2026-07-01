#!/usr/bin/env python3
"""Sanity checks for the fable-codex-loop repo. Stdlib only."""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKILLS = ROOT / "skills"
MAX_DESC = 1024
errors: list[str] = []


def read(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="replace")


def check_skill(skill_dir: Path) -> None:
    skill_md = skill_dir / "SKILL.md"
    if not skill_md.exists():
        errors.append(f"{skill_dir.name}: missing SKILL.md")
        return

    text = read(skill_md)
    match = re.match(r"---\n(.*?)\n---\n", text, re.DOTALL)
    if not match:
        errors.append(f"{skill_dir.name}: missing frontmatter")
        return

    frontmatter = match.group(1)
    name = re.search(r"^name:\s*(\S+)", frontmatter, re.MULTILINE)
    if not name or name.group(1) != skill_dir.name:
        errors.append(f"{skill_dir.name}: frontmatter name does not match directory")

    desc = re.search(
        r"^description:\s*>?\s*\n?(.*?)(?=^\w+:|\Z)",
        frontmatter,
        re.MULTILINE | re.DOTALL,
    )
    if not desc:
        errors.append(f"{skill_dir.name}: missing description")
    else:
        flat = re.sub(r"\s+", " ", desc.group(1)).strip()
        if len(flat) > MAX_DESC:
            errors.append(f"{skill_dir.name}: description is {len(flat)} chars > {MAX_DESC}")

    for ref in re.findall(r"`([\w./-]+\.md)`", text):
        if ref.startswith(("docs/", "AGENTS", "README", "HANDOFF", "NEXT_SLICE")):
            continue
        target = skill_dir / ref
        if not target.exists():
            errors.append(f"{skill_dir.name}: referenced file missing: {ref}")


def check_fences(path: Path) -> None:
    if read(path).count("```") % 2:
        errors.append(f"{path.relative_to(ROOT)}: odd number of code fences")


def check_local_links(path: Path) -> None:
    text = read(path)
    for label, target in re.findall(r"\[([^\]]+)\]\(([^)#\s]+)\)", text):
        if target.startswith(("http://", "https://", "mailto:")):
            continue
        if not (path.parent / target).exists() and not (ROOT / target).exists():
            errors.append(f"{path.relative_to(ROOT)}: link '{label}' -> {target} missing")


def main() -> int:
    skill_dirs = sorted(path for path in SKILLS.iterdir() if path.is_dir())
    if not skill_dirs:
        errors.append("no skills found")

    for skill_dir in skill_dirs:
        check_skill(skill_dir)

    for path in ROOT.rglob("*.md"):
        if ".git" in path.parts:
            continue
        check_fences(path)
        if path.name in {"README.md", "SKILL.md"}:
            check_local_links(path)

    if errors:
        print(f"FAIL: {len(errors)} problem(s)")
        for error in errors:
            print(f"  - {error}")
        return 1

    print(f"OK: {len(skill_dirs)} skill(s), markdown links, and fences validated")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
