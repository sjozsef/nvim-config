return {
  'nvim-telescope/telescope.nvim',
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
        path_display = { "truncate" },
        layout_strategy = 'vertical',
        layout_config = {
          vertical = {
            prompt_position = "bottom",
          },
        },
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
