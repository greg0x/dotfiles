return {
  -- Amp integration
  {
    "sourcegraph/amp.nvim",
    lazy = false,
    keys = {
      { "<leader>aa", "<cmd>Amp<cr>", desc = "Open Amp" },
      { "<leader>at", "<cmd>Amp toggle<cr>", desc = "Toggle Amp" },
    },
    opts = {},
  },
}
