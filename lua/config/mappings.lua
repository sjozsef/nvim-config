local M = {}

M.setup = function()
    -- Normal mode mappings
    vim.keymap.set('n', 'j', 'h')
    vim.keymap.set('n', 'k', 'j')
    vim.keymap.set('n', 'l', 'k')
    vim.keymap.set('n', ';', 'l')
    vim.keymap.set('n', '.', ':')
    vim.keymap.set('n', ':', '.')

    -- Visual mode mappings
    vim.keymap.set('v', 'j', 'h')
    vim.keymap.set('v', 'k', 'j')
    vim.keymap.set('v', 'l', 'k')
    vim.keymap.set('v', ';', 'l')
    vim.keymap.set('v', '.', ':')
    vim.keymap.set('v', ':', '.')

    -- Tab navigation mappings
    vim.keymap.set('n', 'J', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', ':', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

    -- Window split mappings
    vim.keymap.set('n', '<leader>wj', '<C-w>v<C-w>H', { noremap = true, silent = true, desc = "Split window left" })
    vim.keymap.set('n', '<leader>w;', '<C-w>v', { noremap = true, silent = true, desc = "Split window right" })
    
    -- Close current split
    vim.keymap.set('n', 'q', ':close<CR>', { noremap = true, silent = true, desc = "Close current split" })

    -- Reload configuration
    vim.keymap.set('n', '<leader>sr', ':source $MYVIMRC<CR>', { noremap = true, silent = true, desc = "Reload config" })

    -- Move splits
    vim.keymap.set('n', '<C-j>', '<C-w>h', { noremap = true, silent = true, desc = "Move split to the left" })
    vim.keymap.set('n', '<C-;>', '<C-w>l', { noremap = true, silent = true, desc = "Move split to the right" })
end

return M
