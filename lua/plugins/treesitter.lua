return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "maintained", -- Install all maintained parsers
      highlight = {
        enable = true,              -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
      },
    }
  end
}
