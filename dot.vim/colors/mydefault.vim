" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mydefault"

" vim: sw=2

" Started with the defaults, time to customize
hi Normal       ctermfg=black ctermbg=none
hi StatusLineNC ctermfg=white ctermbg=gray  guifg=white guibg=gray  
hi StatusLine   ctermfg=darkgray ctermbg=white guifg=white guibg=black 
hi VertSplit    ctermfg=white ctermbg=gray guifg=white guibg=black 
hi LineNr       ctermfg=gray  ctermbg=none guifg=gray guibg=white 
hi Visual       cterm=reverse
