#!/bin/bash
# Install Art-of-Technology agent skills
# Usage: curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s <skill-name> [target-dir]
#
# Examples:
#   curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s pr-review-loop
#   curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s pr-review-loop .claude/skills
#   curl -sL https://art-of-technology.github.io/agent-docs/install.sh | bash -s pr-review-loop .codex/skills

set -euo pipefail

SKILL="${1:?Usage: install.sh <skill-name> [target-dir]}"
TARGET="${2:-skills}"
REPO="Art-of-Technology/openclaw-team-provisioner"
BRANCH="main"
BASE_URL="https://api.github.com/repos/${REPO}/contents/skills/${SKILL}?ref=${BRANCH}"

echo "📦 Installing skill: ${SKILL} → ${TARGET}/${SKILL}"

# Check if gh is available (preferred — handles private repos)
if command -v gh &>/dev/null && gh auth status &>/dev/null 2>&1; then
  echo "Using gh CLI..."
  TMPDIR=$(mktemp -d)
  cd "$TMPDIR"
  gh repo clone "$REPO" repo -- --depth 1 --filter=blob:none --sparse 2>/dev/null
  cd repo
  git sparse-checkout set "skills/${SKILL}"
  cd -
  mkdir -p "${OLDPWD}/${TARGET}"
  cp -r "repo/skills/${SKILL}" "${OLDPWD}/${TARGET}/"
  rm -rf "$TMPDIR"
  cd "$OLDPWD"
else
  # Fallback: use GitHub API (works for public access if repo becomes public)
  echo "Using GitHub API (gh CLI not found or not authenticated)..."
  
  # For private repos, this won't work without a token
  # Users should install gh CLI: https://cli.github.com
  echo "⚠️  This repo is private. Install gh CLI and authenticate first:"
  echo "   brew install gh && gh auth login"
  echo ""
  echo "Then re-run this script."
  exit 1
fi

# Make scripts executable
find "${TARGET}/${SKILL}" -name "*.sh" -exec chmod +x {} \;

echo ""
echo "✅ Installed ${SKILL} to ${TARGET}/${SKILL}"
echo ""
echo "Files:"
find "${TARGET}/${SKILL}" -type f | sed 's/^/  /'
echo ""
echo "Next steps:"
echo "  - OpenClaw: skill auto-detected from workspace/skills/"
echo "  - Claude Code: cp -r ${TARGET}/${SKILL} .claude/skills/"
echo "  - Codex: cp -r ${TARGET}/${SKILL} .codex/skills/"
echo "  - Cursor: cp -r ${TARGET}/${SKILL} .cursor/skills/"
