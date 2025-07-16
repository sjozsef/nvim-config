return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
        keymaps = {
            accept_suggestion = "<C-j>",
            clear_suggestion = "<C-l>",
            accept_word = "<C-k>",
        },
        color = {
            suggestion_color = "#cceb34",
            cterm = 244,
        },

        -- disable_inline_completion = false
    })
   end
}
