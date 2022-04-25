set t_Co=256
set nocompatible

" {{{ ---- Bootstrap ----

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let s:py2 = expand("$HOME/tools/bin/python2")
if executable(s:py2)
  let g:autopep8_cmd = expand("$HOME/tools/bin/autopep8")
  let g:python_host_prog = s:py2
  " bin/pip install pynvim
else
  echom "tools3/bin/python not installed"
  " let s:py3 = expand("$HOME/tools3/bin/python")
  " if executable(s:py3)
  "   let g:autopep8_cmd = expand("$HOME/tools3/bin/autopep8")
  "   let g:python3_host_prog = s:py3
  " endif
endif

function! Identify()
  let l:h = hostname()
  if match(l:h, 'Lenovo') > -1
    return 'laptop'
  else
    return 'desktop'
  endif
endfunction
let g:my_machine = Identify()

let $DISPLAY=':0'

" }}}

" {{{ ---- Load plugins ----

filetype plugin on
filetype plugin indent on

" To reload plugins, after changing here:
" :so %
" :PlugInstall
" To uninstall a plugin:
"   remove from below
"   call:
"   :PlugClean!
" NOTE: Make sure you use single quotes when defining Plug

call plug#begin('~/.vim/nvim-plugged')

" Distraction-free editing; Turn on with :Goyo 80. Turn off with :Goyo!
" Plug 'junegunn/goyo.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

" The inimitable NerdTree. Locate files in explorer pane with <leader>f
Plug 'preservim/nerdtree'
Plug 'flwyd/nerdtree-harvest'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}

" Plug 'el-iot/buffer-tree-explorer.vim'

" Toggle comments with tcc
Plug 'tomtom/tcomment_vim'

" The :EasyAlign command
Plug 'junegunn/vim-easy-align'

" BufferBye, gives :Bdelete command to delete buffers. Mapped to Q
Plug 'moll/vim-bbye'

" See https://jakobgm.com/posts/vim/git-integration/
" Show git status stull in guter column (next to numbers)
Plug 'airblade/vim-gitgutter'


" Show indent guides
Plug 'Yggdroot/indentLine'
let g:indentLine_fileTypeExclude = ['json', 'markdown', 'rst']

" Plug 'vimwiki/vimwiki', {'branch': 'dev'}

Plug 'samoshkin/vim-mergetool'

" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'

" Handle multi-file find and replace.
Plug 'mhinz/vim-grepper'

" Lightline colors in status bar
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'    " , {'branch': 'add-ordinal-buffer-numbering'}

" ========== Language Support =========
" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
" and Vim 8 while you edit your text files.

Plug 'w0rp/ale'

Plug 'heavenshell/vim-jsdoc'

" Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
let g:polyglot_disabled = ['jsx']

Plug 'HerringtonDarkholme/yats.vim'

" Python 'tags' in a tagbar
Plug 'majutsushi/tagbar'
" Plug 'liuchengxu/vista.vim'   " tagbar replacement that uses LSP
Plug 'chrisbra/vim-xml-runtime'     " official XML ft plugin
"
" Preview css colors
Plug 'ap/vim-css-color'

" .pug files support
Plug 'digitaltoad/vim-pug'

" Better increment (ctrl+a/ctrl+x) behavior
Plug 'qwertologe/nextval.vim'

" Best color theme evah
Plug 'AlessandroYorba/Alduin'
" Plug 'scheakur/vim-scheakur'

" Git integration, do :Gdiff, :Gblame, :Gremove and more
Plug 'tpope/vim-fugitive'

call plug#end()

" }}}

" ---- Personal preferences ---- {{{
"
" Some of this stuff is lifted from sensible.vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" fix spurious q characters in konsole
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
set guicursor=

" syntax sync minlines=20000		" fixes syntax not updating on large files
" set autoindent
" set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

