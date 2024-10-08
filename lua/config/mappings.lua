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
    
    -- Reload configuration
    vim.keymap.set('n', '<leader>sr', ':source $MYVIMRC<CR>', { noremap = true, silent = true, desc = "Reload config" })

    -- Move splits
    vim.keymap.set('n', '<C-j>', '<C-w>h', { noremap = true, silent = true, desc = "Move split to the left" })
    vim.keymap.set('n', '<C-;>', '<C-w>l', { noremap = true, silent = true, desc = "Move split to the right" })

    -- Telescope keymaps
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "Go to definition" })
    vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, { desc = "Show document symbols" })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "Show references" })
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = "Show implementations" })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Keymaps" })
    vim.keymap.set('n', 'gf', builtin.grep_string, { desc = "Search current word" })
    vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Commands" })

    -- Delete current buffer
    vim.keymap.set('n', 'Z', function()
        require('bufdelete').bufdelete(0, true)
    end, { noremap = true, silent = true, desc = "Delete current buffer" })
end

return M
