#!/bin/bash
# =============================================================================
# TMUX SRE + Claude Session
# Claude ist IMMER sichtbar rechts!
# Usage: tsre-claude [session-name] [project-path]
# =============================================================================

SESSION_NAME=${1:-"sre"}
PROJECT_PATH=${2:-$(pwd)}

tmux new-session -d -s "$SESSION_NAME" -c "$PROJECT_PATH"

# ═══════════════════════════════════════════════════════════════════════════
# Window 1: CODE + CLAUDE (Side by Side)
# ═══════════════════════════════════════════════════════════════════════════
tmux rename-window -t "$SESSION_NAME:1" "code+ai"
tmux send-keys -t "$SESSION_NAME:1" "nvim ." C-m
# Split rechts für Claude (30% Breite)
tmux split-window -h -p 30 -t "$SESSION_NAME:1"
tmux send-keys -t "$SESSION_NAME:1.2" "claude" C-m
# Fokus zurück auf Neovim
tmux select-pane -t "$SESSION_NAME:1.1"

# ═══════════════════════════════════════════════════════════════════════════
# Window 2: K8S + CLAUDE
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "k8s+ai"
tmux send-keys -t "$SESSION_NAME:2" "k9s" C-m
tmux split-window -h -p 30 -t "$SESSION_NAME:2"
tmux send-keys -t "$SESSION_NAME:2.2" "claude" C-m
tmux select-pane -t "$SESSION_NAME:2.1"

# ═══════════════════════════════════════════════════════════════════════════
# Window 3: LOGS
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "logs"
tmux send-keys -t "$SESSION_NAME:logs" "echo '📋 Logs - stern <pod>'" C-m

# ═══════════════════════════════════════════════════════════════════════════
# Window 4: INFRA
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "infra"
tmux split-window -h -t "$SESSION_NAME:infra"
tmux send-keys -t "$SESSION_NAME:infra.1" "echo '🏗️ Terraform'" C-m
tmux send-keys -t "$SESSION_NAME:infra.2" "lazydocker" C-m

# ═══════════════════════════════════════════════════════════════════════════
# Window 5: GIT
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "git"
tmux send-keys -t "$SESSION_NAME:git" "lazygit" C-m

tmux select-window -t "$SESSION_NAME:1"
tmux attach -t "$SESSION_NAME"
