return {
  -- Convert .ipynb to editable format
  {
    "goerz/jupytext.nvim",
    version = "0.2.*",
    opts = {
      format = "py:percent",
      jupytext = vim.fn.expand("~/.local/share/nvim/python-venv/bin/jupytext"),
    },
  },

  -- Notebook workflow (pyworks provides keymaps via ~ menu)
  {
    "jeryldev/pyworks.nvim",
    dependencies = { "benlubas/molten-nvim", "3rd/image.nvim" },
    ft = { "python" },
    opts = {},
  },

  -- Kernel execution
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 30
      vim.g.molten_auto_open_output = true
      vim.g.molten_wrap_output = true
    end,
    keys = {
      {
        "<leader>jv",
        function()
          local cwd = vim.fn.getcwd()
          vim.notify("Setting up venv...", vim.log.levels.INFO)
          vim.fn.jobstart("cd " .. vim.fn.shellescape(cwd) .. " && uv venv 2>/dev/null; uv pip install ipykernel numpy matplotlib pandas", {
            on_exit = function(_, code)
              if code == 0 then
                vim.notify("Venv ready! Restart nvim, then press i to init kernel", vim.log.levels.INFO)
              else
                vim.notify("Venv setup failed", vim.log.levels.ERROR)
              end
            end,
          })
        end,
        desc = "Setup venv",
      },
    },
  },
}
