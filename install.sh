#!/bin/bash
set -e

DOTFILES="$HOME/dotfiles"

echo "Installing dotfiles..."

# Install mise if not present
if ! command -v mise &>/dev/null; then
    echo "Installing mise..."
    curl https://mise.jdx.dev/install.sh | sh
fi
echo "✓ Mise available"

# Create config directory
mkdir -p ~/.config

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

# Symlink mise config
mkdir -p ~/.config/mise
if [ -L ~/.config/mise/config.toml ]; then
    rm ~/.config/mise/config.toml
elif [ -f ~/.config/mise/config.toml ]; then
    echo "Backing up existing mise config..."
    mv ~/.config/mise/config.toml ~/.config/mise/config.toml.backup.$(date +%s)
fi
ln -sf "$DOTFILES/mise/config.toml" ~/.config/mise/config.toml
echo "✓ Mise config linked"

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

# Symlink zsh config
for f in zshenv zprofile zshrc; do
    target="$HOME/.$f"
    if [ -L "$target" ]; then
        rm "$target"
    elif [ -f "$target" ]; then
        echo "Backing up existing $f..."
        mv "$target" "$target.backup.$(date +%s)"
    fi
    ln -sf "$DOTFILES/zsh/$f" "$target"
done
echo "✓ Zsh config linked"

# Symlink scripts
mkdir -p ~/dev/bin
for script in sessionizer session-color session-color-apply dev-clean; do
    ln -sf "$DOTFILES/scripts/$script" ~/dev/bin/$script
done
echo "✓ Scripts linked"

# Install safehouse for sandbox support
if ! command -v safehouse &>/dev/null; then
    echo "Installing agent-safehouse..."
    brew install eugene1g/safehouse/agent-safehouse
fi
echo "✓ Safehouse available"

# Install dev toolchain via mise
mise trust "$DOTFILES/mise/config.toml"
mise install
echo "✓ Dev tools installed"

# Create sandbox cache dir
mkdir -p ~/.cache/oh-my-zsh

echo ""
echo "Done! Next steps:"
echo "  1. Open nvim - plugins will auto-install"
echo "  2. Run :checkhealth to verify setup"
echo "  3. Run :Mason to install LSP servers"
echo "  4. Restart tmux: tmux kill-server && tmux"
