-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
    },
  },
})

vim.g.neoformat_try_node_exe = 1

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "Neoformat",
})
