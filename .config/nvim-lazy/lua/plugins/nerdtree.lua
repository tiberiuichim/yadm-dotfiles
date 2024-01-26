return {
  "preservim/nerdtree",
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>NERDTreeFind<cr>", { desc = "Find file in NERDTree" })
  end,
}

-- " NERDTress File highlighting
-- function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
--   exec 'autocmd filetype nerdtree highlight ' . a:extension . ' guifg=' . a:guifg
--   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
-- endfunction

-- -- let g:NERDTreeShowHidden=1
-- let g:NERDTreeIndicatorMapCustom = {
--       \ "Modified"  : "✹",
--       \ "Staged"    : "✚",
--       \ "Untracked" : "✭",
--       \ "Renamed"   : "➜",
--       \ "Unmerged"  : "",
--       \ "Deleted"   : "✖",
--       \ "Dirty"     : "✗",
--       \ "Clean"     : "✔︎",
--       \ "Unknown"   : "?"
--       \ }
--
-- let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.egg-info$', '\~$', '\.git$', '\.eggs', '__pycache__', '\.\~']
-- let g:NERDTreeDirArrowExpandable = '▸'
-- let g:NERDTreeDirArrowCollapsible = '▾'
-- :call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
-- :call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
-- :call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
-- :call NERDTreeHighlightFile('vim', 'yellow', 'none', 'yellow', '#151515')
-- :call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
-- :call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
-- :call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
-- :call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
-- :call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
-- :call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
-- :call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
-- :call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
-- :call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
-- :call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
-- function! s:isNERDTreeOpen()
--   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
-- endfunction

-- local function isNERDTreeOpen()
--   local NERDTreeBufName = vim.g.NERDTreeBufName
--   return vim.api.nvim_buf_is_loaded(NERDTreeBufName)
--
--   -- if NERDTreeBufName then
--   --   local bufwin = vim.api.nvim_win_get_buf(0)
--   --   if bufwin == NERDTreeBufName then
--   --     return true
--   --   end
--   -- end
--   -- return false
-- end

-- local function NERDTreeFind()
--   --
-- end
