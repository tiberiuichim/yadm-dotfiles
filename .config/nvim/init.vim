set t_Co=256

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
else
  echom "not installed"
  let s:py3 = expand("$HOME/tools3/bin/python")
  if executable(s:py3)
    let g:autopep8_cmd = expand("$HOME/tools3/bin/autopep8")
    let g:python3_host_prog = s:py3
  endif
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

" }}}

" {{{ ---- Plugin configuration ----

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
"
" ==================== File managers

" The inimitable NerdTree
Plug 'scrooloose/nerdtree'
" really slows down nvim
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim file manager
" if (g:my_machine ==# 'desktop') " on laptop it crashes nvim. :(
" Plug 'Shougo/unite.vim'     " dependency for vimfiler
" Plug 'Shougo/vimfiler.vim'
" endif

" ================== Enhancements to vim's functionality
"
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
" Toggle comments with tcc
Plug 'tomtom/tcomment_vim'
" Plug 'scrooloose/nerdcommenter'

" Change surrounding parens: cs'"
" Plug 'tpope/vim-surround'

" :set ft=outlow for outliner functionality
" lines starting with ===, [x], [-] or [ ], followed by a space are topics.
" Plug 'lifepillar/vim-outlaw'
"
" BufferBye, gives :Bdelete command to delete buffers
Plug 'moll/vim-bbye'
"
" Show git status stull in guter column (next to numbers)
Plug 'airblade/vim-gitgutter'

" Git integration, do :Gdiff, :Gblame, :Gremove and more
Plug 'tpope/vim-fugitive'

" Show indent guides
Plug 'Yggdroot/indentLine'

Plug 'vimwiki/vimwiki', {'branch': 'dev'}

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
" The :EasyAlign command
Plug 'junegunn/vim-easy-align'

" Project wide find and replace
" :Far foo bar **/*.py
" :Fardo
" Plug 'brooth/far.vim'

" Use :Ack to search with ag (mapped to <leader>a )
Plug 'mileszs/ack.vim'
" Better quickfix behavior.
" Plug 'yssl/QFEnter'
" Plug 'romainl/vim-qf'

" vim two-panes outliner
" Plug 'vim-voom/VOoM'

" Lightline colors in status bar
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'    " , {'branch': 'add-ordinal-buffer-numbering'}
" Plug 'NovaDev94/lightline-onedark'  " lightline theme let g:lightline.colorscheme = 'onedark'

" Other UI enhancements
" Plug 'gelus/vim-buffer-enhancement'     " renumber buffer, <count><leader><c-6> renumbers to said <count>
" Plug 'jlanzarotta/bufexplorer'          " buffer list in buffer, open \be (normal) \bs (split), \bv (split vertical)
" Plug 't9md/vim-choosewin'               " Choose window to switch with -
"
" Plug 'vim-scripts/XQuery-indentomnicompleteftplugin'

" ========== Language Support =========
" Plug 'othree/html5.vim'
Plug 'w0rp/ale'
" Plug 'scrooloose/syntastic'
" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
" and Vim 8 while you edit your text files.
" See https://github.com/maralla/validator.vim for a better one??
" or https://github.com/neomake/neomake

" Plug 'python-mode/python-mode'
Plug 'Vimjas/vim-python-pep8-indent'

" Python fix code with F8
Plug 'tell-k/vim-autopep8'

Plug 'vim-scripts/nginx.vim'

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

" Python 'tags' in a tagbar
Plug 'majutsushi/tagbar'
"
" Preview css colors
Plug 'ap/vim-css-color'

" Better increment (ctrl+a/ctrl+x) behavior
Plug 'qwertologe/nextval.vim'

" Better (faster) auto-folding. Type zuz to manually update folds
" Plug 'Konfekt/FastFold'

" ============ Colorthemes
Plug 'AlessandroYorba/Alduin'
" Plug 'AlessandroYorba/Libertine'
" Plug 'AlessandroYorba/Despacio'
" Plug 'AlessandroYorba/Sierra'
" Plug 'AlessandroYorba/Arcadia' " not a scheme yet
" Plug 'AlessandroYorba/Monrovia'
" Plug 'MaxSt/FlatColor'
" Plug 'ajmwagar/vim-dues'
" Plug 'fcpg/vim-fahrenheit'       " earthy colors similar to alduin, starred by AlessandroYorba
" Plug 'danilo-augusto/vim-afterglow'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'freeo/vim-kalisi'
" Plug '0ax1/lxvc'
" Plug 'junegunn/seoul256.vim'
" Plug 'morhetz/gruvbox'

call plug#end()

" }}}

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

" bash execute contents of current buffer and filter it to a new window
command! FW call FilterToNewWindow()

" hit F10 to show under cursor highlight group
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" }}}

" ---- Personal preferences ---- {{{
"
" Some of this stuff is lifted from sensible.vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" fix spurious q characters in konsole
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
set guicursor=

syntax enable
" syntax sync minlines=20000		" fixes syntax not updating on large files
" set autoindent
set backspace=indent,eol,start
set backup      " backups
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set complete-=i
set cursorline
set conceallevel=0    " if set higher hides quotes in json files
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set display+=lastline
set fillchars=vert:│,fold:━     " this changes characters used for splits and horizontal folding
set foldcolumn=1        " increase size of fold column
set foldlevelstart=0    " most folds opened by default
set foldmethod=marker   " fold based on markers level
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
set nuw=6               " increase size of gutter column
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

set expandtab
set tabstop=2   " not liking big tabs
set shiftwidth=2

" set foldenable    " this makes the folds closed when file is opened
" set ignorecase        " when searching, ignore case if all letters lowercase
" set smartcase     " override ignorecase if term has caps

" clipboard configuration
set clipboard=          " unnamedplus      "EasyClip + Vim + system clipboard

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
catch
endtry

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

elseif (g:my_machine ==# 'desktop')
  set background=dark
  " colorscheme flatcolor

  let g:alduin_Shout_Become_Ethereal = 1      " black background
  colorscheme alduin

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
  hi Todo guibg=red guifg=#333333
  hi Visual guibg=#1a5b3a guifg=#CCCCCC
  hi htmlLink guifg=#668866
  " fixes match cursor
  highlight MatchParen       guifg=#dfdfaf  guibg=#875f5f  gui=NONE       ctermfg=187   ctermbg=95    cterm=NONE

endif

let &colorcolumn=80

" highlight the column at 80 chars
" match OverLength /\%81v.\+/
" highlight OverLength guibg=#592929

" space open/closes folds
nnoremap <space> za

" FastFold mapping and settings
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:python_syntax_folding = 1
" let g:php_folding = 1
" let g:perl_fold = 1

"
" buffer movement, this doesn't work in Tmux
" nnoremap <C-left> :bprev!<CR>
" nnoremap <C-right> :bnext!<CR>

" switch between recent tabs with <tab> key
nmap <tab> :b#<cr>
" cycle through tabs with shift-tab
nmap <S-tab> :bn<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
"
" Use <C-L> to clear the highlighting of :set hlsearch.
" if maparg('<C-L>', 'n') ==# ''
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>:syntax sync fromstart<CR>
" endif

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"
" toggle gundo
" nnoremap <leader>u :GundoToggle<CR>

" Close the current buffer
:nnoremap <Leader>fq :Bdelete<CR>
:nnoremap Q :Bdelete<CR>

"add a shortcut to insert pdb by doing \pdb
map <leader>pdb oimport pdb; pdb.set_trace()<Esc>=

" add a :DiffOrig command to see differences to last saved version
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

nnoremap <silent> <Leader>f :NERDTreeFind<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>

" use f2 to format an xml file
map <F2> <Esc>:1,$!xmllint --format -<CR>


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

" }}}

" ---- Plugin configurations --- {{{

" setup proper python support
"
let g:pymode_lint = 0                                   " disable pymode linting
let g:pymode_rope = 0                                   " disable pymode rope support
let g:pymode_rope_completion = 0                        " disable completition on insert mode and  hit .
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1                       " slower syntax mode, better at docstrings
let g:pymode_syntax_all = 1                             " enable all python highlights
let g:pymode_syntax_indent_errors = g:pymode_syntax_all " highlight indent errors

" buftabline configuration
let g:buftabline_numbers = 2    " show buffer position next to each buffer label
" use \1 to go to tab 1

let g:indentLine_char = '│'
let g:indentLine_color_gui = '#111111'

" jump to the other tag with \z
" nnoremap <leader>z :MtaJumpToOtherTag<cr>

" asynchronous lint engine (ale) settings
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'python': ['flake8'],
" \}

call ale#linter#Define('html', {
      \   'name': 'customhtmlhint',
      \   'executable': 'htmlhint',
      \   'command': expand("htmlhint --config $HOME/.htmlhintrc --format=unix stdin"),
      \   'callback': 'ale#handlers#HandleUnixFormatAsError',
      \})
