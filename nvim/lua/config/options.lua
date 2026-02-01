local opt = vim.opt

-- Python provider for molten-nvim
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/python-venv/bin/python")

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Behavior
opt.hidden = true
opt.autowriteall = true
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"

-- Disable swap/backup (we have git)
opt.swapfile = false
opt.backup = false

-- Spell checking (treesitter scopes this to comments/strings)
opt.spell = false
opt.spelllang = "en_us,hu"

-- Better display
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.showmode = false
