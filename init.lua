-- Átállítjuk a hjkl billentyűket jkl; billentyűkre
vim.keymap.set('n', 'j', 'h')
vim.keymap.set('n', 'k', 'j')
vim.keymap.set('n', 'l', 'k')
vim.keymap.set('n', ';', 'l')

-- ReloadCfg parancs létrehozása a konfiguráció újratöltéséhez
vim.api.nvim_create_user_command('ReloadCfg', function()
    for name,_ in pairs(package.loaded) do
        if name:match('^user') then
            package.loaded[name] = nil
        end
    end
    dofile(vim.env.MYVIMRC)
    vim.notify('Config reloaded', vim.log.levels.INFO)
end, {})
