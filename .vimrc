set nocompatible
set ruler
set backspace=2
set showmode
set noerrorbells
set et
set sw=4
set tabstop=8
set shiftwidth=4
set smarttab
set title
set gcr=a:blinkon0
set autoindent
set smartindent
set laststatus=2
set incsearch
set showcmd
set showmatch
set nostartofline
set hidden
syntax on
syntax enable
set wildmenu
set wildmode=list:longest
set mouse=a
set ttymouse=xterm2
set ignorecase
set smartcase
set number
set wrap
set linebreak
set history=1000
" set backup
"set hlsearch
set spellcapcheck=""
set modelines=0
"set undofile
set directory=~/.vimswap,~/tmp,/tmp
filetype plugin on
filetype indent on

set cino=(0
set ofu=syntaxcomplete#Complete

set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

au! FileType python setl nosmartindent

" File types
au BufNewFile,BufRead *.*_xml set ft=xml
au BufNewFile,BufRead *.*_xsl set ft=xslt
au BufNewFile,BufRead *.sm set ft=cpp


set autochdir
highlight StatusLine ctermfg=15 ctermbg=4
highlight StatusLineNC ctermfg=4 ctermbg=7
set statusline=%t\ <%F\ %m\ %=%l/%L,%c\ %P
"set statusline=%t\ <%F\        "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file

if has("autocmd")
  filetype plugin indent on
  " autocmd FileType text setlocal textwidth=78

  " always jump to last edit position when opening a file
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

helptags $HOME/.vim/doc

" vimdiff stuff
if &diff
    set wrap
endif

" hi LineNr ctermfg=gray ctermbg=black
" hi Comment ctermfg=lightblue ctermbg=black

set shellcmdflag=-cl


set formatoptions=tcqorn

nnoremap <silent> \g :!glimpse <cword> \| less <CR>
" let g:glimpseFlags = "-in -H /buildarea/chris_linstid/glimpse/$CURR_VIEW"
" let g:glimpseKey = "<Leader>g"

nnoremap <silent> \d :VCSDiff<CR>

" Most Recently Used
nnoremap <silent> \mr :MRU<CR>
let MRU_Max_Entries = 1000

" Clear search highlighting
" nnoremap <CR> :noh<CR><CR>

" minibufexplorer
let g:miniBufExplMapWindowNavVim = 1

" Search for selected text, forwards or backwards.
" vnoremap <silent> * :<C-U>
"   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"   \gvy/<C-R><C-R>=substitute(
"   \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"   \gV:call setreg('"', old_reg, old_regtype)<CR>
" vnoremap <silent> # :<C-U>
"   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
"   \gvy?<C-R><C-R>=substitute(
"   \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
"   \gV:call setreg('"', old_reg, old_regtype)<CR>

"map <C-]> :GtagsCursor<CR>

nnoremap j gj
nnoremap k gk

map <leader>tt :TagbarToggle<CR>
map <leader>td <Plug>TaskList

map <leader>cc :cs find c <C-R><C-W><CR>
map <leader>cd :cs find d <C-R><C-W><CR>
map <leader>cg :cs find g <C-R><C-W><CR>

map <leader>w :colorscheme mydefault<CR>

set tags=tags;

if !empty($SRCROOT)
    cscope add $SRCROOT $SRCROOT
endif

call pathogen#infect()

syn match Braces display '[{}()\[\]]'

if has("gui_running")
    "Common settings
    "---------------
    set spell spelllang=en_us
    set columns=80
    set lines=40
    set go=aip
    imap <C-C> "+y
    set mousemodel=popup_setpos
    set fillchars+=vert:\ 
    set nomousehide

    "Light background
    "----------------
    set background=light
    colorscheme vylight
    set guifont=Droid\ Sans\ Mono\ 10

    "Dark background
    "---------------
    "set background=dark
    "colorscheme moria
    "set guifont=Fixed\ 11
else
    if &term == "screen"
        set nospell
        set t_Co=16
        colorscheme pablo
    elseif &term == "xterm-color" || &term == "xterm-256color"
        set spell spelllang=en_us
        set nospell
        set t_Co=256
        set background=dark
        colorscheme 256_vilight
        "let g:solarized_termcolors=256
        "colorscheme solarized
    elseif &term == "xterm"
        set spell spelllang=en_us
        set nospell
        set t_Co=256
        set background=dark
        colorscheme 256_vilight
        "let g:solarized_termcolors=256
        "colorscheme solarized
    endif    
endif

let g:ctrp_cmd = 'CtrlPMixed'

