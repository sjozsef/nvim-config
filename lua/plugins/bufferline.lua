return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  priority = 1100,
  config = function()
    require("bufferline").setup{
    options = {
            separator_style = "slant",
        },
    }
  end
}