let g:ale_linters = {}
let g:ale_linters.html = ['customhtmlhint']

" let g:ale_python_pylint_executable = expand("$HOME/tools3/bin/pylint")
" let g:ale_python_pylint_options = '--rcfile=~/.pylintc'
" let g:ale_linters.python = ['pylint']
"
let g:ale_python_flake8_executable = expand("$HOME/tools3/bin/flake8")
let g:ale_linters.python = ['flake8']

let g:ale_python_autopep8_executable = expand("$HOME/tools3/bin/autopep8")

let g:ale_fixers = {
      \   'python': [
      \       'add_blank_lines_for_python_control_statements',
      \       'remove_trailing_lines',
      \       'isort',
      \   ],
      \}

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" let g:ale_sign_error = "\u2639"     " sad smiley face
" let g:ale_sign_warning = "\u2614"     " umbrela under rain
" let g:ale_sign_error = "WW"
" let g:ale_sign_warning = "EE"

let s:golint = expand('$HOME/go/bin/golint %t')
call ale#linter#Define('go', {
      \   'name': 'golint',
      \   'executable': 'golint',
      \   'command': s:golint,
      \   'callback': 'ale#handlers#unix#HandleAsWarning',
      \})
let g:ale_linters.go = ['golint']

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  " let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" dont jump to quickfix window immediately
" TODO: see how to configure ag https://gist.github.com/manasthakur/5afd3166a14bbadc1dc0f42d070bd746
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"
" " Auto-open NerdTree on all vims
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
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.egg-info$', '\~$', '\.git$', '\.eggs', '__pycache__']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

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

