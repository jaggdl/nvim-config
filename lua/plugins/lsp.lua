return {
  {

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
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
      },
    },
  },
}