syntax enable
set backspace=indent,eol,start
set backup      " backups
set backupskip=/tmp/*,/private/tmp/*

set complete-=i
set completeopt+=preview

set cursorline
set conceallevel=0    " if set higher hides quotes in json files
set display+=lastline
set fillchars=vert:│,fold:━     " this changes characters used for splits and horizontal folding

set foldcolumn=1        " increase size of fold column
set foldlevelstart=0    " most folds opened by default
set foldopen=hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldenable
set foldmethod=marker   " fold based on markers level
" set foldmethod=syntax
set foldlevelstart=1

set formatoptions=tcqrn1        " set autoformat options (think gq). See http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set history=1000
set hlsearch        " highlight search matches
set laststatus=2
set lazyredraw
set list            " show whitespace characters, useful
set listchars=tab:▸\ ,trail:•,extends:>,precedes:<,nbsp:+,eol:¬
set mouse=
set noincsearch     " jumps to first match as you type
set noshowmode      " already provided by lightline
set nosmartcase
set nosmartindent
set nosmarttab
set nospell
set nowrap          " don't wrap, it's annoying
set nrformats-=octal
set number
" set nuw=6               " increase size of gutter column
set nuw=5               " increase size of gutter column
set ruler
set scrolloff=3     " how many lines to bottom cause scrolling
set showcmd
set showmatch
set showtabline=2     " always show the tabline
set sidescrolloff=5
set splitbelow      " preferences for where the split happens
set splitright
set termguicolors
set textwidth=79
set ttimeout
set timeoutlen=800
set ttimeoutlen=10
set undofile
set undolevels=200        " undo settings
set novisualbell  " annoying screen flash in VIM
set wildmenu
set writebackup
set ff=unix

set expandtab
set tabstop=2   " not liking big tabs
set shiftwidth=2

" set foldenable    " this makes the folds closed when file is opened
" set ignorecase        " when searching, ignore case if all letters lowercase
" set smartcase     " override ignorecase if term has caps


" 'inccommand' shows results while typing a |:substitute| command
if exists('&inccommand')
  set inccommand=split  " can also do nosplit for inline preview
endif

" clipboard configuration
set clipboard=          " unnamedplus      "EasyClip + Vim + system clipboard

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
catch
endtry

" }}}

" Autofocus active file when changing buffers
" See https://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif

" ---- Custom functions ---- {{{

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension . ' guifg=' . a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" bash execute contents of current buffer and filter it to a new window
command! FW call FilterToNewWindow()
function! FilterToNewWindow()
  let TempFile = tempname()
  let SaveModified = &modified
  exe 'w ' . TempFile
  exe '!chmod +x ' . TempFile
  let &modified = SaveModified
  exe ':e ' . TempFile
  exe '%! ' . @%
  exe 'w!'
endfunction

" }}}

" ---- Plugin configurations --- {{{

" buftabline configuration
let g:buftabline_numbers = 2    " show buffer position next to each buffer label
" use \1 to go to tab 1

let g:indentLine_char = '│'
let g:indentLine_color_gui = '#111111'

" jump to the other tag with \z
" nnoremap <leader>z :MtaJumpToOtherTag<cr>

" asynchronous lint engine (ale) settings

let g:ale_set_balloons = 0
let g:ale_cursor_detail = 0
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "         ➜ "

" let g:ale_python_flake8_executable = expand("$HOME/tools3/bin/flake8")
" let g:ale_python_autopep8_executable = expand("$HOME/tools3/bin/autopep8")
" let g:ale_python_black_executable = expand("$HOME/tools3/bin/black")
" let g:ale_python_isort_executable = expand("$HOME/tools3/bin/isort")

" let g:ale_python_pyls_executable = expand("$HOME/tools/bin/pyls")

let g:ale_javascript_eslint_options = "--no-color"
let g:ale_javascript_eslint_executable = "./eslint.sh"

" expand("NODE_PATH=project/node_modules project/node_modules/.bin/eslint")

"       \
"'command':
"
" call ale#linter#Define('javascript', {
"       \   'name': 'eslint',
"       \   'output_stream': 'both',
"       \   'executable': function('ale#handlers#eslint#GetExecutable'),
"       \   'command': function('ale#handlers#eslint#GetCommand'),
"       \   'callback': 'ale#handlers#eslint#HandleJSON',
"       \})

" \       'add_blank_lines_for_python_control_statements',
" let g:ale_fixers = {
"       \   'python': [
"       \       'remove_trailing_lines',
"       \       'autopep8',
"       \       'isort',
"       \   ],
"       \   'javascript': ['eslint'],
"       \   'css': ['stylelint'],
"       \   'less': ['prettier'],
"       \   'json': ['prettier']
"       \}
"
" Available Linters: ['bandit', 'flake8', 'mypy', 'prospector', 'pycodestyle', 'pydocstyle', 'pyflakes', 'pylama', 'pylint', 'pyls', 'pyre', 'vulture']
" Enabled Linters: ['flake8', 'mypy', 'pylint']
" Suggested Fixers:
" 'add_blank_lines_for_python_control_statements' - Add blank lines before control statements.
" 'autopep8' - Fix PEP8 issues with autopep8.
" 'black' - Fix PEP8 issues with black.
" 'isort' - Sort Python imports with isort.
" 'remove_trailing_lines' - Remove all blank lines at the end of a file.
" 'reorder-python-imports' - Sort Python imports with reorder-python-imports.
" 'trim_whitespace' - Remove all trailing whitespace characters at the end of every line.
" 'yapf' - Fix Python files with yapf.

let g:ale_fixers = {
      \   'python': [
      \       'black',
      \       'isort',
      \       'trim_whitespace',
      \       'remove_trailing_lines',
      \   ],
      \   'javascript': ['eslint'],
      \   'css': ['stylelint'],
      \   'less': ['prettier'],
      \   'json': ['prettier']
      \}

let g:ale_linters = {
      \ 'python': ['flake8'],
      \ 'javascript': ['eslint'],
      \ 'xml': ['xmllint'],
      \ 'css': ['stylelint'],
      \ 'less': ['stylelint']
      \ }

" let g:ale_linters_explicit = 1
" let g:ale_fix_on_save = 1
"
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'


" let g:ale_linters.python = ['pyls']   " use vim-lsp for python integration

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_column_always = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

let g:ale_sign_error = "X"
let g:ale_sign_warning = "‼"
"
let g:NERDTreeShowHidden=1
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

" Ensure you have installed some decent font to show these pretty symbols, then
" you can enable icon for the kind.
" let g:vista_icon_indent = ["╰▸ ", "├▸ "]
" let g:vista#renderer#enable_icon = 1
" " TODO: need to fix the default icon
" let g:vista#renderer#icons = {
" \   "default": "\uf794",
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }

" }}}

" ---- File type based settings ---- {{{
"
"

au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
":%!~/tools3/bin/zpretty -z

augroup configgroup
  autocmd!
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

  " autocmd BufEnter * :syntax sync fromstart
  autocmd BufNewFile,BufRead *.pt setlocal filetype=xml
  autocmd BufNewFile,BufRead *.zpt setlocal filetype=xml
  autocmd BufNewFile,BufRead *.zcml setlocal filetype=xml
  autocmd BufNewFile,BufRead *.overrides setlocal filetype=less
  autocmd BufNewFile,BufRead *.variables setlocal filetype=less

  " autocmd BufWritePre *.{pt,zpt} :call ZPT_format()
  " autocmd BufWritePre *.zcml :call ZCML_format()

  autocmd BufNewFile,BufRead *.overrides setlocal filetype=less

  autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript
  autocmd BufNewFile,BufRead *.js setlocal filetype=javascript

  autocmd BufNewFile,BufRead *.vue setlocal filetype=html
  autocmd BufNewFile,BufRead *.tag setlocal filetype=html
  autocmd BufNewFile,BufRead *.json setlocal conceallevel=0

  autocmd Filetype json setlocal conceallevel=0
  autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
  autocmd Filetype pug setlocal ts=4 sw=4 sts=4 expandtab
  autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
  autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab
  autocmd Filetype xquery setlocal ts=4 sw=4 sts=4 expandtab

  " autocmd Filetype vue setlocal ts=2 sw=2 sts=2 expandtab
  " autocmd Filetype riot setlocal ts=2 sw=2 sts=0 expandtab

  autocmd FileType python setlocal commentstring=#\ %s
  autocmd Filetype python setlocal tabstop=4 shiftwidth=4 expandtab colorcolumn=89
  autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
  autocmd FileType python match Excess /\%120v.*/
  autocmd FileType python setlocal nowrap
  autocmd FileType python setlocal textwidth=89
  autocmd FileType python setlocal foldlevel=99

  autocmd FileType markdown setlocal conceallevel=0

  " autocmd Filetype python nnoremap <buffer> <silent> <C-K> :LspPreviousError<CR>
  " autocmd Filetype python nnoremap <buffer> <silent> <C-J> :LspNextError<CR>
  " autocmd VimEnter *.py nested TagbarOpen

  autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

  autocmd FileType rst setlocal wrap
  autocmd FileType rst setlocal textwidth=79
  autocmd Filetype rst setlocal ts=4 sw=4 sts=4 expandtab