" choose window with letters and overlay preview
" nmap - <Plug>(choosewin)
" let g:choosewin_overlay_enable = 1

" }}}

" ---- File type based settings ---- {{{
"
"

au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

augroup configgroup
  autocmd!
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

  " autocmd BufEnter * :syntax sync fromstart
  autocmd BufNewFile,BufRead *.pt setlocal filetype=xml
  autocmd BufNewFile,BufRead *.zcml setlocal filetype=xml
  autocmd BufNewFile,BufRead *.js setlocal filetype=javascript
  autocmd BufNewFile,BufRead *.vue setlocal filetype=html
  autocmd BufNewFile,BufRead *.tag setlocal filetype=html

  autocmd Filetype json setlocal conceallevel=0
  autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
  autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
  autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab
  autocmd Filetype xquery setlocal ts=4 sw=4 sts=4 expandtab
  " autocmd Filetype vue setlocal ts=2 sw=2 sts=2 expandtab
  " autocmd Filetype riot setlocal ts=2 sw=2 sts=0 expandtab

  " temp disabled:
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd Filetype python setlocal tabstop=4 shiftwidth=4 expandtab colorcolumn=80
  autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
  autocmd FileType python match Excess /\%120v.*/
  autocmd FileType python setlocal nowrap
  autocmd FileType python setlocal textwidth=79
  autocmd FileType python setlocal foldlevel=99
  "
  " autocmd VimEnter *.py nested TagbarOpen

  autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

augroup END
" }}}

" ---- Lightline configuration ---- {{{
" components are name:function to call
" use the active: left/right lists to control what shows where

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


let g:lightline = {
      \ 'active': {
      \   'left': [[ 'mode', 'paste', 'alestatus'], ['fugitive', 'filename']],
      \   'right': [['percent'], ['lineinfo'], ['bufsettings']]
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
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ }
      \ }

let g:lightline.colorscheme      = 'farlight'
" let g:lightline.colorscheme = 'neodark'
" let g:lightline.mode_map         = { 'c': 'NORMAL' }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers', 'alestatus': 'g:LightLineAleStatus'}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers', 'alestatus': 'g:LinterStatus'}
let g:lightline.component_type   = {'buffers': 'tabsel' , 'alestatus': 'error'}
let g:lightline.separator        = { 'left': '', 'right': '' }
let g:lightline.subseparator     = { 'left': '', 'right': '' }

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[...]'
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#filename_modifier  = ':t'    " only show filename. See :help filename-modifiers for more options
"
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

" augroup alestatusupdate
"     autocmd!
"     " autocmd BufWritePre * :call lightline#update()
" augroup END
" move between ALE error signs
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

augroup alestatusupdate
  autocmd!
  autocmd BufEnter,BufRead * call ale#Queue(0)
  autocmd User ALELint call lightline#update()
augroup END

function! LightLineBufSettings()
  let et = &et ==# 1 ? "•" : "➜"
  return ('│ts│'. &tabstop . '│sw│'. &shiftwidth . '│et│' . et . '│')
endfunction

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? "✱" : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  " let fname = expand('%:t')
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
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
  return winwidth(0) > 60 ? lightline#mode() : ''
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

let g:tagbar_type_xquery = {
  \ 'ctagstype' : 'xquery',
  \ 'kinds'     : [
      \ 'd:macros:1:0',
      \ 'p:prototypes:1:0',
      \ 'g:enums',
      \ 'e:enumerators:0:0',
      \ 't:typedefs:0:0',
      \ 'n:namespaces',
      \ 'c:classes',
      \ 's:structs',
      \ 'u:unions',
      \ 'f:functions',
      \ 'm:members:0:0',
      \ 'v:variables:0:0'
  \ ],
  \ 'sro'        : '::',
  \ 'kind2scope' : {
      \ 'g' : 'enum',
      \ 'n' : 'namespace',
      \ 'c' : 'class',
      \ 's' : 'struct',
      \ 'u' : 'union'
  \ },
  \ 'scope2kind' : {
      \ 'enum'      : 'g',
      \ 'namespace' : 'n',
      \ 'class'     : 'c',
      \ 'struct'    : 's',
      \ 'union'     : 'u'
  \ }
\ }

" }}}
