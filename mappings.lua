local M = {}

M.setup = function()
    vim.keymap.set('n', 'j', 'h')
    vim.keymap.set('n', 'k', 'j')
    vim.keymap.set('n', 'l', 'k')
    vim.keymap.set('n', ';', 'l')
    vim.keymap.set('n', '.', ':')
    vim.keymap.set('n', ':', '.')

    -- Tab navigation mappings
    vim.keymap.set('n', 'J', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', ':', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
end

return M
