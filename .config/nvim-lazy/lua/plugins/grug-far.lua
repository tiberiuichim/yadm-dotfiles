local function global_search_replace()
  local far = require("grug-far")
  far.grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
end

return {
  "MagicDuck/grug-far.nvim",
  enable = false,
  event = "VeryLazy",
  keys = {
    { "<leader>gy", global_search_replace, desc = "Global search/replace for word" },
  },
  config = function()
    require("grug-far").setup({
      -- ... options, see Configuration section below ...
      -- ... there are no required options atm...
    })
  end,
}
