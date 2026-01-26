return {
  -- Amp integration
  {
    "sourcegraph/amp.nvim",
    lazy = false,
    keys = {
      { "<leader>aa", "<cmd>AmpStart<cr>", desc = "Start Amp" },
      { "<leader>at", "<cmd>AmpToggle<cr>", desc = "Toggle Amp" },
      { "<leader>ax", "<cmd>AmpStop<cr>", desc = "Stop Amp" },
    },
    opts = {},
  },

  -- Claude Code integration
  {
    "anthropics/claudecode.nvim",
    lazy = false,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", desc = "Send to Claude", mode = { "n", "v" } },
    },
    opts = {},
  },
}
