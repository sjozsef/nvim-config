-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme tokyonight-night]])
--   end,
-- }

return {
  "lewis6991/github_dark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme github_dark]])
  end,
}
