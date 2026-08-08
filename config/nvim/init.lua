-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme ashen")
-- You may call the load function as well
-- Do NOT call them both; they both do
-- the same thing!
require("ashen").load()

vim.cmd("colorscheme onedark_dark")
