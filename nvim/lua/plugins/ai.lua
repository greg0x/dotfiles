return {
  -- Amp integration (passive - run `amp --ide` from terminal)
  {
    "sourcegraph/amp.nvim",
    lazy = false,
    opts = { auto_start = true },
  },

  -- Claude Code integration
  {
    "coder/claudecode.nvim",
    lazy = false,
    dependencies = { "folke/snacks.nvim" },
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", desc = "Send to Claude", mode = { "n", "v" } },
    },
    opts = {},
  },
}
