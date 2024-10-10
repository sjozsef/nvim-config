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
    vim.keymap.set('n', '<leader>wk', '<C-w>s', { noremap = true, silent = true, desc = "Split window down" })
    vim.keymap.set('n', '<leader>wl', '<C-w>s<C-w>K', { noremap = true, silent = true, desc = "Split window up" })
    vim.keymap.set('n', '<leader>w;', '<C-w>v', { noremap = true, silent = true, desc = "Split window right" })


    -- Move splits
    vim.keymap.set('n', '<C-j>', '<C-w>h', { noremap = true, silent = true, desc = "Move split to the left" })
    vim.keymap.set('n', '<C-k>', '<C-w>j', { noremap = true, silent = true, desc = "Move split to the bottom" })
    vim.keymap.set('n', '<C-l>', '<C-w>k', { noremap = true, silent = true, desc = "Move split to the right" })
    vim.keymap.set('n', '<C-;>', '<C-w>l', { noremap = true, silent = true, desc = "Move split to the top" })

    -- Close current split or quit if it's the last window
    vim.keymap.set('n', 'q', function()
        if vim.fn.winnr('$') == 1 then
            vim.cmd('quit')
        else
            vim.cmd('close')
        end
    end, { noremap = true, silent = true, desc = "Close split or quit" })

    -- Telescope keymaps
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files (project only)" })
    vim.keymap.set('n', '<leader>fF', function()
        builtin.find_files({
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true,
        })
    end, { desc = "Find all files (including hidden and ignored)" })
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Live grep (project only)" })
    vim.keymap.set('n', '<leader>fW', function()
        builtin.live_grep({
            additional_args = function(args)
                return vim.list_extend(args, { "--hidden", "--no-ignore" })
            end,
        })
    end, { desc = "Live grep (including hidden and ignored)" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })

    -- Project mappings
    vim.keymap.set('n', 'pla', function()
        vim.fn.chdir(vim.fn.expand('~/Projects/netpeople/admin.librabooks.hu'))
    end, { desc = "Go to Librabooks Admin project" })

    vim.keymap.set('n', 'plu', function()
        vim.fn.chdir(vim.fn.expand('~/Projects/netpeople/ui.librabooks.hu'))
    end, { desc = "Go to Librabooks UI project" })

    vim.keymap.set('n', 'pua', function()
        vim.fn.chdir(vim.fn.expand('~/Projects/devoid/unmxr/app'))
    end, { desc = "Go to UNMXR App project" })

    vim.keymap.set('n', 'puw', function()
        vim.fn.chdir(vim.fn.expand('~/Projects/devoid/unmxr/base-services'))
    end, { desc = "Go to UNMXR Worker project" })

    vim.keymap.set('n', 'pus', function()
        vim.fn.chdir(vim.fn.expand('~/Projects/unmxr/audio-services'))
    end, { desc = "Go to UNMXR Audio Services project" })

    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "Go to definition" })
    vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, { desc = "Show document symbols" })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "Show references" })
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = "Show implementations" })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Keymaps" })
    vim.keymap.set('n', 'gf', builtin.grep_string, { desc = "Search current word" })
    vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Commands" })

    -- Code actions
    vim.keymap.set('n', '<leader>ca', function()
        vim.lsp.buf.code_action()
    end, { noremap = true, silent = true, desc = "Code actions" })

    -- Delete current buffer
    vim.keymap.set('n', 'Z', function()
        require('bufdelete').bufdelete(0, true)
    end, { noremap = true, silent = true, desc = "Delete current buffer" })

    -- Add rename symbol functionality
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename symbol" })

    -- Add mappings for leap
    vim.keymap.set({'n', 'x', 'o'}, 'h',  '<Plug>(leap-forward)')
    vim.keymap.set({'n', 'x', 'o'}, 'H',  '<Plug>(leap-backward)')
    vim.keymap.set({'n', 'x', 'o'}, '<C-h>', '<Plug>(leap-from-window)')

    -- Completion mappings
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-;>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      })
    })
end

return M
