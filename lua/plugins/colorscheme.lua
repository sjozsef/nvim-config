-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme tokyonight-night]])
--   end,
-- }

-- return {
--   "lewis6991/github_dark.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme github_dark]])
--   end,
-- }

-- return {
--   "rose-pine/neovim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme rose-pine-moon]])
--   end,
-- }

return {
  "shaunsingh/nord.nvim",
  config = function()
    vim.g.nord_contrast = false
    vim.g.nord_borders = false
    vim.g.nord_disable_background = false
    vim.g.nord_cursorline_transparent = false
    vim.g.nord_enable_sidebar_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false

    vim.cmd([[colorscheme nord]])

    -- Define custom highlight groups
    vim.cmd([[
      highlight NordNormal guibg=#252933
      highlight NordNormalNC guibg=#2E3440
    ]])

    -- Function to set the correct highlight for the current window
    vim.cmd([[
      function! SetNordHighlight()
        if winnr('$') == 1
          setlocal winhighlight=Normal:NordNormal
        else
          setlocal winhighlight=Normal:NordNormal
          wincmd w
          setlocal winhighlight=Normal:NordNormalNC
          wincmd p
        endif
      endfunction
    ]])

    -- Set up autocommands to adjust window brightness
    vim.cmd([[
      augroup NordActiveWindow
        autocmd!
        autocmd VimEnter,WinEnter,BufWinEnter * call SetNordHighlight()
      augroup END
    ]])
  end,
}
