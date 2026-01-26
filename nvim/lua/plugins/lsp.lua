return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "gopls",
          "ts_ls",
          "kotlin_language_server",
        },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Keymaps on attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = desc })
          end

          map("gd", function() Snacks.picker.lsp_definitions() end, "Go to definition")
          map("gr", function() Snacks.picker.lsp_references() end, "References")
          map("gI", function() Snacks.picker.lsp_implementations() end, "Implementations")
          map("gy", function() Snacks.picker.lsp_type_definitions() end, "Type definition")
          map("K", vim.lsp.buf.hover, "Hover")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
          map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
          map("]d", vim.diagnostic.goto_next, "Next diagnostic")
          map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        end,
      })

      -- Rust
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
            cargo = { allFeatures = true },
          },
        },
      })

      -- Go
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })

      -- TypeScript/JavaScript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      })

      -- Kotlin
      lspconfig.kotlin_language_server.setup({
        capabilities = capabilities,
      })

      -- Swift (sourcekit-lsp comes with Xcode, no mason install needed)
      lspconfig.sourcekit.setup({
        capabilities = capabilities,
      })
    end,
  },

  -- Mason for installing LSP servers and tools
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },

  -- Better Lua LSP for nvim config
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- JSON/YAML schemas
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
  },

  -- Auto-install formatters and linters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Formatters
        "stylua",      -- Lua
        "gofumpt",     -- Go
        "goimports",   -- Go
        "biome",       -- JS/TS
        "prettier",    -- Fallback for JS/TS/web
        "ktlint",      -- Kotlin
        -- Note: rustfmt comes with rustup, swiftformat via homebrew/system
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}
