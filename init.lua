vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

require('config.lazy')
require('config.mappings').setup()

