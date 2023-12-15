-- <Cmd>BufferLineGoToBuffer 1<cr>
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>1", "<Cmd>:lua require('bufferline').go_to(1, true)<cr>", desc = "Go to buffer 1" },
    { "<leader>2", "<Cmd>:lua require('bufferline').go_to(2, true)<cr>", desc = "Go to buffer 2" },
    { "<leader>3", "<Cmd>:lua require('bufferline').go_to(3, true)<cr>", desc = "Go to buffer 3" },
    { "<leader>4", "<Cmd>:lua require('bufferline').go_to(4, true)<cr>", desc = "Go to buffer 4" },
    { "<leader>5", "<Cmd>:lua require('bufferline').go_to(5, true)<cr>", desc = "Go to buffer 5" },
    { "<leader>6", "<Cmd>:lua require('bufferline').go_to(6, true)<cr>", desc = "Go to buffer 6" },
    { "<leader>7", "<Cmd>:lua require('bufferline').go_to(7, true)<cr>", desc = "Go to buffer 7" },
    { "<leader>8", "<Cmd>:lua require('bufferline').go_to(8, true)<cr>", desc = "Go to buffer 8" },
    { "<leader>9", "<Cmd>:lua require('bufferline').go_to(9, true)<cr>", desc = "Go to buffer 9" },
    { "<leader>0", "<Cmd:lua require('bufferline').go_to(10, true)<cr>", desc = "Go to buffer 10" },
    { "<S-h>", "<Cmd>:normal! H<CR>", desc = "Move to top of screen" },
    { "<S-l>", "<Cmd>:normal! L<CR>", desc = "Move to bottom of screen" },
  },
  opts = {
    options = {
      numbers = "ordinal",
      always_show_bufferline = true,
      tab_size = 12,
      -- show_close_icon = false,
      show_buffer_close_icons = false,
      show_buffer_icons = false,
    },
  },
}
