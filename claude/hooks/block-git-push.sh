#!/usr/bin/env bash
# PreToolUse hook: block git push from AI agents.
# Receives tool input as JSON on stdin. Exits non-zero to block the call.
# Works even with dangerouslySkipPermissions.

set -euo pipefail

input=$(cat)
tool_name=$(echo "$input" | jq -r '.tool_name // empty')

# Only inspect Bash tool calls
[[ "$tool_name" == "Bash" ]] || exit 0

command=$(echo "$input" | jq -r '.tool_input.command // empty')

# Strip comments and strings to avoid false positives on things like:
#   echo "don't git push"
# But keep it simple — we check for git push as a command, not inside quotes.
# Use word-boundary matching to catch: git push, git -c x push, git push --force, etc.
if echo "$command" | grep -qE '(^|[;&|])\s*git\s+(\S+\s+)*push(\s|$|;|&|\|)'; then
  echo "BLOCKED: git push is not allowed from AI agents. Use lazygit instead." >&2
  exit 2
fi

exit 0
