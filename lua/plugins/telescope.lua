return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  lazy = false,
  config = function()
    local telescope = require('telescope')
    telescope.setup{
      defaults = {
        file_ignore_patterns = {},
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    }
    telescope.load_extension('fzf')
  end
}
