return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local alpha = require'alpha'
        local dashboard = require'alpha.themes.dashboard'
        dashboard.section.header.val = {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("1", "Libra Admin", ":lua vim.cmd.cd('~/Projects/netpeople/admin.librabooks.hu')<CR>"),
            dashboard.button("2", "Libra Ui", ":lua vim.cmd.cd('~/Projects/netpeople/ui.librabooks.hu')<CR>"),
            dashboard.button("3", "UNMXR App", ":lua vim.cmd.cd('~/Projects/devoid/unmxr/app')<CR>"),
            dashboard.button("4", "UNMXR Worker", ":lua vim.cmd.cd('~/Projects/devoid/unmxr/base-services')<CR>"),
            dashboard.button("5", "UNMXR Audio Services", ":lua vim.cmd.cd('~/Projects/unmxr/audio-services')<CR>"),
            dashboard.button("f", "Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("s", "Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button("q", "Quit NVIM", ":qa<CR>"),
        }
        dashboard.section.footer.val = "Happy coding!"

        dashboard.config.opts.noautocmd = true

        vim.cmd[[autocmd User AlphaReady echo 'ready']]

        alpha.setup(dashboard.config)
    end
}
