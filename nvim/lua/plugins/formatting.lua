return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format" },
      { "<leader>cF", function() vim.g.disable_autoformat = not vim.g.disable_autoformat; vim.notify("Autoformat " .. (vim.g.disable_autoformat and "disabled" or "enabled")) end, desc = "Toggle autoformat" },
    },
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
        go = { "gofumpt", "goimports" },
        javascript = { "biome", "prettier", stop_after_first = true },
        javascriptreact = { "biome", "prettier", stop_after_first = true },
        typescript = { "biome", "prettier", stop_after_first = true },
        typescriptreact = { "biome", "prettier", stop_after_first = true },
        json = { "biome", "prettier", stop_after_first = true },
        jsonc = { "biome", "prettier", stop_after_first = true },
        swift = { "swiftformat" },
        kotlin = { "ktlint" },
        lua = { "stylua" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },
      format_on_save = function(bufnr)
        -- Disable autoformat with :let g:disable_autoformat = 1
        -- Or toggle with <leader>cF
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
