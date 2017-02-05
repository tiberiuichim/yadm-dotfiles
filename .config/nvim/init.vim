" {{{ ---- Bootstrap ----
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
endif
let s:py3 = expand("$HOME/tools3/bin/python")
if executable(s:py3)
    let g:python3_host_prog = s:py3
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

" TODO: add install of htmlhint and custom ~/.htmlhintrc
" {
"     "tagname-lowercase": true,
"     "attr-lowercase": true,
"     "attr-value-double-quotes": true,
"     "doctype-first": false,
"     "tag-pair": true,
"     "tag-self-close": true,
"     "spec-char-escape": true,
"     "id-unique": true,
"     "src-not-empty": true,
"     "attr-no-duplication": true,
"     "title-require": true
" }

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
"
" Show git status icons for files, in NerdTree
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim file manager
if (g:my_machine ==# 'desktop') " on laptop it crashes nvim. :(
    Plug 'Shougo/unite.vim'     " dependency for vimfiler
    Plug 'Shougo/vimfiler.vim'
endif

" ================== Enhancements to vim's functionality
"
" Helpers for writing vim scripts: :PP (pretty print), :Runtime (reload
" runtime), zS (show syntax groups),
Plug 'tpope/vim-scriptease'

" Vim Substitute as operator plugin
Plug 'kana/vim-operator-user'   " dependency of vim-operator-substitute
Plug 'milsen/vim-operator-substitute'
"
" Toggle comments with tcc
Plug 'tomtom/tcomment_vim'

" Change surrounding parens: cs'"
Plug 'tpope/vim-surround'

" :set ft=outlow for outliner functionality
" lines starting with ===, [x], [-] or [ ], followed by a space are topics.
Plug 'lifepillar/vim-outlaw'
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

" Adds :Gundo, a visual tree of the undo
Plug 'sjl/gundo.vim'

" changes cursor shape to beam in insert mode
" bug: inserts q in terminal
if !exists('$TMUX')     " only allow in non-tmux sessions, has display bug
    Plug 'jszakmeister/vim-togglecursor'
endif
"
" automatically set paste mode based on 'bracketed-paste' terminal support
Plug 'ConradIrwin/vim-bracketed-paste'
"
" allow changing between different physical environments adequate settings with
" :Thematic something
Plug 'reedes/vim-thematic'
"
" Use :Ack to search with ag (mapped to <leader>a )
Plug 'mileszs/ack.vim'

" The :EasyAlign command
Plug 'junegunn/vim-easy-align'

" Project wide find and replace
" :Far foo bar **/*.py
" :Fardo
Plug 'brooth/far.vim'

" vim two-panes outliner
Plug 'vim-voom/VOoM'

" Lightline colors in status bar
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'    " , {'branch': 'add-ordinal-buffer-numbering'}
Plug 'NovaDev94/lightline-onedark'  " lightline theme let g:lightline.colorscheme = 'onedark'

" Other UI enhancements
Plug 'gelus/vim-buffer-enhancement'     " renumber buffer, <count><leader><c-6> renumbers to said <count>
Plug 'jlanzarotta/bufexplorer'          " buffer list in buffer, open \be (normal) \bs (split), \bv (split vertical)

" ========== Language Support =========
Plug 'w0rp/ale'
" Plug 'scrooloose/syntastic'
" ALE (Asynchronous Lint Engine) is a plugin for providing linting in NeoVim
" and Vim 8 while you edit your text files.
" See https://github.com/maralla/validator.vim for a better one??
" or https://github.com/neomake/neomake

" Everything programming language syntax and indent
" Plug 'sheerun/vim-polyglot'
Plug 'python-mode/python-mode'
" these are slow?
" Plug 'posva/vim-vue'
" Plug 'pangloss/vim-javascript'
"
" Plug 'hdima/python-syntax'

" Python fix code with F8
Plug 'tell-k/vim-autopep8'

" Format selection with :Neoformat
" Format selection in a different format :Neoformat! javascript
" Plug 'sbdchd/neoformat'

" Python 'tags' in a tagbar
Plug 'majutsushi/tagbar'
"
" Preview css colors
Plug 'ap/vim-css-color'

" ============ Colorthemes
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Despacio'
Plug 'AlessandroYorba/Sierra'
" Plug 'AlessandroYorba/Arcadia' " not a scheme yet
Plug 'AlessandroYorba/Monrovia'
Plug 'MaxSt/FlatColor'
Plug 'fcpg/vim-fahrenheit'       " earthy colors similar to alduin, starred by AlessandroYorba


" ======== Plugins with problems ===========
" EditorConfig, global/per project configuration of whitespace settings
" TODO: this adds time to startup, delay
" Plug 'editorconfig/editorconfig-vim'
" Always highlight enclosing tags
" Plug 'valloric/matchtagalways'
" Tabline / bufferline plugins. Not all of them work with airline
" See vim-buftabline github page for alternatives
" Plug 'ap/vim-buftabline'
" Adds cx<motion> to exchange texts between them. Has problems with plug
" Plug 'tommcdo/vimexchange'

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
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
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

" }}}
"
" ---- Personal preferences ---- {{{
"
" Some of this stuff is lifted from sensible.vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax enable

set autoindent
set backspace=indent,eol,start
set backup      " backups
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set complete-=i
set cursorline
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set display+=lastline
set expandtab
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
set shiftwidth=4
set showcmd
set showmatch
set showtabline=2     " always show the tabline
set sidescrolloff=5
set splitbelow      " preferences for where the split happens
set splitright
set tabstop=4   " not liking big tabs
set termguicolors
set textwidth=79
set ttimeout
set ttimeoutlen=10
set undofile
set undolevels=10000        " undo settings
set visualbell
set wildmenu
set writebackup

" set foldenable    " this makes the folds closed when file is opened
" set ignorecase        " when searching, ignore case if all letters lowercase
" set smartcase     " override ignorecase if term has caps

" clipboard configuration
set clipboard=unnamedplus      "EasyClip + Vim + system clipboard
" let g:EasyClipShareYanks=1      " share clipboard between vim instances, saves in $HOME/.easyclip
" let g:EasyClipShareYanksFile='.easyclip'
" let g:EasyClipShareYanksDirectory='$HOME'
" let g:EasyClipUseCutDefaults = 0        " don't introduce the m command, make the x instead
"
" nmap x <Plug>MoveMotionPlug
" xmap x <Plug>MoveMotionXPlug
" nmap xx <Plug>MoveMotionLinePlug
"
" let g:EasyClipUsePasteToggleDefaults = 0
"
" nmap <c-f> <plug>EasyClipSwapPasteForward
" nmap <c-d> <plug>EasyClipSwapPasteBackwards

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
catch
endtry

if (g:my_machine ==# 'laptop')
    " colorscheme NeoSolarized
    " colo base16-atelier-forest
    " colo base16-atelier-seaside
    " let base16colorspace=256
    " colo base16-default-dark
    " colo molokai
    " colo hybrid
    " colo PaperColor
    " highlight Normal guibg=#121212
    " highlight CursorLine guibg=#020310
    " highlight Normal guifg=#e0e0e0 guibg=#2C3E50
    set background=dark
    " let g:alduin_Dragon_Aspect = 1              " almost black background
    let g:alduin_Shout_Become_Ethereal = 1      " black background
    " let g:alduin_Shout_Aura_Whisper = 1         " underline matching parens
    " let g:alduin_Shout_Fire_Breath = 0          " adds dark red color
    " let g:alduin_Shout_Animal_Allegiance = 1    " remove background from strings

    " let g:despacio_Sunset = 1
    " let g:despacio_Twilight = 1
    let g:despacio_Midnight = 1

    colorscheme despacio
elseif (g:my_machine ==# 'desktop')
    set background=dark
    colorscheme flatcolor
    highlight Normal guibg=#000000
    highlight Todo guibg=red
    highlight SpellBad term=underline gui=undercurl guisp=Orange
    highlight Search guibg=#3a0b02
    highlight Visual guibg=#0a4b1a
    " highlight Normal guibg=#100e15
endif

highlight EndOfBuffer guifg=bg     " hide ~ at end of buffers
highlight NonText guifg=#223311    " change color of at end of line conceal characters
highlight ColorColumn guibg=#2a0111
" let &colorcolumn=80
" highlight ColorColumn guibg=red


" highlight OverLength guibg=#592929
" match OverLength /\%81v.\+/
" highlight the column at 80 chars

" space open/closes folds
nnoremap <space> za
"
" buffer movement, this doesn't work in Tmux
nnoremap <C-left> :bprev!<CR>
nnoremap <C-right> :bnext!<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Execute current line or current selection as Vim EX commands.
nnoremap <leader>x :exe getline(".")<CR>
vnoremap <leader>X :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

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
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" }}}

" ---- Plugin configurations --- {{{

" setup proper python support
"
let g:pymode_lint = 0       " disable pymode linting
let g:pymode_rope = 0       " disable pymode rope support
let g:pymode_rope_completion = 0       " disable completition on insert mode and  hit .
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1       " slower syntax mode, better at docstrings
let g:pymode_syntax_all = 1             " enable all python highlights
let g:pymode_syntax_indent_errors = g:pymode_syntax_all     " highlight indent errors

" buftabline configuration
let g:buftabline_numbers = 2    " show buffer position next to each buffer label
" use \1 to go to tab 1
" nmap <leader>1 <Plug>BufTabLine.Go(1)
" nmap <leader>2 <Plug>BufTabLine.Go(2)
" nmap <leader>3 <Plug>BufTabLine.Go(3)
" nmap <leader>4 <Plug>BufTabLine.Go(4)
" nmap <leader>5 <Plug>BufTabLine.Go(5)
" nmap <leader>6 <Plug>BufTabLine.Go(6)
" nmap <leader>7 <Plug>BufTabLine.Go(7)
" nmap <leader>8 <Plug>BufTabLine.Go(8)
" nmap <leader>9 <Plug>BufTabLine.Go(9)
" nmap <leader>0 <Plug>BufTabLine.Go(10)
"

let g:indentLine_char = '│'
let g:indentLine_color_gui = '#111111'

" jump to the other tag with \z
nnoremap <leader>z :MtaJumpToOtherTag<cr>

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
let g:ale_python_flake8_executable = expand("$HOME/tools/bin/flake8")
let g:ale_linters.python = ['flake8']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1

" let g:ale_sign_error = "\u2639"     " sad smiley face
" let g:ale_sign_warning = "\u2614"     " umbrela under rain
let g:ale_sign_error = "EE"
let g:ale_sign_warning = "WW"

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  " let g:ackprg = 'ag --nogroup --nocolor --column'
endif
" dont jump to quickfix window immediately
" TODO: see how to configure ag https://gist.github.com/manasthakur/5afd3166a14bbadc1dc0f42d070bd746
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Auto-open NerdTree on all vims
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
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.egg-info$', '\~$', '\.git$', '\.eggs']
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

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Close the current buffer
:nnoremap <Leader>fq :Bdelete<CR>

"add a shortcut to insert pdb by doing \pdb
map <leader>pdb oimport pdb; pdb.set_trace()<Esc>=

" add a :DiffOrig command to see differences to last saved version
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

nnoremap <silent> <Leader>f :NERDTreeFind<CR>
" nnoremap <silent> <Leader>t :TagbarToggle<CR>

" use f2 to format an xml file
map <F2> <Esc>:1,$!xmllint --format -<CR>

" }}}

" ---- File type based settings ---- {{{
"

augroup configgroup
    autocmd!
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

    autocmd BufNewFile,BufRead *.pt setlocal filetype=html
    autocmd BufNewFile,BufRead *.zcml setlocal filetype=xml

    autocmd BufNewFile,BufRead *.js setlocal filetype=javascript
    autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
    autocmd BufNewFile,BufRead *.js setlocal ts=2 sw=2 sts=0 expandtab
    autocmd BufNewFile,BufRead *.vue setlocal filetype=html ts=2 sw=2 sts=0 expandtab
    autocmd Filetype vue setlocal ts=2 sw=2 sts=0 expandtab
    autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab
    autocmd Filetype html setlocal ts=2 sw=2 expandtab

    autocmd FileType python setlocal commentstring=#\ %s
    autocmd Filetype python setlocal tabstop=4 shiftwidth=4 expandtab colorcolumn=80
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python setlocal nowrap
    autocmd FileType python setlocal foldlevel=99
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
" let g:lightline.mode_map         = { 'c': 'NORMAL' }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers', 'alestatus': 'g:LightLineAleStatus'}
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

" }}}

" ---- Stuff that's commented ---- {{{


" To test for fullcolor support in terminal:
" awk 'BEGIN{
"     s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
"     for (colnum = 0; colnum<77; colnum++) {
"         r = 255-(colnum*255/76);
"         g = (colnum*510/76);
"         b = (colnum*255/76);
"         if (g>255) g = 510-g;
"         printf "\033[48;2;%d;%d;%dm", r,g,b;
"         printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
"         printf "%s\033[0m", substr(s,colnum+1,1);
"     }
"     printf "\n";
" }'
"

" Adds :ClipBrd, a buffer for the clipboar
" Plug 'vim-scripts/genutils'     " dependency for clipbrd
" Plug 'vim-scripts/clipbrd'
" Plug 'svermeulen/vim-easyclip'
" Plug  'maxbrunsfeld/vim-yankstack'
"   Plug 'chriskempson/tomorrow-theme', {'rtp':'vim'}
"   Plug 'iCyMind/NeoSolarized'
"   Plug 'jacoborus/tender.vim'
"   Plug 'jonathanfilip/vim-lucius'
"   Plug 'joshdick/onedark.vim'
"   Plug 'nanotech/jellybeans.vim'
"   Plug 'rakr/vim-two-firewatch'
"   Plug 'romainl/Apprentice'
"   Plug 'tomasr/molokai'
"   Plug 'chriskempson/base16-vim'
"   Plug 'nanotech/jellybeans.vim'
"   Plug 'vim-scripts/256-jungle'
"   Plug 'croaker/mustang-vim'
"   Plug 'zeis/vim-kolor'
"   Plug 'jnurmine/Zenburn'
"   Plug 'w0ng/vim-hybrid'
"   Plug 'morhetz/gruvbox'
"   Plug 'NLKNguyen/papercolor-theme'
"   Plug 'dikiaap/minimalist'

"   Plug 'goatslacker/mango.vim'
"   Plug 'tpope/vim-vividchalk'
" Tmux
"
" Currently, vim can not work well in tmux. But neovim works perfect.
" If you meet a color issue when using tmux. Make sure:
"
"     using lastest tmux (v2.2)
"     your $TERM variable set to "xterm-256color"
"
"     add the line below to your .tmux.conf file.
"
"     set-option -ga terminal-overrides ",xterm-256color:Tc"
"
" "

"
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" " insert mode - line
" let &t_SI .= "<Esc>[5 q"
" "replace mode - underline
" "let &t_SR .= "<Esc>[4 q"
" "common - block
" let &t_EI .= "<Esc>[3 q"


" Don't close window, when deleting a buffer
" command! Bclose call <SID>BufcloseCloseIt()
" function! <SID>BufcloseCloseIt()
"   let l:currentBufNum = bufnr("%")
"   let l:alternateBufNum = bufnr("#")
"
"   if buflisted(l:alternateBufNum)
"       buffer #
"   else
"       bnext
"   endif
"
"   if bufnr("%") == l:currentBufNum
"       new
"   endif
"
"   if buflisted(l:currentBufNum)
"       execute("bdelete! ".l:currentBufNum)
"   endif
" endfunction
"
"
" function! CleanClose(tosave)
"   if (a:tosave == 1)
"       w!
"   endif
"   let todelbufNr = bufnr("%")
"   let newbufNr = bufnr("#")
"   if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
"       exe "b".newbufNr
"   else
"       bnext
"   endif
"
"   if (bufnr("%") == todelbufNr)
"       new
"   endif
"   exe "bd".todelbufNr
"   " call Buftabs_show()
" endfunction
"
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
" let g:pymode_rope = 0
"
" " Documentation
" let g:pymode_doc = 0
" let g:pymode_doc_key = 'K'
"
" "Linting
" let g:pymode_lint = 1
" let g:pymode_lint_message = 1
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" " let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
" " Auto check on save
" let g:pymode_lint_write = 1
" "
" "   let g:pymode_lint_ignore = "E501,W"

" Support virtualenv
" let g:pymode_virtualenv = 0
"
" " Enable breakpoints plugin
" let g:pymode_breakpoint = 0
" let g:pymode_breakpoint_key = 'b'
"
" " syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Show leader guide for all key mappings
" Plug 'hecal3/vim-leader-guide'

" set guifont=Inconsolata\ 11
" "set guifont=Liberation\ Mono\ 10
" set guioptions-=m
" set guioptions-=T

" let g:lightline = {
"       \ 'component': {
"       \   'readonly': '%{&readonly?"":""}',
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' }
"       \ }
" Better (python including) text objects, folding and m ore
" Plug 'tweekmonster/braceless.vim'
", { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-sensible'
" Plug 'klen/python-mode'
" Plug 'tmhedberg/SimpylFold'
" Plug 'vim-scripts/calmar256-lightdark.vim'
" Buffers integration with tabs and windows
" Plug 'bling/vim-bufferline'
" Plug 'zefei/vim-wintabs'
" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Rainbow parantheses
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'luochen1990/rainbow'

" http://www.calmar.ws/dotfiles/dotfiledir/calmar256-dark.vim
" set t_Co=256
"
" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
" let g:neosolarized_contrast = "high"
" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
" let g:neosolarized_visibility = "normal"

" If you wish to enable/disable Solarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable.
" let g:neosolarized_bold = 1
" let g:neosolarized_underline = 1
" let g:neosolarized_italic = 0
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
"
" set encoding=utf-8
" Remember info about open buffers on close
" set viminfo^=%
" nnoremap <Leader>fc <Esc>:call CleanClose(1)<CR>
" nnoremap <Leader>fq <Esc>:call CleanClose(0)<CR>
" map <leader>bd :Bclose<cr>
" Use your leader key + l to toggle on/off
" map <leader>l :set list!<CR> " Toggle tabs and EOL
" Escape from :terminal with Esc:
" :tnoremap <Esc> <C-\><C-n>

" Visual mode pressing * or # searches for the current selection
" vnoremap <silent> * :call VisualSelection('f')<CR>
" vnoremap <silent> # :call VisualSelection('b')<CR>

" autocmd FileType python BracelessEnable +indent +fold +highlight
" autocmd FileType python RainbowParenthesesToggle

" colo Tomorrow-Night-Bright
" colo calmar256-dark
" colorscheme NeoSolarized
" colorscheme lucius
" colorscheme onedark
" highlight LineNr guibg=black
" highlight Normal guibg=black guifg=white
" highlight SignColumn guibg=black
" set background=dark
" set background=dark
"
" autocmd vimenter * NERDTree

" function! VisualSelection(direction) range
"   let l:saved_reg = @"
"   execute "normal! vgvy"
"
"   let l:pattern = escape(@", '\\/.*$^~[]')
"   let l:pattern = substitute(l:pattern, "\n$", "", "")
"
"   if a:direction == 'b'
"       execute "normal ?" . l:pattern . "^M"
"   elseif a:direction == 'gv'
"       call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
"   elseif a:direction == 'replace'
"       call CmdLine("%s" . '/'. l:pattern . '/')
"   elseif a:direction == 'f'
"       execute "normal /" . l:pattern . "^M"
"   endif
"
"   let @/ = l:pattern
"   let @" = l:saved_reg
" endfunction
"
"   autocmd FileType ruby setlocal tabstop=2
"   autocmd FileType ruby setlocal shiftwidth=2
"   autocmd FileType ruby setlocal softtabstop=2
"   autocmd FileType ruby setlocal commentstring=#\ %s
"   autocmd VimEnter * highlight clear SignColumn
"   autocmd FileType xml setlocal foldmethod=syntax
"   autocmd FileType xml setlocal shiftwidth=4 expandtab ts=4 smarttab
"   autocmd FileType java setlocal noexpandtab
"   autocmd FileType java setlocal list
"   autocmd FileType java setlocal listchars=tab:+\ ,eol:-
"   autocmd FileType java setlocal formatprg=par\ -w75\ -T4
"
"   autocmd FileType php setlocal expandtab
"   autocmd FileType php setlocal list
"   autocmd FileType php setlocal listchars=tab:+\ ,eol:-
"   autocmd FileType php setlocal formatprg=par\ -w80\ -T4
"
    " autocmd FileType haml,yaml,coffee BracelessEnable +indent +fold +highlight

"   autocmd FileType python setlocal foldmethod=indent
"   autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"   autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
"   autocmd FileType python setlocal foldlevelstart=1
"
"   autocmd BufNewFile,BufRead *.css.dtml setlocal filetype=css
"
"   autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
"
"   autocmd BufEnter *.cls setlocal filetype=java
"   autocmd BufEnter *.zsh-theme setlocal filetype=zsh
"   autocmd BufEnter Makefile setlocal noexpandtab
"   autocmd BufEnter *.sh setlocal tabstop=2
"   autocmd BufEnter *.sh setlocal shiftwidth=2
"   autocmd BufEnter *.sh setlocal softtabstop=2
" autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()

"
" function! MyFiletype()
"   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . '' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
" endfunction
"
" function! MyFileformat()
"   return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
" endfunction
"

" vim-devicons confiration
" whether or not to show the nerdtree brackets around flags
" let g:webdevicons_conceal_nerdtree_brackets = 1
" " the amount of space to use after the glyph character (default ' ')
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
" " Force extra padding in NERDTree so that the filetype icons line up vertically
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
" " use double-width(1) or single-width(0) glyphs
" " only manipulates padding, has no effect on terminal or set(guifont) font
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
" Adds file icons in NerdTree, airline, unite, vim-startify, etc
" It should be loaded last!
" Plug 'ryanoasis/vim-devicons'
" " Show marks in gutter
" Plug 'kshenoy/vim-signature'

" augroup my_dirvish_events
"   autocmd!
"   " Map t to "open in new tab".
"   autocmd FileType dirvish
" 	\  nnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
" 	\ |xnoremap <buffer> t :call dirvish#open('tabedit', 0)<CR>
"
"   " Enable :Gstatus and friends.
"   autocmd FileType dirvish call fugitive#detect(@%)
"
"   " Map CTRL-R to reload the Dirvish buffer.
"   autocmd FileType dirvish nnoremap <buffer> <C-R> :<C-U>Dirvish %<CR>
"
"   " Map `gh` to hide dot-prefixed files.
"   " To "toggle" this, just press `R` to reload.
"   autocmd FileType dirvish nnoremap <buffer>
" 	\ gh :keeppatterns g@\v/\.[^\/]+/?$@d<cr>
"
"   " hide .pyc files by deleting them
"   autocmd FileType dirvish :g/.pyc/d
"   autocmd FileType dirvish :g/.egg-info/d
"   autocmd FileType dirvish :g/\~$/d
"   " sort folders at top
"   autocmd FileType dirvish :sort r /[^\/]$/
" augroup END
"
" dirvish, alternate file explorer in split
" Plug 'justinmk/vim-dirvish'

" Show indent guides with <leader>ig
" Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=DarkSlateGray

" function! LightLineFugitive()
"   try
"     if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
"       let mark = ''  " edit here for cool mark
"       let branch = fugitive#head()
"       return branch !=# '' ? mark.branch : ''
"     endif
"   catch
"   endtry
"   return ''
" endfunction
" syntastic configuration
" let g:syntastic_python_checkers = ['pyflakes']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1

" }}}
