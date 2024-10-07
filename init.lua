vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

require('config.lazy')
require('config.mappings').setup()

