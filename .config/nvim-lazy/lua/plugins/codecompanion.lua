return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "github/copilot.vim",
    "ravitemer/mcphub.nvim",
  },
  config = function()
    vim.api.nvim_echo({ { "Hello, this is a startup message!" } }, true, {})

    require("codecompanion").setup({
      opts = {
        log_level = "DEBUG", -- or "TRACE"
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    })
  end,
}
