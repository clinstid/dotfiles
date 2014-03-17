call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

set nocompatible
set ruler
set backspace=2
set showmode
set noerrorbells
set expandtab
set tabstop=4
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
set hlsearch
set spellcapcheck=""
set modelines=0
"set undofile
filetype plugin on
filetype indent on

set list listchars=tab:»-,trail:·,extends:»,precedes:«

set cino=(0
"set ofu=syntaxcomplete#Complete

set autochdir
"set completeopt=longest,menuone,preview
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
au BufNewFile,BufRead *.py set ft=python
au BufNewFile,BufRead *.mc set ft=mason


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

nnoremap <silent> <leader>vd :VCSDiff<CR>
nnoremap <silent> <leader>va :VCSAnnotate<CR>

map <leader>cc :cs find c <C-R><C-W><CR>
map <leader>cd :cs find d <C-R><C-W><CR>
map <leader>cg :cs find g <C-R><C-W><CR>

map <leader>w :colorscheme mydefault<CR>

set tags=tags;

if !empty($CSCOPE_DIR)
    cscope add $CSCOPE_DIR
elseif !empty($SRCROOT)
    cscope add $SRCROOT
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

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
    if has("gui_macvim")
        set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16
        set vb
    else
        set guifont=Ubuntu\ Mono\ 12
    endif

    "Light background
    "----------------
    set background=light
    colorscheme vylight
    let g:airline_theme = 'wombat'

    "Dark background
    "---------------
    "set background=dark
    "colorscheme molokai
    "set guifont=Fixed\ 11
else
    let g:airline_theme = 'wombat'
    if &term == "screen"
        set t_Co=16
        colorscheme default
    elseif &term == "linux"
        set t_Co=16
        colorscheme default
    else
        set spell spelllang=en_us
        set t_Co=256
        colorscheme 256_vilight
    endif
endif

let g:session_autoload = 'no'
let g:session_autosave = 'no'

" Syntastic
nmap <leader>s :SyntasticCheck<cr>
nmap <leader>t :SyntasticTooggleMode<cr>
nmap <leader>r :Errors<cr>

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

let g:html_indent_inctags = "html,head,body,tbody,ul,li,p"

map <leader>e :NERDTreeToggle<CR>
map <leader>v :NERDTreeFocus<CR>
map <leader>f :call JsBeautify()<cr>

let g:jedi#use_tabs_not_buffers = 0
