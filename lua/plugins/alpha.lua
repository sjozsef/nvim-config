return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.buttons.val = {
            dashboard.button("p l a", "Libra Admin", "<cmd>cd ~/Projects/netpeople/admin.librabooks.hu <CR>"),
            dashboard.button("p l u", "Libra Ui", "<cmd>cd ~/Projects/netpeople/ui.librabooks.hu <CR>"),
            dashboard.button("p u a", "UNMXR App", "<cmd>cd ~/Projects/devoid/unmxr/app <CR>"),
            dashboard.button("p u w", "UNMXR App", "<cmd>cd ~/Projects/devoid/unmxr/base-services <CR>"),
            dashboard.button("p u s", "UNMXR App", "<cmd>cd ~/Projects/devoid/unmxr/audio-services <CR>"),
            dashboard.button("SPC f f", "Find files", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPC f w", "Live grep", "<cmd>Telescope live_grep<CR>"),
        }

        alpha.setup(dashboard.opts)
    end
}