augroup END

augroup alestatusupdate
  autocmd!
  autocmd BufEnter,BufRead * call ale#Queue(0)
  autocmd User ALELint call lightline#update()
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

:call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
:call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
:call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
:call NERDTreeHighlightFile('vim', 'yellow', 'none', 'yellow', '#151515')
:call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
:call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
:call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
:call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
:call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
:call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
:call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
:call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
:call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
:call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" }}}

" ---- Lightline configuration ---- {{{

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ ['darkestgreen', 'brightgreen', 'bold'], ['white', 'gray4'] ]
let s:p.normal.right = [ ['gray5', 'gray10'], ['gray9', 'gray4'], ['gray8', 'gray2'] ]
let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'], ['gray4', 'gray0'] ]
let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'], ['white', 'darkblue'] ]
let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.left = [ ['white', 'brightred', 'bold'], ['white', 'gray4'] ]
let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'], ['white', 'gray4'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
let s:p.replace.middle = s:p.normal.middle
let s:p.replace.right = s:p.normal.right
let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
let s:p.tabline.tabsel = [ [ 'gray9', 'gray1' ] ]
" let s:p.tabline.middle = [ [ 'gray2', '#0b2828' ] ]
" let s:p.tabline.middle = [ [ 'gray2', 'gray8' ] ]
let s:p.tabline.middle = [ [ 'gray2', '#221616' ] ]
let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]
let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]

let g:lightline#colorscheme#farlight#palette = lightline#colorscheme#fill(s:p)
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[...]'
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#filename_modifier  = ':t'    " only show filename. See :help filename-modifiers for more options

" components are name:function to call
" use the active: left/right lists to control what shows where
let g:lightline = {
      \ 'colorscheme': 'farlight',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
      \ 'active': {
      \   'left': [[ 'mode', 'paste', 'alestatus'], ['fugitive', 'filename']],
      \   'right': [['percent'], ['lineinfo'], ['bufsettings'], ['method']]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'filetype': 'LightLineFiletype',
      \   'fileformat': 'LightLineFileformat',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'bufsettings': 'LightLineBufSettings',
      \   'cocstatus': 'coc#status',
      \   'method': 'NearestMethodOrFunction',
      \ },
      \ 'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers',
      \     'alestatus': 'g:LinterStatus'
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel' ,
      \   'alestatus': 'error'
      \ }
      \ }

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
function! g:LightLineAleStatus()
  let l:s = ALEGetStatusLine()
  return ('' != l:s ? ['', l:s, '' ] : '')
endfunction

