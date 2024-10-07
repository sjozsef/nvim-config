vim.keymap.set('n', 'j', 'h')
vim.keymap.set('n', 'k', 'j')
vim.keymap.set('n', 'l', 'k')
vim.keymap.set('n', ';', 'l')

vim.api.nvim_create_user_command('ReloadConfig', function()
    for name,_ in pairs(package.loaded) do
        if name:match('^user') then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
    vim.notify('Konfiguráció újratöltve', vim.log.levels.INFO)
end, {})

vim.cmd('command! ReloadCfg ReloadConfig')
