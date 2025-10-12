-- vim.api.nvim_set_keymap('n', '<leader>tt', [[<cmd>lua require('test_toggle').toggle_between_source_and_test()<CR>]], { noremap = true, silent = true })

return {
  "aleixab/test-toggle.nvim",
  config = function()
    require("test-toggle").setup({
      src_path_pattern = "lib/(.+)%.lua$",
      src_replace_pattern = "lib/spec/%1_spec.lua",
      test_path_pattern = "lib/spec/(.+)_spec%.lua$",
      test_replace_pattern = "lib/%1.lua",
    })
  end,
  keys = {
    {
      "<leader>tt",
      function()
        require("test-toggle").toggle_between_source_and_test()
      end,
      desc = "Toggle b/w source/test",

      -- [[<cmd>lua require('test_toggle').toggle_between_source_and_test()<CR>]],
    },
  },
}
