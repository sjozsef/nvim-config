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
    vim.g.nord_enable_sidebar_background = false
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = false
    vim.g.nord_bold = false

    vim.cmd([[colorscheme nord]])

    -- Define custom highlight groups
    vim.api.nvim_set_hl(0, "NordNormal", { bg = "#252A34" })
    vim.api.nvim_set_hl(0, "NordNormalNC", { bg = "#2E3440" })

    -- Function to set the correct highlight for all windows
    local function set_nord_highlight()
      local current_win = vim.api.nvim_get_current_win()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if win == current_win then
          vim.api.nvim_win_set_option(win, "winhighlight", "Normal:NordNormal")
        else
          vim.api.nvim_win_set_option(win, "winhighlight", "Normal:NordNormalNC")
        end
      end
    end

    -- Set up autocommands to adjust window brightness
    local nord_group = vim.api.nvim_create_augroup("NordActiveWindow", { clear = true })
    vim.api.nvim_create_autocmd({"VimEnter", "WinEnter", "BufWinEnter", "WinNew"}, {
      group = nord_group,
      callback = set_nord_highlight,
    })

    -- Ensure correct highlighting after plugin operations
    vim.api.nvim_create_autocmd("CmdlineLeave", {
      group = nord_group,
      callback = function()
        vim.defer_fn(set_nord_highlight, 0)
      end,
    })
  end,
}
