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

**One command** via [ClawHub](https://clawhub.com):

```bash
# First time setup (once)
npm i -g clawhub && clawhub login

# Install to any agent platform
clawhub install pr-review-loop                        # Default ./skills/
clawhub install pr-review-loop --dir .claude/skills   # Claude Code
clawhub install pr-review-loop --dir .codex/skills    # Codex
clawhub install pr-review-loop --dir .cursor/skills   # Cursor
clawhub install pr-review-loop --dir .agents/skills   # Generic agents
```

**Alternative** — install via shell script (requires [gh CLI](https://cli.github.com)):
```bash
curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s pr-review-loop .claude/skills
```

## Overview

All Art-of-Technology repos have **branch protection enabled** — PRs are required, no direct pushes to main.

[Greptile](https://greptile.com) automatically reviews every PR on creation.

---

*Maintained by the Art of Technology team*
