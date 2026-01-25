#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles"

echo "Installing dotfiles..."

# Create config directories
mkdir -p ~/.config/nvim
mkdir -p ~/.config/amp

# Symlink nvim config
if [ -L ~/.config/nvim ] || [ -d ~/.config/nvim ]; then
    echo "Backing up existing nvim config..."
    mv ~/.config/nvim ~/.config/nvim.backup.$(date +%s)
fi
ln -sf "$DOTFILES/nvim" ~/.config/nvim
echo "✓ Neovim config linked"

# Symlink tmux config
if [ -f ~/.tmux.conf ]; then
    echo "Backing up existing tmux config..."
    mv ~/.tmux.conf ~/.tmux.conf.backup.$(date +%s)
fi
ln -sf "$DOTFILES/tmux/tmux.conf" ~/.tmux.conf
echo "✓ Tmux config linked"

# Symlink amp AGENTS.md
ln -sf "$DOTFILES/amp/AGENTS.md" ~/.config/amp/AGENTS.md
echo "✓ Amp AGENTS.md linked"

echo ""
echo "Done! Next steps:"
echo "  1. Open nvim - plugins will auto-install"
echo "  2. Run :checkhealth to verify setup"
echo "  3. Run :Mason to install LSP servers"
echo "  4. Restart tmux: tmux kill-server && tmux"
