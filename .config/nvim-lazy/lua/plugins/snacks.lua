return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  keys = {
    {
      "<leader>e",
      function()
        require("snacks").explorer.reveal()
      end,
    },
  },
  opts = {
    scroll = {
      enabled = false,
      -- your scroll configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
