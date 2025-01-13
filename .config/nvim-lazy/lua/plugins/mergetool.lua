return {
  "samoshkin/vim-mergetool",
  keys = {
    { "<leader>mt", "<Cmd>MergetoolToggle<cr>", desc = "Toggle Mergetool" },
    { "<leader>ml", "<Cmd>MergetoolDiffExchangeLeft<cr>", desc = "Mergetool exchange left" },
    { "<leader>mr", "<Cmd>MergetoolPreferRemote<cr>", desc = "Mergetool prefer remote" },
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
