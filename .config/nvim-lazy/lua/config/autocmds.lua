-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- au BufRead,BufNewFile *.mine                set filetype=mine

vim.api.nvim_exec(
  [[
  augroup filetype_mapping
    autocmd!
    autocmd BufRead,BufNewFile *.script set filetype=lua
  augroup END
]],
  false
)