function! g:LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
          \   '%dW %dE',
          \   all_non_errors,
          \   all_errors
          \)
endfunction

" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction

function! LightLineBufSettings()
  let et = &et ==# 1 ? "•" : "➜"
  let l:ft = &filetype ==# 'nerdtree'
  let l:text = '│ts│'. &tabstop . '│sw│'. &shiftwidth . '│et│' . et . '│'
  return (!l:ft ? text : '')
endfunction

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? "✱" : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == '__vista__' ? "tags by Vista" :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
  " return fname == '__Tagbar__' ? g:lightline.fname :
  "       \ fname =~ '__Gundo\|NERD_tree' ? '' :
  "       \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
  "       \ ('' != fname ? fname : '[No Name]') .
  "       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" for more symbols, see this:
" U+E0A0     Version control branch
" U+E0A1     LN (line) symbol
" U+E0A2     Closed padlock
" U+E0B0     Rightwards black arrowhead
" U+E0B1     Rightwards arrowhead
" U+E0B2     Leftwards black arrowhead
" U+E0B3     Leftwards arrowhead
" To test them in terminal, run:
" echo -e "\ue0a0\ue0a1\ue0a2\ue0b0\ue0b1\ue0b2\ue0b3"

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? "\ue0a0 ".branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ &filetype ==# 'nerdtree' ? 'NERDTree' :
        \ winwidth(0) > 40 ? lightline#mode() :
        \ ''
endfunction

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" }}}

" {{{ ---- Git integration ----

" Open current line in the browser
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)
nmap <Leader>gp <Plug>(GitGutterPrevHunk)

" Hunk-add and hunk-revert for chunk staging: git add/undo (chunk)
nmap <Leader>ga <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

" Open vimagit pane
nnoremap <leader>gs :Magit<CR>       " git status
" Push to remote
nnoremap <leader>gP :! git push<CR>  " git Push
" browse through chunks with <C-n> and <C-p>, stage the current chunk with S,
" and enter commit mode with CC, alternatively CA for making an amending
" commit. Once you have written your commit message in commit mode, “write” the
" buffer with your preferred save command and you’re done! Also the E binding,
" which will open the modified/staged chunk in your other pane.

" Show commits for every source line
nnoremap <Leader>gb :Gblame<CR>  " git blame

nnoremap <Leader>gB :.Gbrowse<CR>
" Open visual selection in the browser
vnoremap <Leader>gB :Gbrowse<CR>

" Add the entire file to the staging area
nnoremap <Leader>gaf :Gw<CR>      " git add file

let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
" open mergetool with \mt
nmap <leader>mt <plug>(MergetoolToggle)

" }}}

" ---- Other settings {{{
let &colorcolumn=80
" highlight the column at 80 chars
" match OverLength /\%81v.\+/
" highlight OverLength guibg=#592929

