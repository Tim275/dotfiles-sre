#!/bin/bash
# =============================================================================
# TMUX DevOps Session Template
# Usage: tmux-devops.sh [session-name] [project-path]
# =============================================================================

SESSION_NAME=${1:-"devops"}
PROJECT_PATH=${2:-$(pwd)}

# Session erstellen
tmux new-session -d -s "$SESSION_NAME" -c "$PROJECT_PATH"

# Window 1: Code (Neovim)
tmux rename-window -t "$SESSION_NAME:1" "code"
tmux send-keys -t "$SESSION_NAME:1" "nvim ." C-m

# Window 2: Terminal (Split: Shell + Git)
tmux new-window -t "$SESSION_NAME" -n "term"
tmux split-window -h -t "$SESSION_NAME:term"
tmux send-keys -t "$SESSION_NAME:term.1" "cd $PROJECT_PATH && clear" C-m
tmux send-keys -t "$SESSION_NAME:term.2" "lazygit" C-m

# Window 3: K8s (k9s + kubectl)
tmux new-window -t "$SESSION_NAME" -n "k8s"
tmux send-keys -t "$SESSION_NAME:k8s" "k9s" C-m

# Window 4: Docker
tmux new-window -t "$SESSION_NAME" -n "docker"
tmux send-keys -t "$SESSION_NAME:docker" "lazydocker" C-m

# Window 5: Monitoring
tmux new-window -t "$SESSION_NAME" -n "mon"
tmux send-keys -t "$SESSION_NAME:mon" "btop" C-m

# Zurück zu Window 1
tmux select-window -t "$SESSION_NAME:1"

# Attach
tmux attach -t "$SESSION_NAME"
