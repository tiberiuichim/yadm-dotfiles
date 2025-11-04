-- See https://github.com/AlessandroYorba/Alduin/blob/master/colors/alduin.vim
-- and https://github.com/zenbones-theme/zenbones.nvim/blob/main/lua/neobones/palette.lua
-- and https://github.com/zenbones-theme/zenbones.nvim/blob/main/lua/zenbones/specs/dark.lua#L71
-- and https://github.com/rktjmp/lush.nvim#advanced-usage
return {
  "mcchrish/zenbones.nvim",
  dependencies = "rktjmp/lush.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.g.zenbones_darken_comments = 45
    local base = require("neobones")
    local palette = require("neobones.palette")
    local generator = require("zenbones.specs")
    local lush = require("lush")

    local bg = vim.o.background
    local p = palette[bg]
    local specs = generator.generate(p, bg, generator.get_global_config("neobones", bg))
    local hsluv = lush.hsluv

    -- Create some specs
    -- local specs = lush.parse(function()
    --   return {
    --     TabLine({ base.TabLine, gui = "italic" }), -- setting gui to "italic"
    --   }
    -- end)

    -- Apply specs using lush tool-chain
    lush.apply(lush.compile(specs))

    vim.cmd.colorscheme("neobones")
  end,
}
