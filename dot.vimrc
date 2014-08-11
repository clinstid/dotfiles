"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#auto_vim_configuration = 0
let g:airline_powerline_fonts=1
let g:miniBufExplMapWindowNavVim = 1
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
set ttyscroll=20
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
filetype indent on
filetype plugin on

set list listchars=tab:»-,trail:·,extends:»,precedes:«

set cino=(0
"set ofu=syntaxcomplete#Complete

set autochdir
set completeopt=menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

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
    vmap <C-C> "+y
    imap <C-V> <ESC>"+gpi
    set mousemodel=popup_setpos
    set fillchars+=vert:.
    set nomousehide
    set vb
    if has("gui_macvim")
        set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16
    else
        set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
    endif

    " Light background
    "colorscheme vylight
    "set background=light
    "let g:airline_theme = 'sol'

    " Dark background
    colorscheme vilight
    set background=dark
    let g:airline_theme = 'wombat'
else
    let g:airline_theme = 'wombat'
    if &term == "linux"
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
"nmap <leader>s :SyntasticCheck<cr>
"nmap <leader>t :SyntasticTooggleMode<cr>
"nmap <leader>r :Errors<cr>

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

map <leader>sp :set paste<CR>
map <leader>nsp :set nopaste<CR>

let g:syntastic_python_flake8_args = '--ignore=E501'
let g:syntastic_enable_perl_checker = 1

map <leader>tws :%s/\s+$//<CR>

nmap <C-S> :w<CR>

autocmd BufNewFile,BufRead {Gemfile,Vagrantfile,Berksfile} set filetype=ruby

let pymode_folding = 0
let g:pymode_lint = 0
set colorcolumn=80,100,120

au BufNewFile,BufRead *.yaml,*.yml    setf yaml

