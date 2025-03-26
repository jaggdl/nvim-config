return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "tailwindcss-language-server",
        "vue-language-server",
        "rubocop",
        "ruby-lsp",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "nginx-language-server",
        "prettier",
        "tflint",
        "erb-formatter",
        "erb-lint",
        "stylelint",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        vue = { "prettier" },
        html = { "prettier" },
        css = { "stylelint" },
        eruby = { "erb_format" },
        ruby = { "rubocop" },
      },
    },
  },
}
