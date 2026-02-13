---
layout: default
title: Agent Skills - Art of Technology
---

# 🤖 Agent Skills

Shared skills and tools for Art of Technology development teams.

## Available Skills

| Skill | Description | Install Guide |
|-------|-------------|---------------|
| [PR Review Loop](./skills/pr-review-loop/) | Autonomous Greptile PR review handling | [Install](./skills/pr-review-loop/install/) |
| [GSD Framework](./skills/gsd-framework/) | Get Stuff Done project scaffolding | Coming soon |
| [Testing Best Practices](./skills/testing-best-practices/) | Standardized testing patterns | Coming soon |

---

## Install Any Skill

**One command** — no need to clone anything:

```bash
# Install to current directory's skills/ folder
curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s pr-review-loop

# Install directly into your agent's skill directory
curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s pr-review-loop .claude/skills
curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s pr-review-loop .codex/skills
curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s pr-review-loop .cursor/skills
```

**Prerequisite:** [gh CLI](https://cli.github.com) authenticated (`gh auth login`).

## Overview

All Art-of-Technology repos have **branch protection enabled** — PRs are required, no direct pushes to main.

[Greptile](https://greptile.com) automatically reviews every PR on creation.

---

*Maintained by the Art of Technology team*
