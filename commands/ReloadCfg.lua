local M = {}

M.setup = function()
    vim.api.nvim_create_user_command('ReloadConfig', function()
        -- Unload user modules
        for name,_ in pairs(package.loaded) do
            if name:match('^user') then
                package.loaded[name] = nil
            end
        end
        -- Reload init.lua
        dofile(vim.fn.stdpath('config') .. '/init.lua')
        vim.notify('Configuration reloaded', vim.log.levels.INFO)
    end, {})

    vim.cmd('command! ReloadCfg ReloadConfig')
end

return M
