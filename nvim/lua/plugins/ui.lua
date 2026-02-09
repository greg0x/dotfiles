return {
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      transparent = false,
      on_highlights = function(hl, c)
        -- Brighten comments for better visibility
        hl.Comment = { fg = "#7a88a8", italic = true }
        -- Brighten line numbers
        hl.LineNr = { fg = "#6a7394" }
        hl.LineNrAbove = { fg = "#6a7394" }
        hl.LineNrBelow = { fg = "#6a7394" }
        -- Keep current line number bright
        hl.CursorLineNr = { fg = "#c0caf5", bold = true }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "diagnostics" },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      },
    },
  },

  -- Which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {},
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>gp", group = "pr" },
        { "<leader>gi", group = "issues" },
        { "<leader>c", group = "code" },
        { "<leader>b", group = "buffer" },
        { "<leader>u", group = "ui" },
        { "<leader>a", group = "ai" },
        { "<leader>h", group = "harpoon" },
        { "<leader>x", group = "diagnostics" },
        { "<leader>s", group = "search" },
        { "s", group = "surround" },
      })
    end,
  },

  -- Cursor animation
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
