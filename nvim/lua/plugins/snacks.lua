-- snacks.nvim: picker, lazygit, explorer, terminal, and more
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    -- Picker (fuzzy finding)
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
    { "<leader>/", function() Snacks.picker.lines() end, desc = "Search buffer" },
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart picker" },

    -- Git
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gf", function() Snacks.picker.git_files() end, desc = "Git files" },
    { "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git commits" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git blame line" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Browse in GitHub" },

    -- Explorer
    { "<leader>e", function() Snacks.explorer() end, desc = "File explorer" },

    -- Terminal
    { "<C-/>", function() Snacks.terminal() end, desc = "Terminal", mode = { "n", "t" } },

    -- Utilities
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss notifications" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
    { "<leader>z", function() Snacks.zen() end, desc = "Zen mode" },
  },
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false }, -- keep minimal
    explorer = { enabled = true },
    indent = { enabled = false }, -- you said cut indent guides
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = false }, -- using lualine
    terminal = { enabled = true },
    words = { enabled = true },
  },
}
