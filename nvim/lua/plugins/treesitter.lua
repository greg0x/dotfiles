return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      ensure_installed = {
        -- Systems
        "rust",
        "go",
        "gomod",
        "gosum",
        "python",
        -- Web
        "typescript",
        "tsx",
        "javascript",
        "html",
        "css",
        "json",
        "jsonc",
        -- Mobile
        "swift",
        "kotlin",
        -- Config
        "lua",
        "vim",
        "vimdoc",
        "yaml",
        "toml",
        "bash",
        -- Docs
        "markdown",
        "markdown_inline",
        -- Git
        "diff",
        "gitcommit",
        "git_rebase",
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_prev_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_prev_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Manually set up textobjects move keymaps
      local ts_move = require("nvim-treesitter.textobjects.move")
      local map = vim.keymap.set

      map({ "n", "x", "o" }, "]f", function()
        ts_move.goto_next_start("@function.outer")
        if vim.bo.filetype == "rust" then
          vim.fn.search([[fn \zs\w]], "c", vim.fn.line(".") + 5)
        end
      end, { desc = "Next function" })
      map({ "n", "x", "o" }, "[f", function()
        if vim.bo.filetype == "rust" then
          local col = vim.fn.col(".")
          local line = vim.api.nvim_get_current_line()
          -- If at column 0 or line doesn't have fn, go to previous function
          if col == 1 or not line:match("fn%s+%w") then
            ts_move.goto_previous_start("@function.outer")
            vim.fn.search([[fn \zs\w]], "c", vim.fn.line(".") + 5)
          else
            -- Jump to function name on current line
            vim.fn.search([[fn \zs\w]], "bc", vim.fn.line("."))
          end
        else
          ts_move.goto_previous_start("@function.outer")
        end
      end, { desc = "Prev function" })
      map({ "n", "x", "o" }, "]c", function() ts_move.goto_next_start("@class.outer") end, { desc = "Next class" })
      map({ "n", "x", "o" }, "[c", function() ts_move.goto_previous_start("@class.outer") end, { desc = "Prev class" })
      map({ "n", "x", "o" }, "]F", function() ts_move.goto_next_end("@function.outer") end, { desc = "Next function end" })
      map({ "n", "x", "o" }, "[F", function() ts_move.goto_previous_end("@function.outer") end, { desc = "Prev function end" })
    end,
  },

  -- Auto close/rename HTML tags
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Show function/class context at top of buffer
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      max_lines = 3,
    },
  },
}
