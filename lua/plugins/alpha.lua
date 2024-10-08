return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.buttons.val = {
            dashboard.button("p l a", "Librabooks Admin", "<cmd>cd ~/Projects/netpeople/admin.librabooks.hu <CR>")
            dashboard.button("SPC f f", "Find files")
            dashboard.button("SPC f w", "Live grep")
        }

        alpha.setup(dashboard.opts)
    end
}
