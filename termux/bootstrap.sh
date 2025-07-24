#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

# ----------------------------------------------
# Termux Python IDE Bootstrap Script
# ----------------------------------------------
# Installs system packages, Python tooling, Neovim config.
# Safe to re-run; idempotent where possible.
# ----------------------------------------------

echo "[1/6] Updating package repos..."
pkg update -y && pkg upgrade -y

echo "[2/6] Installing Termux packages..."
pkg install -y python neovim git curl wget clang make cmake pkg-config \
  openssl libffi libbz2 ndk-sysroot unzip ripgrep fd nodejs

# optional utilities
pkg install -y zsh bat lazygit || true

# Ensure pip up-to-date
python -m pip install --upgrade pip wheel setuptools

# Install Python dev tooling
python -m pip install -r "$(dirname "$0")/pip-requirements.txt"

# Install pyright globally via npm (LSP)
if command -v npm >/dev/null 2>&1; then
  npm install -g pyright || echo "[warn] pyright NPM install failed; LSP fallback will try python-lsp-server."
fi

# Link Neovim config
NVIM_SRC_DIR="$(dirname "$0")/nvim"
NVIM_DST_DIR="$HOME/.config/nvim"
mkdir -p "$HOME/.config"
if [ -e "$NVIM_DST_DIR" ] && [ ! -L "$NVIM_DST_DIR" ]; then
  echo "[backup] Moving existing nvim config to ~/.config/nvim.backup.$(date +%s)"
  mv "$NVIM_DST_DIR" "$NVIM_DST_DIR.backup.$(date +%s)"
fi
ln -sfn "$NVIM_SRC_DIR" "$NVIM_DST_DIR"

echo "[3/6] Installing lazy.nvim plugin manager (if missing)..."
LAZY_DIR="$HOME/.local/share/nvim/lazy/lazy.nvim"
if [ ! -d "$LAZY_DIR" ]; then
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_DIR"
fi

echo "[4/6] Checking termux-exec fix..."
# Some shells need rehash; skip for now.

cat <<'EOF'
[done] Base environment installed.
Open Neovim with: nvim
First launch will install plugins; wait for completion.
Then open a Python file and try <leader>r to run.
EOF
