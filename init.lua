require('config.lazy')
-- Load mappings
require('mappings').setup()

-- Load commands
require('commands.ReloadCfg').setup()
require('commands.ToggleOil')

-- Key mapping to toggle oil.nvim file browser
vim.api.nvim_set_keymap('n', '<leader>o', ':lua require("commands.ToggleOil").toggle_oil()<CR>', { noremap = true, silent = true })
