return {
  'famiu/bufdelete.nvim',
  cmd = { "Bdelete", "Bwipeout" },
  keys = {
    { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete buffer" },
    { "<leader>bw", "<cmd>Bwipeout<cr>", desc = "Wipeout buffer" },
  },
}
