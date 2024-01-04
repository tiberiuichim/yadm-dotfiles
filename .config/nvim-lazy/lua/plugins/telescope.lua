return {
  "telescope.nvim",
  keys = {
    { "<leader>gr", "<Cmd>Telescope live_grep<cr>", desc = "Live Grep in Telescope" },
    { "<leader>U", "<cmd>Telescope undo<cr>", desc = "undo history" },
    -- local builtin = require('telescope.builtin')
    -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    -- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    -- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  },
  dependencies = {
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      local telescop = require("telescope")
      telescop.load_extension("fzf")
      telescop.load_extension("undo")
    end,
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
}

-- Mappings	Action
-- <C-n>/<Down>	Next item
-- <C-p>/<Up>	Previous item
-- j/k	Next/previous (in normal mode)
-- H/M/L	Select High/Middle/Low (in normal mode)
-- gg/G	Select the first/last item (in normal mode)
-- <CR>	Confirm selection
-- <C-x>	Go to file selection as a split
-- <C-v>	Go to file selection as a vsplit
-- <C-t>	Go to a file in a new tab
-- <C-u>	Scroll up in preview window
-- <C-d>	Scroll down in preview window
-- <C-f>	Scroll left in preview window
-- <C-k>	Scroll right in preview window
-- <M-f>	Scroll left in results window
-- <M-k>	Scroll right in results window
-- <C-/>	Show mappings for picker actions (insert mode)
-- ?	Show mappings for picker actions (normal mode)
-- <C-c>	Close telescope (insert mode)
-- <Esc>	Close telescope (in normal mode)
-- <Tab>	Toggle selection and move to next selection
-- <S-Tab>	Toggle selection and move to prev selection
-- <C-q>	Send all items not filtered to quickfixlist (qflist)
-- <M-q>	Send all selected items to qflist
