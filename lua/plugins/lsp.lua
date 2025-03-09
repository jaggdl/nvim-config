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
        tflint = {},
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        },
        rubocop = {
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          filetypes = { "ruby" },
          root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git"),
        },
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
        -- rubocop for Ruby diagnostics (linting) and formatting
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,

        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.terrafmt, -- markdown
        null_ls.builtins.diagnostics.terraform_validate,
      })
    end,
  },
}
