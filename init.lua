vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

require('config.lazy')
require('config.mappings').setup()

vim.o.guifont = "FiraCode Nerd Font Mono:h19"

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.blade = {
--     install_info = {
--         url = "https://github.com/EmranMR/tree-sitter-blade", -- Repository URL
--         files = { "src/parser.c" }, -- Source file for the parser
--         branch = "main", -- Branch to use
--     },
--     filetype = "blade", -- Filetype for Blade files
-- }

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade", -- Recognize .blade.php files as Blade
    }
})

vim.cmd([[
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Alpha | endif
]])
