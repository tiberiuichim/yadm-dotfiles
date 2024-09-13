-- return {
--   "hrsh7th/cmp-buffer",
--   event = "VeryLazy",
--   config = function()
--     print("Loaded here")
--     require("cmp").setup({
--       sources = {
--         { name = "buffer" },
--         option = {
--           get_bufnrs = function()
--             return vim.api.nvim_list_bufs()
--           end,
--         },
--       },
--     })
--   end,
-- }

return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path" },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            local bufs = vim.api.nvim_list_bufs()
            -- print("Buffs", vim.inspect(bufs))
            return bufs

            -- local bufs = {}
            -- for _, win in ipairs(vim.api.nvim_list_wins()) do
            --   bufs[vim.api.nvim_win_get_buf(win)] = true
            -- end
            -- print("Buffs", vim.inspect(vim.tbl_keys(bufs)))
            -- return vim.tbl_keys(bufs)
          end,
          -- keyword_pattern = [[\k\+]],
        },
      },
    })
  end,
}
