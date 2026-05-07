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

-- Set clipboard to use system clipboard. When running inside an SSH session,
-- route copies through OSC 52 so yanks land on the *originating* machine's
-- clipboard (e.g. nvim on Linux over SSH from a Mac → Mac clipboard).
if vim.env.SSH_TTY ~= nil then
  vim.g.clipboard = {
    name = "osc52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
vim.opt.clipboard = "unnamedplus"

require('config.lazy')
require('config.mappings').setup()

vim.o.guifont = "FiraCode Nerd Font Mono:h19"

vim.filetype.add({
   pattern = {
     [".*%.blade%.php"] = "blade",
     ['.env'] = 'sh',
     ['.env%..*'] = 'sh',
   }
 })

vim.opt.listchars = {
    space = '·',
    tab = '→ ',
    eol = '↲',
    nbsp = '␣',
    trail = '•',
    extends = '⟩',
    precedes = '⟨',
}

-- Function to toggle whitespace display
local function toggle_whitespace()
    vim.opt.list = not vim.opt.list:get()
    if vim.opt.list:get() then
        print("Whitespace display enabled")
    else
        print("Whitespace display disabled")
    end
end

-- Map the toggle function to <leader>tw
vim.keymap.set('n', '<leader>tw', toggle_whitespace, { noremap = true, silent = true, desc = "Toggle whitespace display" })

-- Set initial state (disabled by default)
vim.opt.list = false

-- Do not show diagnostics by default
vim.diagnostic.config({
  virtual_text = false,
})

-- Filter out position encoding warnings
vim.notify = (function(original_notify)
  return function(msg, level, opts)
    if type(msg) == "string" and (
      msg:match("position_encoding param is required") or
      msg:match("vim%.tbl_islist is deprecated")
    ) then
      return
    end
    return original_notify(msg, level, opts)
  end
end)(vim.notify)

-- Function to show diagnostics in a floating window
local function show_line_diagnostics()
  vim.diagnostic.open_float(nil, {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = 'rounded',
    source = 'always',
    prefix = ' ',
    scope = 'line',
  })
end

-- Keybinding to show diagnostics for the current line
vim.keymap.set('n', '<leader>d', show_line_diagnostics, { noremap = true, silent = true, desc = "Show line diagnostics" })
