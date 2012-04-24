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
" set smartindent
set laststatus=2
set incsearch
set showcmd
set showmatch
set nostartofline
set hidden
syntax on
syntax enable
set wildmenu
set wildmode=list:longest,full
set tags=/buildarea/chris_linstid/tagfiles/$CURR_VIEW
cscope add /buildarea/chris_linstid/cscope/$CURR_VIEW
set mouse=a
set ignorecase
set smartcase
set number
set wrap
set linebreak
set history=1000
" set backup
"set hlsearch

filetype plugin on
set ofu=syntaxcomplete#Complete

set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'



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
  autocmd FileType text set shiftwidth=2

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


if has("gui_running")
    set background=dark
    set background=light
    " set guifont=Fixed\ 10
    " set guifont=Fixed\ 13
    set guifont=Droid\ Sans\ Mono\ 9
    set columns=80
    set lines=40
    colorscheme vylight
    set go=aip
    imap <C-C> "+y
else
    if &term == "screen"
        set t_Co=16
        colorscheme pablo
        set background=dark
        set nospell
    elseif &term == "xterm-color"
        set t_Co=256
        set background=dark
        colorscheme 256_vilight
    elseif &term == "xterm"
        set t_Co=256
        set background=dark
        colorscheme 256_vilight
        " set background=light
        " colorscheme mydefault
    endif    
endif

set formatoptions=tcqorn
set spell spelllang=en_us

nnoremap <silent> \g :!glimpse <cword> \| less <CR>
" let g:glimpseFlags = "-in -H /buildarea/chris_linstid/glimpse/$CURR_VIEW"
" let g:glimpseKey = "<Leader>g"

nnoremap <silent> \d :VCSDiff<CR>

" Most Recently Used
nnoremap <silent> \mr :MRU<CR>
let MRU_Max_Entries = 1000


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
