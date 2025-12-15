#!/bin/bash
# =============================================================================
# TMUX Session Menu (Prefix + w)
# =============================================================================

sessions=$(tmux list-sessions -F "#{session_name}")
selected=$(echo "$sessions" | fzf --height=100% --reverse --prompt="Session: ")

if [ -n "$selected" ]; then
    tmux switch-client -t "$selected"
fi
