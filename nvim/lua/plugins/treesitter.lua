return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "rust",
        "go",
        "gomod",
        "gosum",
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
        "toml",
        "bash",
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
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
