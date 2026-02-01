return {
  -- Convert .ipynb to editable format on open
  {
    "goerz/jupytext.nvim",
    version = "0.2.*",
    opts = {
      format = "py:percent",  -- Uses # %% cell markers
      jupytext = vim.fn.expand("~/.local/share/nvim/python-venv/bin/jupytext"),
    },
  },

  -- Jupyter kernel execution
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 30
      vim.g.molten_auto_open_output = true
      vim.g.molten_virt_text_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_output_show_more = true
    end,
    config = function()
      -- Cell navigation (# %% markers) - using ]j/[j to avoid conflict with ]c class motion
      vim.keymap.set("n", "]j", function()
        vim.fn.search("^# %%", "W")
      end, { desc = "Next cell" })
      vim.keymap.set("n", "[j", function()
        vim.fn.search("^# %%", "bW")
      end, { desc = "Prev cell" })
    end,
    keys = {
      { "<leader>ji", "<cmd>MoltenInit<cr>", desc = "Init kernel" },
      { "<leader>ja", "<cmd>MoltenReevaluateAll<cr>", desc = "Run all cells" },
      { "<leader>jl", "<cmd>MoltenEvaluateLine<cr>", desc = "Eval line" },
      { "<leader>jr", "<cmd>MoltenReevaluateCell<cr>", desc = "Re-eval cell" },
      { "<leader>jo", "<cmd>MoltenShowOutput<cr>", desc = "Show output" },
      { "<leader>jO", "<cmd>MoltenHideOutput<cr>", desc = "Hide output" },
      { "<leader>jd", "<cmd>MoltenDelete<cr>", desc = "Delete cell" },
      { "<leader>jx", "<cmd>MoltenInterrupt<cr>", desc = "Interrupt kernel" },
      { "<leader>j", ":<C-u>MoltenEvaluateVisual<cr>gv", mode = "v", desc = "Eval selection" },
    },
  },
}
