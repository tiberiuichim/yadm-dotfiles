-- see https://github.com/nvim-tree/nvim-tree.lua
return {
  "preservim/nerdtree",
  config = function()
    vim.api.nvim_exec(
      [[
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

function! HighlightFile()
  " Execute the NERDTreeHighlightFile command
  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')    
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')      
  call NERDTreeHighlightFile('vim', 'yellow', 'none', 'yellow', '#151515')    
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')    
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515') 
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')   
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')   
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')   
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')       
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')        
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')       
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')       
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')  
endfunction

let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ "Unknown"   : "?"
      \ }

let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.egg-info$', '\~$', '\.git$', '\.eggs', '__pycache__', '\.\~']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

  autocmd FileType nerdtree call HighlightFile()

]],
      false
    )

    vim.api.nvim_set_keymap("n", "<leader>fe", "<cmd>NERDTreeFind<cr>", { desc = "Find file in NERDTree" })
    vim.api.nvim_exec(
      [[
]],
      false
    )
  end,
  enabled = false,
}

-- -- let g:NERDTreeShowHidden=1
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
