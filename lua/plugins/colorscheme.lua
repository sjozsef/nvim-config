return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      theme = "wave", -- "wave", "dragon", "lotus"
    })
    vim.cmd([[colorscheme kanagawa]])
  end,
}

-- Previous colorscheme (gruvbox) - uncomment to restore:
-- return {
--   "ellisonleao/gruvbox.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       terminal_colors = true,
--       undercurl = true,
--       underline = true,
--       bold = true,
--       italic = {
--         strings = true,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true,
--       },
--       strikethrough = true,
--       invert_selection = false,
--       invert_signs = false,
--       invert_tabline = false,
--       invert_intend_guides = false,
--       inverse = true,
--       contrast = "hard", -- can be "hard", "soft" or empty string
--       palette_overrides = {},
--       overrides = {},
--       dim_inactive = false,
--       transparent_mode = false,
--     })
--     vim.cmd([[colorscheme gruvbox]])
--   end,
-- }
