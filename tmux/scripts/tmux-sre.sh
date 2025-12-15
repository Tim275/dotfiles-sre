#!/bin/bash
# =============================================================================
# TMUX SRE Session - Site Reliability Engineer Daily Setup
# Usage: tsre [session-name] [project-path]
# =============================================================================

SESSION_NAME=${1:-"sre"}
PROJECT_PATH=${2:-$(pwd)}
KUBECONFIG=${KUBECONFIG:-~/.kube/config}

# Session erstellen
tmux new-session -d -s "$SESSION_NAME" -c "$PROJECT_PATH"

# ═══════════════════════════════════════════════════════════════════════════
# Window 1: CODE (Neovim für YAML, Go, Python)
# ═══════════════════════════════════════════════════════════════════════════
tmux rename-window -t "$SESSION_NAME:1" "code"
tmux send-keys -t "$SESSION_NAME:1" "nvim ." C-m

# ═══════════════════════════════════════════════════════════════════════════
# Window 2: K8S (k9s - Kubernetes Dashboard)
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "k8s"
tmux send-keys -t "$SESSION_NAME:k8s" "k9s" C-m

# ═══════════════════════════════════════════════════════════════════════════
# Window 3: LOGS (stern/kubectl logs - Multi-Pod Logs)
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "logs"
tmux split-window -h -t "$SESSION_NAME:logs"
tmux send-keys -t "$SESSION_NAME:logs.1" "echo '📋 Pod Logs - Use: stern <pod-name>'" C-m
tmux send-keys -t "$SESSION_NAME:logs.2" "echo '📋 Events - Use: kubectl get events -w'" C-m

# ═══════════════════════════════════════════════════════════════════════════
# Window 4: INFRA (Terraform, Ansible, Docker)
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "infra"
tmux split-window -h -t "$SESSION_NAME:infra"
tmux send-keys -t "$SESSION_NAME:infra.1" "echo '🏗️  Terraform/Ansible'" C-m
tmux send-keys -t "$SESSION_NAME:infra.2" "lazydocker" C-m

# ═══════════════════════════════════════════════════════════════════════════
# Window 5: MON (Monitoring - btop, curl health checks)
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "mon"
tmux split-window -h -t "$SESSION_NAME:mon"
tmux split-window -v -t "$SESSION_NAME:mon.1"
tmux send-keys -t "$SESSION_NAME:mon.1" "btop" C-m
tmux send-keys -t "$SESSION_NAME:mon.2" "echo '🔍 Health Checks'" C-m
tmux send-keys -t "$SESSION_NAME:mon.3" "echo '📊 Metrics'" C-m

# ═══════════════════════════════════════════════════════════════════════════
# Window 6: GIT (LazyGit)
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "git"
tmux send-keys -t "$SESSION_NAME:git" "lazygit" C-m

# ═══════════════════════════════════════════════════════════════════════════
# Window 7: SSH (Remote Servers)
# ═══════════════════════════════════════════════════════════════════════════
tmux new-window -t "$SESSION_NAME" -n "ssh"
tmux split-window -h -t "$SESSION_NAME:ssh"
tmux split-window -v -t "$SESSION_NAME:ssh.1"
tmux send-keys -t "$SESSION_NAME:ssh.1" "echo '🖥️  Server 1 - ssh user@server1'" C-m
tmux send-keys -t "$SESSION_NAME:ssh.2" "echo '🖥️  Server 2 - ssh user@server2'" C-m
tmux send-keys -t "$SESSION_NAME:ssh.3" "echo '🖥️  Server 3 - ssh user@server3'" C-m

# Zurück zu Window 1 (Code)
tmux select-window -t "$SESSION_NAME:1"

# Attach
tmux attach -t "$SESSION_NAME"
