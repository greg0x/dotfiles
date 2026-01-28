# Dotfiles

Neovim + tmux + AI tooling for Rust/Go/TypeScript development.

## Quick Install

```bash
cd ~/dotfiles
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
│           ├── lsp.lua         # rust-analyzer, gopls, ts_ls
│           ├── completion.lua  # blink.cmp
│           ├── treesitter.lua
│           ├── editor.lua      # harpoon, flash, mini.*, trouble
│           ├── formatting.lua  # conform.nvim
│           ├── ui.lua          # tokyonight, lualine, which-key
│           ├── git.lua         # gitsigns, gitlinker, octo
│           ├── tmux.lua        # vim-tmux-navigator
│           └── ai.lua          # amp.nvim, claudecode.nvim
├── tmux/
│   ├── tmux.conf
│   └── session-colors         # persisted session color mappings
├── scripts/
│   ├── sessionizer            # fzf project switcher with auto-layout
│   ├── session-color          # pick session status bar color
│   └── session-color-apply    # hook to apply colors on switch
├── ghostty/
│   └── config
├── claude/
│   └── settings.json
├── amp/
│   ├── settings.json
│   └── AGENTS.md
├── install.sh
└── README.md
```

## Key Bindings

### Neovim (leader = Space)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Grep |
| `<leader>fb` | Buffers |
| `<leader><space>` | Smart picker |
| `<leader>e` | File explorer |
| `<leader>gg` | Lazygit |
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename |
| `<leader>1-4` | Harpoon files |
| `s` | Flash jump |

### Tmux (prefix = C-a)

| Key | Action |
|-----|--------|
| `C-a \|` | Split vertical |
| `C-a -` | Split horizontal |
| `C-a f` | Sessionizer (project picker) |
| `C-a g` | Lazygit popup |
| `C-a C` | Session color picker |
| `C-h/j/k/l` | Navigate panes (works in nvim too) |
| `M-1..5` | Switch windows |
| `M-h/l` | Prev/next window |

## Dependencies

- neovim >= 0.10
- tmux
- ghostty
- git, ripgrep, fd, fzf
- lazygit
- go, rust (rustup)
- Nerd Font (JetBrainsMono recommended)

### AI Tools
- claude CLI (`cc`)
- amp CLI

## Todo

- [ ] Shell config (zshrc/bashrc) - fzf integration, PATH, aliases
- [ ] App installations in install.sh (brew bundle or similar)
- [ ] Aerospace + Karabiner configs
- [ ] Git config (.gitconfig)
