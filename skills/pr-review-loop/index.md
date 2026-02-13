---
layout: default
title: PR Review Loop
---

# PR Review Loop

Autonomous PR review loop with [Greptile](https://greptile.com). Your AI agent handles code review feedback automatically — reading reviews, fixing issues, pushing fixes, re-triggering review, and auto-merging when the score hits 4/5+.

## How It Works

```
Agent opens PR → Greptile auto-reviews →
  Score ≥ 4/5 → auto-merge ✅
  Score < 4   → agent fixes issues, pushes, re-triggers @greptileai
  5 rounds or 2 same-score rounds → force merge + notify team lead
  Architectural concern → escalate to team lead
```

## Workflow

### 1. Fetch Review
The script queries GitHub for the latest Greptile review and inline comments on your PR.

### 2. Parse Score
Greptile includes a confidence/quality score (X/5). The script extracts it and decides the action.

### 3. Act on Result

| Action | Condition | What Happens |
|--------|-----------|--------------|
| `merge` | Score ≥ 4/5 or approved with no comments | Auto-merge the PR |
| `fix` | Score < 4/5 with comments | Fix each issue, commit, push, re-trigger review |
| `force_merge` | 5 rounds reached or 2 rounds at same score | Merge anyway, notify team lead |

### 4. Fix Issues
For each Greptile comment:
1. Read the file and line referenced
2. Understand and apply the fix
3. Commit with a descriptive message listing each change
4. Push and comment `@greptileai review` on the PR

## Common Greptile Feedback

| Category | Priority | Action |
|----------|----------|--------|
| Security (XSS, injection, auth) | 🔴 Critical | Fix immediately |
| Error handling | 🟠 High | Fix in current round |
| Type safety | 🟡 Medium | Fix in current round |
| Code quality | 🟢 Low | Fix if straightforward |
| Architecture changes | ⚠️ Escalate | Ping team lead, don't auto-fix |

---

[← Back to all skills](../../)

[Install Guide →](./install/)