if (g:my_machine ==# 'laptop')
  set background=dark

  let g:alduin_Shout_Become_Ethereal = 1      " black background
  colorscheme alduin

  " highlight SignColumn guibg=black
  hi ColorColumn guibg=#112233
  hi Conceal guibg=#000000 guifg=#111111
  hi CursorLine guibg=#222222
  hi CursorLineNr guibg=#222222
  hi Define guifg=#6633ee
  hi EndOfBuffer guifg=bg     " hide ~ at end of buffers
  hi LineNr guibg=#121519 guifg=#444444
  hi NonText guifg=#332233    " change color of at end of line conceal characters
  hi Normal guibg=#111111
  hi Search guifg=#dfdfaf guibg=#AA0b02
  hi SpellBad term=underline gui=undercurl guisp=Orange
  hi String guibg=#111111
  hi Visual guibg=#1a5b3a guifg=#CCCCCC
  hi htmlLink guifg=#668866

  highlight SignColumn guibg=bg
  highlight SignColumn ctermbg=bg

elseif (g:my_machine ==# 'desktop')
  set background=dark
  " colorscheme flatcolor

  let g:alduin_Shout_Become_Ethereal = 1      " black background
  colorscheme alduin

  highlight SignColumn guibg=bg
  highlight SignColumn ctermbg=bg
  hi ColorColumn guibg=#112233 guifg=#FFFFFF
  hi Conceal guibg=#000000 guifg=#111111
  hi CursorLine guibg=#191712
  hi CursorLineNr guibg=#191712 guifg=#FFFFFF
  hi Define guifg=#6633ee
  hi EndOfBuffer guifg=bg     " hide ~ at end of buffers
  hi LineNr guibg=#060606
  hi NonText guifg=#112233    " change color of at end of line conceal characters
  hi Normal guibg=#000000
  hi Search guibg=#3a0b02
  hi Search guifg=#dfdfaf guibg=#AA0b02
  hi SpellBad term=underline gui=undercurl guisp=Orange
  hi String guibg=#111111
  hi Todo guibg=#AA0b02 guifg=bg
  hi Visual guibg=#1a5b3a guifg=#CCCCCC
  hi htmlLink guifg=#668866

  " fixes match cursor
  highlight MatchParen       guifg=#dfdfaf  guibg=#875f5f  gui=NONE       ctermfg=187   ctermbg=95    cterm=NONE

  " hi ALEVirtualTextError guifg=#dfdfaf guibg=#AA0b02
  " hi ALEVirtualTextWarning guifg=#dfdfaf guibg=#AA0b02
  " hi ALEVirtualTextInfo guifg=#dfdfaf guibg=#AA0b02
  " hi ALEVirtualTextStyleError guifg=#dfdfaf guibg=#AA0b02
  " hi ALEVirtualTextStyleWarning guifg=#dfdfaf guibg=#AA0b02

  hi ALEVirtualTextError guifg=#AA0b02 guibg=#191712
  hi ALEVirtualTextWarning guifg=#AA0b02 guibg=#191712
  hi ALEVirtualTextInfo guifg=#AA0b02 guibg=#191712
  hi ALEVirtualTextStyleError guifg=#AA0b02 guibg=#191712
  hi ALEVirtualTextStyleWarning guifg=#AA0b02 guibg=#191712

  " |ALEVirtualTextError|        - Items with `'type': 'E'`
  " |ALEVirtualTextInfo|         - Items with `'type': 'I'`
  " |ALEVirtualTextStyleError|   - Items with `'type': 'E'` and `'sub_type': 'style'`
  " |ALEVirtualTextStyleWarning| - Items with `'type': 'W'` and `'sub_type': 'style'`
  " |ALEVirtualTextWarning|      - Items with `'type': 'W'`

endif

" space open/closes folds
nnoremap <space> za

" switch between recent tabs with <tab> key
nmap <tab> :b#<cr>
" cycle through tabs with shift-tab
nmap <S-tab> :bn<cr>

" Use <C-L> to clear the highlighting of :set hlsearch.
" if maparg('<C-L>', 'n') ==# ''
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>:syntax sync fromstart<CR>
" endif

" navigate between errors quickly
" nnoremap <silent> <C-K> <Plug>(ale_previous_wrap)
" nnoremap <silent> <C-J> <Plug>(ale_next_wrap)
nmap <silent> <C-K> :ALEPreviousWrap<CR>
nmap <silent> <C-J> :ALENextWrap<CR>

" Copy to system clipboard with F7, paste with Shift+f7
:map <F7> :w !xclip<CR><CR>
:vmap <F7> "*y
:map <S-F7> :r!xclip -o<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"
" toggle gundo
" nnoremap <leader>u :GundoToggle<CR>

" Close the current buffer
:nnoremap <Leader>fq :Bdelete<CR>
:nnoremap Q :Bdelete<CR>

"add a shortcut to insert pdb by doing \pdb
map <silent> <leader>pdb oimport pdb; pdb.set_trace()<Esc>=

" add a :DiffOrig command to see differences to last saved version
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

nnoremap <leader>v <cmd>CHADopen<cr>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>
" toggle vista (Tagbar replacement)
" nnoremap <silent> <Leader>t :Vista!!<CR>

" use f2 to format an xml file
" map <F2> <Esc>:1,$!xmllint --format -<CR>
" map <F2> <Esc>:%! /home/tibi/tools3/zpretty -x<CR>
" map <F3> <Esc>:%! /home/tibi/tools3/zpretty -z<CR>

" Execute current line or current selection as Vim EX commands.
" nnoremap <leader>x :exe getline(".")<CR>
" vnoremap <leader>X :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

" hit \D to insert date in format 2014-05-30
:nnoremap <Leader>D "=strftime("%Y-%m-%d")<CR>P
:inoremap <Leader>D <C-R>=strftime("%Y-%m-%d")<CR>

" navigate windows with meta+arrows (including 'escape' from terminal)
map <A-l> <c-w>l
map <A-h> <c-w>h
map <A-k> <c-w>k
map <A-j> <c-w>j
imap <A-l> <ESC><c-w>l
imap <A-h> <ESC><c-w>h
imap <A-k> <ESC><c-w>k
imap <A-j> <ESC><c-w>j

" terminal keys, escape terminal mode with <esc>
if exists(':tnoremap')
  :tnoremap <Esc> <C-\><C-n>

  " move between panes with alt+h/j/k/l
  :tnoremap <A-h> <C-\><C-n><C-w>h
  :tnoremap <A-j> <C-\><C-n><C-w>j
  :tnoremap <A-k> <C-\><C-n><C-w>k
  :tnoremap <A-l> <C-\><C-n><C-w>l
end
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" use \w to do a search/replace with current word
:nmap <leader>w :s/\(<c-r>=expand("<cword>")<cr>\)/

" hit F10 to show under cursor highlight group
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Some stuff from https://github.com/nickjj/dotfiles/blob/master/.vimrc

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" " Type a replacement term and press . to repeat the replacement again. Useful
" " for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Prevent x from overriding what's in the clipboard.
" noremap x "_x
" noremap X "_x

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Eliminate issues where you accidentally hold shift for too long with :w.
command! W write

" " Clear search highlights.
" map <Leader><Space> :let @/=''<CR>

" Toggle quickfix window.
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction

nnoremap <silent> <Leader>c :call QuickFix_toggle()<CR>

" Unset paste on InsertLeave.
" autocmd InsertLeave * silent! set nopaste

" Profile Vim by running this command once to start it and again to stop it.
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction

command! -bang Profile call s:profile(<bang>0)

" .............................................................................
" mhinz/vim-grepper
" .............................................................................

let g:grepper               = {}
let g:grepper.tools=["ag", "rg", "ack", "grep"]
" let g:grepper.jump          = 1
" let g:grepper.next_tool     = '<leader>g'
" let g:grepper.simple_prompt = 1
" let g:grepper.quickfix      = 0

" nnoremap <leader>gr :Grepper -tool git<cr>
nnoremap <leader>gr :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Start searching the word under the cursor:
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>


" Ag with file preview toggled by '?'
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" List files with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" FZF theming
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Ripgrep with FZF (slower than Ag for some reason?)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nmap <silent> <F8> ?function<cr>:noh<cr><Plug>(jsdoc)


" Check if NERDTree is open or active
function! s:isNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! s:syncTree()
  if &modifiable && s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call s:syncTree()
"
"
function CurPos(action)
  if a:action == "save"
    let b:saveve = &virtualedit
    let b:savesiso = &sidescrolloff
    set virtualedit=all
    set sidescrolloff=0
    let b:curline = line(".")
    let b:curvcol = virtcol(".")
    let b:curwcol = wincol()
    normal! g0
    let b:algvcol = virtcol(".")
    normal! M
    let b:midline = line(".")
    execute "normal! ".b:curline."G".b:curvcol."|"
    let &virtualedit = b:saveve
    let &sidescrolloff = b:savesiso
  elseif a:action == "restore"
    let b:saveve = &virtualedit
    let b:savesiso = &sidescrolloff
    set virtualedit=all
    set sidescrolloff=0
    execute "normal! ".b:midline."Gzz".b:curline."G0"
    let nw = wincol() - 1
    if b:curvcol != b:curwcol - nw
      execute "normal! ".b:algvcol."|zs"
      let s = wincol() - nw - 1
      if s != 0
        execute "normal! ".s."zl"
      endif
    endif
    execute "normal! ".b:curvcol."|"
    let &virtualedit = b:saveve
    let &sidescrolloff = b:savesiso
    unlet b:saveve b:savesiso b:curline b:curvcol b:curwcol b:algvcol b:midline
  endif
  return ""
endfunction

func! ZCML_format()
  "call CurPos("save")
  let save_cursor = getcurpos()
  exe '%!~/tools3/bin/zpretty -z'
  call setpos('.', save_cursor)
  "call CurPos("restore")
endfunc

func! ZPT_format()
  let save_cursor = getcurpos()
  exe '%!~/tools3/bin/zpretty -x'
  call setpos('.', save_cursor)
endfunc

:nnoremap Y yy

" if executable('java') && filereadable(expand('~/lsp/org.eclipse.lsp4xml-0.3.0-uber.jar'))
  " au User lsp_setup call lsp#register_server({
  "       \ 'name': 'lsp4xml',
  "       \ 'cmd': {server_info->[
  "       \     'java',
  "       \     '-noverify',
  "       \     '-Xmx1G',
  "       \     '-XX:+UseStringDeduplication',
  "       \     '-Dfile.encoding=UTF-8',
  "       \     '-jar',
  "       \     expand('~/lsp/org.eclipse.lsp4xml-0.3.0-uber.jar')
  "       \ ]},
  "       \ 'whitelist': ['xml']
  "       \ })

  " call ale#linter#Define('xml', {
  "       \   'name': 'lsp4xml',
  "       \   'lsp': 'stdio',
  "       \   'executable': 'java',
  "       \   'command': expand("java -noverify -Xmx1G -XX:+UseStringDeduplication -Dfile.encoding=UTF-8 -jar $HOME/lsp/org.eclipse.lsp4xml-0.3.0-uber.jar stdin"),
  "       \   'project_root': expand("$HOME/lsp"),
  "       \})
" endif


" }}}

" ---- Disabled stuff ---- {{{

" call ale#linter#Define('html', {
"       \   'name': 'customhtmlhint',
"       \   'executable': 'htmlhint',
"       \   'command': expand("htmlhint --config $HOME/.htmlhintrc --format=unix stdin"),
"       \   'callback': 'ale#handlers#HandleUnixFormatAsError',
"       \})
" let g:ale_linters = {
"   \ 'html: ['customhtmlhint'],
"   \ 'python': ['flake8'],
"   \}
" let g:ale_python_pylint_executable = expand("$HOME/tools3/bin/pylint")
" let g:ale_python_pylint_options = '--rcfile=~/.pylintc'
" let g:ale_linters.python = ['pylint']
" TODO: solve python3 compatibility
" let s:golint = expand('$HOME/go/bin/golint %t')
" call ale#linter#Define('go', {
"       \   'name': 'golint',
"       \   'executable': 'golint',
"       \   'command': s:golint,
"       \   'callback': 'ale#handlers#unix#HandleAsWarning',
"       \})
" let g:ale_linters.go = ['golint']
" setup proper python support
"
" let g:pymode_lint = 0                                   " disable pymode linting
" let g:pymode_rope = 0                                   " disable pymode rope support
" let g:pymode_rope_completion = 0                        " disable completition on insert mode and  hit .
" let g:pymode_syntax = 1
" let g:pymode_syntax_slow_sync = 1                       " slower syntax mode, better at docstrings
" let g:pymode_syntax_all = 1                             " enable all python highlights
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all " highlight indent errors

" really slows down nvim
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'liuchengxu/vim-clap'

" Plug 'mbadran/headlights'

" Vim file manager
" if (g:my_machine ==# 'desktop') " on laptop it crashes nvim. :(
" Plug 'Shougo/unite.vim'     " dependency for vimfiler
" Plug 'Shougo/vimfiler.vim'
" endif

" Helpers for writing vim scripts: :PP (pretty print), :Runtime (reload
" runtime), zS (show syntax groups),
" Plug 'tpope/vim-scriptease'

" Mappings for vim-husk.
" All mappings work only in vim command line mode.
" C-a go to the beginning of the line
" C-f go one character right or fall back to c_CTRL-F at the end of the line
" C-b go one character left
" C-d delete character or fall back to c_CTRL-D at the end of the line
" C-k clear line after the cursor, overrides c_CTRL-K (if you're using C-k for digraphs check the docs how to disable)
" C-x C-e open the command-line window, same as c_CTRL-f
" M-f (Alt-f) go one "word" right
" M-b (Alt-b) go one "word" left
" M-d (Alt-d) delete "word" after the cursor
" M-BS (Alt-Backspace) delete "word" before the cursor, same as c_CTRL-W
" M-# (Alt-shift-3) insert comment at the beginning of the line and execute it. Useful for discarding the line, but still keeping it in the command-line history for later retrieval.
" Plug 'vim-utils/vim-husk'

" Vim Substitute as operator plugin
" Plug 'kana/vim-operator-user'   " dependency of vim-operator-substitute
" Plug 'milsen/vim-operator-substitute'
"
" Plug 'scrooloose/nerdcommenter'

" Change surrounding parens: cs'"
" Plug 'tpope/vim-surround'

" :set ft=outlow for outliner functionality
" lines starting with ===, [x], [-] or [ ], followed by a space are topics.
" Plug 'lifepillar/vim-outlaw'

" FastFold mapping and settings
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
" let g:tex_fold_enabled=1
" let g:vimsyn_folding='af'
" let g:xml_syntax_folding = 1
" let g:python_syntax_folding = 1
" let g:php_folding = 1
" let g:perl_fold = 1

"
" buffer movement, this doesn't work in Tmux
" nnoremap <C-left> :bprev!<CR>
" nnoremap <C-right> :bnext!<CR>

" let s:pyls_exec = expand('$HOME/tools/bin/pyls')
" if executable(s:pyls_exec)
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->[s:pyls_exec]},
"         \ 'whitelist': ['python'],
"         \ })
" endif
" let g:lsp_diagnostics_enabled = 1   " don't rely on ale for diagnostics
" let g:lsp_signs_error = {'text': 'X'}
" let g:lsp_signs_warning = {'text': '‼'}
" let g:lsp_signs_hint = {'text': '?'}
" let g:lsp_signs_enabled = 1         " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
"
" " Highlight references to the symbol under the cursor
" let g:lsp_highlight_references_enabled = 1
" highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

" let g:ale_sign_error = "\u2639"     " sad smiley face
" let g:ale_sign_warning = "\u2614"     " umbrela under rain

" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
"   " let g:ackprg = 'ag --nogroup --nocolor --column'
" endif
" " dont jump to quickfix window immediately
" " TODO: see how to configure ag https://gist.github.com/manasthakur/5afd3166a14bbadc1dc0f42d070bd746
" cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>

" Adds :Gundo, a visual tree of the undo
" Plug 'sjl/gundo.vim'

" changes cursor shape to beam in insert mode
" bug: inserts q in terminal
" if !exists('$TMUX')     " only allow in non-tmux sessions, has display bug
"   Plug 'jszakmeister/vim-togglecursor'
" endif
"
" automatically set paste mode based on 'bracketed-paste' terminal support
" disabled, messes with <tab>
" Plug 'ConradIrwin/vim-bracketed-paste'
"
" allow changing between different physical environments adequate settings with
" :Thematic something
" Plug 'reedes/vim-thematic'
"
" Project wide find and replace
" :Far foo bar **/*.py
" :Fardo
" Plug 'brooth/far.vim'

" See https://www.mattlayman.com/blog/2019/supercharging-vim-blazing-fast-search/
" Plug 'jremmen/vim-ripgrep'

" Plug 'stefandtw/quickfix-reflector.vim'

" Use :Ack to search with ag (mapped to <leader>a )
" Plug 'mileszs/ack.vim'
" Better quickfix behavior.
" Plug 'yssl/QFEnter'
" Plug 'romainl/vim-qf'

" vim two-panes outliner
" Plug 'vim-voom/VOoM'

" Plug 'NovaDev94/lightline-onedark'  " lightline theme let g:lightline.colorscheme = 'onedark'

" Other UI enhancements
" Plug 'gelus/vim-buffer-enhancement'     " renumber buffer, <count><leader><c-6> renumbers to said <count>
" Plug 'jlanzarotta/bufexplorer'          " buffer list in buffer, open \be (normal) \bs (split), \bv (split vertical)
" Plug 't9md/vim-choosewin'               " Choose window to switch with -
"
" Plug 'vim-scripts/XQuery-indentomnicompleteftplugin'

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" Plug 'othree/html5.vim'
" Plug 'scrooloose/syntastic'
" See https://github.com/maralla/validator.vim for a better one??
" or https://github.com/neomake/neomake

" Plug 'python-mode/python-mode'
" Plug 'Vimjas/vim-python-pep8-indent'

" Python fix code with F8
" Plug 'tell-k/vim-autopep8'

" Plug 'vim-scripts/nginx.vim'

" Plug 'fatih/vim-go'         " do a :GoInstallBinaries
" Plug 'jodosha/vim-godebug'    " :GoToggleBreakpoint & :GoDebug

" Mustache and handlebars support
" Plug 'mustache/vim-mustache-handlebars'
" Riot.js support
" Plug 'ryym/vim-riot'

" Plug 'Galooshi/import-js'   " needs configuration, check package

" Format selection with :Neoformat
" Format selection in a different format :Neoformat! javascript
" Plug 'sbdchd/neoformat'
"
" Better (faster) auto-folding. Type zuz to manually update folds
" Plug 'Konfekt/FastFold'

" Plug 'NLKNguyen/papercolor-theme'
" Plug 'AlessandroYorba/Libertine'
" Plug 'AlessandroYorba/Despacio'
" Plug 'AlessandroYorba/Sierra'
" Plug 'AlessandroYorba/Arcadia' " not a scheme yet
" Plug 'AlessandroYorba/Monrovia'
" Plug 'MaxSt/FlatColor'
" Plug 'ajmwagar/vim-dues'
" Plug 'fcpg/vim-fahrenheit'       " earthy colors similar to alduin, starred by AlessandroYorba
" Plug 'danilo-augusto/vim-afterglow'
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'freeo/vim-kalisi'
" Plug '0ax1/lxvc'
" Plug 'junegunn/seoul256.vim'
" Plug 'morhetz/gruvbox'

" choose window with letters and overlay preview
" nmap - <Plug>(choosewin)
" let g:choosewin_overlay_enable = 1
" }}}

" ---- COC configuration ---- {{{

" " if hidden is not set, TextEdit might fail.
" set hidden
"
" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup
"
" " Better display for messages
" set cmdheight=1
"
" " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
"
" " don't give |ins-completion-menu| messages.
" " set shortmess+=c
"
" " always show signcolumns
" set signcolumn=yes
"
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" " inoremap <silent><expr> <C-space>
" "       \ pumvisible() ? "\<C-n>" :
" "       \ <SID>check_back_space() ? "\<TAB>" :
" "       \ coc#refresh()
" " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" " inoremap <silent><expr> <c-space> coc#refresh()
"
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " Or use `complete_info` if your vim support it, like:
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"
" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
"
" " Remap for format selected region
" xmap <leader>cf  <Plug>(coc-format-selected)
" nmap <leader>cf  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
"
" " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)
"
" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
"
" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
" " show git hunk diff
" nnoremap <silent> <leader>g  :CocCommand git.chunkInfo<CR>
"
" " Use auocmd to force lightline update.
" autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" let g:tagbar_type_xquery = {
"   \ 'ctagstype' : 'xquery',
"   \ 'kinds'     : [
"       \ 'd:macros:1:0',
"       \ 'p:prototypes:1:0',
"       \ 'g:enums',
"       \ 'e:enumerators:0:0',
"       \ 't:typedefs:0:0',
"       \ 'n:namespaces',
"       \ 'c:classes',
"       \ 's:structs',
"       \ 'u:unions',
"       \ 'f:functions',
"       \ 'm:members:0:0',
"       \ 'v:variables:0:0'
"   \ ],
"   \ 'sro'        : '::',
"   \ 'kind2scope' : {
"       \ 'g' : 'enum',
"       \ 'n' : 'namespace',
"       \ 'c' : 'class',
"       \ 's' : 'struct',
"       \ 'u' : 'union'
"   \ },
"   \ 'scope2kind' : {
"       \ 'enum'      : 'g',
"       \ 'namespace' : 'n',
"       \ 'class'     : 'c',
"       \ 'struct'    : 's',
"       \ 'union'     : 'u'
"   \ }
" \ }
" Plug 'ms-jpq/chadtree'

" Plug 'junegunn/fzf.vim'

" Enter vim-win with <leader>w or :Win. These can be customized (see
" Configuration below).
"
"     Arrows or hjkl keys are used for movement.
"
"     There are various ways to change the active window.
"         Use movement keys to move to neighboring windows.
"         Enter a window number (where applicable, press <enter> to submit).
"         Use w or W to sequentially move to the next or previous window.
"
"     Hold <shift> and use movement keys to resize the active window.
"         Left movements decrease width and right movements increase width.
"         Down movements decrease height and up movements increase height.
"
"     Press s followed by a movement key or window number, to swap buffers.
"
"     Press ? to show a help message.
"
"     Press <esc> to leave vim-win or go back (where applicable).
"
" Plug 'dstein64/vim-win'
" git lens blame plugin
" Plug 'ttys3/nvim-blamer.lua'
" Plug 'jreybert/vimagit'

"
" Load git blame line in buffer
" Plug 'tpope/vim-rhubarb'

" }}}
