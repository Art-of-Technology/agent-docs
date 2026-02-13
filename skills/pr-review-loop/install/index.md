---
layout: default
title: Install - PR Review Loop
---

# Installing PR Review Loop

## Prerequisites

- [`gh` CLI](https://cli.github.com) authenticated with repo access
- `jq` installed
- Branch protection enabled (already set up on all Art-of-Technology repos)

---

## Quick Install (All Platforms)

### Via ClawHub (recommended)

```bash
# First time setup (once)
npm i -g clawhub && clawhub login
```

Then install for your platform:

```bash
# OpenClaw (auto-detected from workspace)
clawhub install pr-review-loop

# Claude Code
clawhub install pr-review-loop --dir .claude/skills

# Codex
clawhub install pr-review-loop --dir .codex/skills

# Cursor
clawhub install pr-review-loop --dir .cursor/skills

# Generic agents
clawhub install pr-review-loop --dir .agents/skills
```

Update to latest version anytime:
```bash
clawhub update pr-review-loop
```

### Alternative: Shell script

Requires [gh CLI](https://cli.github.com) authenticated:

```bash
curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s pr-review-loop .claude/skills
```

---

## For OpenClaw Agents (Fully Autonomous)

Install:
```bash
clawhub install pr-review-loop
```

The agent auto-detects it and uses it when handling PR reviews. Add a cron job or heartbeat task to poll for reviews.

### Usage

```bash
bash skills/pr-review-loop/scripts/pr-review-loop.sh <owner/repo> <pr-number>
```

Output is structured JSON:
```json
{
  "repo": "Art-of-Technology/my-repo",
  "pr": 42,
  "action": "fix",
  "score": 3,
  "rounds": 1,
  "commentCount": 2,
  "comments": [...]
}
```

---

## For Claude Code

### Option A: Install via ClawHub

```bash
clawhub install pr-review-loop --dir .claude/skills
```

### Option B: Add to CLAUDE.md

Add this to your project's `CLAUDE.md`:

```markdown
## PR Review Workflow
When working on PRs with Greptile reviews:
1. Create PR — Greptile reviews automatically
2. When review arrives, run:
   bash .claude/skills/pr-review-loop/scripts/pr-review-loop.sh <repo> <pr>
3. Fix all issues listed in the JSON output comments array
4. Commit with descriptive message (≤50 char subject, list each fix)
5. Push, then comment `@greptileai review` to re-trigger
6. Repeat until action is "merge"
```

---

## For Codex

```bash
clawhub install pr-review-loop --dir .codex/skills
```

Add to your `AGENTS.md` or codex instructions the same workflow as above.

---

## For Cursor

```bash
clawhub install pr-review-loop --dir .cursor/skills
```

Add to `.cursorrules` or project instructions.

---

## For Any Other AI Tool

```bash
clawhub install pr-review-loop --dir .agents/skills
```

The script works standalone — any tool that can run bash can use it:

```bash
# Check a PR review
bash path/to/pr-review-loop/scripts/pr-review-loop.sh Art-of-Technology/my-repo 42

# Actions based on output:
# "merge"       → gh pr merge 42 --merge --delete-branch --repo Art-of-Technology/my-repo
# "fix"         → read comments, fix code, push, comment @greptileai review
# "force_merge" → merge anyway, notify team lead
```

---

## Git Commit Standards

When fixing review feedback, follow these commit standards:

- **Subject**: ≤50 chars, imperative mood, no trailing period
- **Blank line** between subject and body
- **Body**: wrapped at 72 chars, list specific changes
- **Be specific** — describe what changed, not "address feedback"

Example:
```
Fix XSS in template string escaping

- Escape backticks, ${}, and newlines in buildSplashComponent
- Add null check before path existence validation
```

---

[← Back to PR Review Loop](../)

[← Back to all skills](../../../)
