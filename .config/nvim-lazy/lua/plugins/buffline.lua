return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>1", "<Cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to buffer 1" },
    { "<leader>2", "<Cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to buffer 2" },
    { "<leader>3", "<Cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to buffer 3" },
    { "<leader>4", "<Cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to buffer 4" },
    { "<leader>5", "<Cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to buffer 5" },
    { "<leader>6", "<Cmd>BufferLineGoToBuffer 6<cr>", desc = "Go to buffer 6" },
    { "<leader>7", "<Cmd>BufferLineGoToBuffer 7<cr>", desc = "Go to buffer 7" },
    { "<leader>8", "<Cmd>BufferLineGoToBuffer 8<cr>", desc = "Go to buffer 8" },
    { "<leader>9", "<Cmd>BufferLineGoToBuffer 9<cr>", desc = "Go to buffer 9" },
    { "<leader>0", "<Cmd>BufferLineGoToBuffer 10<cr>", desc = "Go to buffer 10" },
    { "<S-h>", "<Cmd>:normal! H<CR>", desc = "Move to top of screen" },
    { "<S-l>", "<Cmd>:normal! L<CR>", desc = "Move to bottom of screen" },
  },
  opts = {
    options = {
      numbers = "ordinal",
      always_show_bufferline = true,
    },
  },
}
