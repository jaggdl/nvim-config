return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        -- For Typescript/Vue setup
        tsserver = {
          on_attach = function(client, bufnr)
            -- your custom on_attach here
          end,
          capabilities = {}, -- your custom capabilities
          init_options = {
            plugins = {},
          },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
        },
        volar = {
          filetypes = { "vue" },
        },
        -- Other servers like html, cssls, eslint
        html = {},
        cssls = {},
        eslint = {},
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")

      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        -- Prettier (with project local node_modules)
        null_ls.builtins.formatting.prettier.with({
          command = "node_modules/.bin/prettier",
          filetypes = { "html", "markdown", "css", "typescript", "vue" },
        }),
        -- stylua for Lua
        null_ls.builtins.formatting.stylua,
        -- clang_format for C/C++
        null_ls.builtins.formatting.clang_format,
      })

      -- Set formatting on save if you like
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  },
}
