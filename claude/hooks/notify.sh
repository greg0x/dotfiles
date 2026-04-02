#!/usr/bin/env bash
# Notification helper for Claude Code hooks.
# Designed to be called via `tmux run-shell` so it executes outside any sandbox.
# Usage: notify.sh <message>

message="${1:-Done}"

session=$(tmux display-message -p '#S' 2>/dev/null)
config=$(grep "^$session:" ~/dotfiles/tmux/session-colors 2>/dev/null)

if [ -n "$config" ]; then
    sound=$(echo "$config" | cut -d: -f3)
    emoji=$(echo "$config" | cut -d: -f4)
else
    sound=Glass
    emoji=
fi

# Strip numeric prefix for display (e.g., "03_pir" -> "pir")
display_name=$(echo "$session" | sed 's/^[0-9]*_//')

terminal-notifier \
    -title "$emoji $display_name (cc)" \
    -message "$message" \
    -sound "$sound" \
    -activate com.mitchellh.ghostty \
    -execute "/opt/homebrew/bin/tmux switch-client -t $session"
