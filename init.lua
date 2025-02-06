-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.neoformat_try_node_exe = 1

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "Neoformat",
})
