return {
  "samoshkin/vim-mergetool",
  keys = {
    { "<leader>mt", "<Cmd>MergetoolToggle<cr>", desc = "Toggle Mergetool" },
  },
  config = function()
    vim.g.mergetool_layout = "mr"
    vim.g.mergetool_prefer_revision = "local"
  end,
}

--   vim.cmd [[
-- let g:mergetool_layout = 'mr'
-- let g:mergetool_prefer_revision = 'local'
--   ]]
