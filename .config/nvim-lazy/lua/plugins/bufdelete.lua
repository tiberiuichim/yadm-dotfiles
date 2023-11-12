-- vim.keymap.set("n", "<leader>Q", function()
--   vim.cmd("Bdelete")
-- end)

return {
  -- "moll/vim-bbye",
  "famiu/bufdelete.nvim",
  keys = {
    { "<leader>Q", "<cmd>Bdelete<cr>", "Quit/Delete a buffer" },
  },
}
