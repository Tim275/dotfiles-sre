#!/bin/bash
# =============================================================================
# TMUX Security/Pentest Session Template
# Usage: tmux-security.sh [session-name] [target]
# =============================================================================

SESSION_NAME=${1:-"security"}
TARGET=${2:-""}

# Session erstellen
tmux new-session -d -s "$SESSION_NAME"

# Window 1: Recon
tmux rename-window -t "$SESSION_NAME:1" "recon"
tmux send-keys -t "$SESSION_NAME:1" "echo '🔍 Recon Window - Target: $TARGET'" C-m

# Window 2: Exploit
tmux new-window -t "$SESSION_NAME" -n "exploit"
tmux send-keys -t "$SESSION_NAME:exploit" "echo '💥 Exploit Window'" C-m

# Window 3: Notes (Neovim)
tmux new-window -t "$SESSION_NAME" -n "notes"
tmux send-keys -t "$SESSION_NAME:notes" "nvim ~/security-notes.md" C-m

# Window 4: Logs
tmux new-window -t "$SESSION_NAME" -n "logs"
tmux split-window -v -t "$SESSION_NAME:logs"
tmux send-keys -t "$SESSION_NAME:logs.1" "echo '📝 Log Window 1'" C-m
tmux send-keys -t "$SESSION_NAME:logs.2" "echo '📝 Log Window 2'" C-m

# Window 5: Monitor
tmux new-window -t "$SESSION_NAME" -n "mon"
tmux send-keys -t "$SESSION_NAME:mon" "btop" C-m

# Zurück zu Window 1
tmux select-window -t "$SESSION_NAME:1"

# Attach
tmux attach -t "$SESSION_NAME"
