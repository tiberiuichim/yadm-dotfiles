return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    {
      "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
      opts = {},
    },
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
  },
  keys = {
    { "n", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true } },
  },
  event = "VeryLazy",
  config = function()
    print("hello world")
    require("codecompanion").setup({
      adapters = {
        openai = function()
          local token = os.getenv("OPENAI_API_KEY")
          local openai = require("codecompanion.adapters.openai")
          print(openai)
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = token,
            },
            url = "https://api.together.xyz/v1/chat/completions",
            schema = vim.tbl_deep_extend("force", {}, vim.deepcopy(openai), {
              model = {
                default = "meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo",
              },
            }),
          })
        end,
      },
    })
  end,
}
