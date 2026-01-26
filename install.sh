#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles"

echo "Installing dotfiles..."

# Create config directory
mkdir -p ~/.config
mkdir -p ~/.config/amp

# Symlink nvim config
if [ -L ~/.config/nvim ]; then
    rm ~/.config/nvim
elif [ -d ~/.config/nvim ]; then
    echo "Backing up existing nvim config..."
    mv ~/.config/nvim ~/.config/nvim.backup.$(date +%s)
fi
ln -sf "$DOTFILES/nvim" ~/.config/nvim
echo "✓ Neovim config linked"

# Symlink tmux config
if [ -L ~/.tmux.conf ]; then
    rm ~/.tmux.conf
elif [ -f ~/.tmux.conf ]; then
    echo "Backing up existing tmux config..."
    mv ~/.tmux.conf ~/.tmux.conf.backup.$(date +%s)
fi
ln -sf "$DOTFILES/tmux/tmux.conf" ~/.tmux.conf
echo "✓ Tmux config linked"

# Symlink amp config
if [ -L ~/.config/amp/AGENTS.md ]; then
    rm ~/.config/amp/AGENTS.md
fi
ln -sf "$DOTFILES/amp/AGENTS.md" ~/.config/amp/AGENTS.md

if [ -L ~/.config/amp/settings.json ]; then
    rm ~/.config/amp/settings.json
elif [ -f ~/.config/amp/settings.json ]; then
    echo "Backing up existing amp settings..."
    mv ~/.config/amp/settings.json ~/.config/amp/settings.json.backup.$(date +%s)
fi
ln -sf "$DOTFILES/amp/settings.json" ~/.config/amp/settings.json
echo "✓ Amp config linked"

# Symlink ghostty config
mkdir -p ~/.config/ghostty
if [ -L ~/.config/ghostty/config ]; then
    rm ~/.config/ghostty/config
elif [ -f ~/.config/ghostty/config ]; then
    echo "Backing up existing ghostty config..."
    mv ~/.config/ghostty/config ~/.config/ghostty/config.backup.$(date +%s)
fi
ln -sf "$DOTFILES/ghostty/config" ~/.config/ghostty/config
echo "✓ Ghostty config linked"

# Symlink claude code config
mkdir -p ~/.claude
if [ -L ~/.claude/settings.json ]; then
    rm ~/.claude/settings.json
elif [ -f ~/.claude/settings.json ]; then
    echo "Backing up existing claude settings..."
    mv ~/.claude/settings.json ~/.claude/settings.json.backup.$(date +%s)
fi
ln -sf "$DOTFILES/claude/settings.json" ~/.claude/settings.json
echo "✓ Claude Code config linked"

echo ""
echo "Done! Next steps:"
echo "  1. Open nvim - plugins will auto-install"
echo "  2. Run :checkhealth to verify setup"
echo "  3. Run :Mason to install LSP servers"
echo "  4. Restart tmux: tmux kill-server && tmux"
