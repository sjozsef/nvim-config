-- Átállítjuk a hjkl billentyűket jkl; billentyűkre
vim.keymap.set('n', 'j', 'h')
vim.keymap.set('n', 'k', 'j')
vim.keymap.set('n', 'l', 'k')
vim.keymap.set('n', ';', 'l')

-- ReloadConfig parancs létrehozása a konfiguráció újratöltéséhez
vim.api.nvim_create_user_command('ReloadConfig', function()
    for name,_ in pairs(package.loaded) do
        if name:match('^user') then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
    vim.notify('Konfiguráció újratöltve', vim.log.levels.INFO)
end, {})

-- Parancs aliasok hozzáadása a gyakori elírások kezelésére
vim.cmd('command! ReloadCfg ReloadConfig')
vim.cmd('command! Reloadconfig ReloadConfig')
vim.cmd('command! ReloadConfiguration ReloadConfig')
