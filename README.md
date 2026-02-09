# Dotfiles

Minimal neovim + tmux + amp setup for AI-assisted Rust/Go development.

## Quick Install

```bash
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## Structure

```
dotfiles/
├── nvim/
│   ├── init.lua
│   └── lua/
│       ├── config/
│       │   ├── options.lua
│       │   ├── keymaps.lua
│       │   └── autocmds.lua
│       └── plugins/
│           ├── snacks.lua      # picker, lazygit, explorer, terminal
│           ├── lsp.lua         # rust-analyzer, gopls
│           ├── completion.lua  # blink.cmp
│           ├── treesitter.lua
│           ├── ui.lua          # tokyonight, lualine, which-key
│           ├── git.lua         # gitsigns, octo
│           ├── tmux.lua        # vim-tmux-navigator
│           └── ai.lua          # amp.nvim
├── tmux/
│   └── tmux.conf
├── amp/
│   └── AGENTS.md
├── install.sh
└── README.md
```

## Key Bindings

### Leader = Space

| Key               | Action           |
| ----------------- | ---------------- |
| `<leader>ff`      | Find files       |
| `<leader>fg`      | Grep             |
| `<leader>fb`      | Buffers          |
| `<leader><space>` | Smart picker     |
| `<leader>e`       | File explorer    |
| `<leader>gg`      | Lazygit          |
| `<leader>aa`      | Open Amp         |
| `gd`              | Go to definition |
| `gr`              | References       |
| `K`               | Hover docs       |
| `<leader>ca`      | Code action      |
| `<leader>cr`      | Rename           |

### Tmux (prefix = C-a)

| Key         | Action                             |
| ----------- | ---------------------------------- | -------------- |
| `C-a        | `                                  | Split vertical |
| `C-a -`     | Split horizontal                   |
| `C-a g`     | Lazygit popup                      |
| `C-h/j/k/l` | Navigate panes (works in nvim too) |
| `M-1..5`    | Switch windows                     |

## Dependencies

- neovim >= 0.10
- git, ripgrep, fd
- go, rust (rustup)
- lazygit
- Nerd Font (recommended: JetBrainsMono)
- amp CLI
