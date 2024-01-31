local width = 120

return {
  "folke/noice.nvim",
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = "90%",
          col = "50%",
        },
        size = {
          width = width,
          height = "auto",
        },
        -- -- clean popup style
        -- border = {
        --   style = "none",
        --   padding = { 2, 3 },
        -- },
        -- win_options = {
        --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        -- },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = width,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
  },
}
