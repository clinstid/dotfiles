"
" gvim colorscheme file
"
" Author: vyshane <shane@node.mu>
" Maintainer:  Chris Linstid <chris@linstid.com> 
" Last Change: Jan 23, 2013
" Version:     1.0
"
" This colorscheme file is meant only for use with gvim, it won't work
" properly with terminal vim.
"

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="vylight"


hi Normal        guifg=#1a1a1a  guibg=gray98
hi Title         guifg=black    guibg=gray98
hi Cursor        guifg=white    guibg=SteelBlue3
hi LineNr        guifg=gray81  guibg=gray98
hi Visual        guibg=#bbddff
hi NonText       guifg=#cccccc  guibg=#fafafa
hi StatusLine    guifg=gray30  guibg=gray92  gui=none
hi StatusLineNC  guifg=gray50  guibg=gray94  gui=none
hi VertSplit     guifg=gray97  guibg=gray97  gui=none
hi ModeMsg       guifg=#007050  guibg=#eeeeee  gui=none
hi ErrorMsg      guifg=#f03050  guibg=#eeeeee  gui=none
hi Error         guifg=#bb3355  guibg=gray98    gui=none
hi Folded        guifg=#999999  guibg=#fafafa
hi ColorColumn   guibg=gray97


" Vim 7.x specific
if version >= 700
  hi CursorLine  guibg=#eeeeee  gui=none
  hi MatchParen  guibg=#ccffdd  gui=none
  hi Pmenu       guifg=#60656f  guibg=#f0f5ff  gui=none
  hi PmenuSel    guifg=white    guibg=#3585ef  gui=bold
  hi PmenuSbar   guifg=#d0d5dd  guibg=#e0e5ee  gui=bold
  hi PmenuThumb  guifg=#e0e5ee  guibg=#c0c5dd  gui=bold
  hi Search      guibg=gray90   gui=none
  hi IncSearch   guibg=gray91   gui=bold
endif


" Syntax highlighting 
hi Comment       guifg=#668866  gui=italic
hi Todo          guifg=#446644  guibg=#ddeecc  gui=none
hi Operator      guifg=SteelBlue1  gui=none
hi Identifier    guifg=SteelBlue3  gui=none
hi Statement     guifg=#0050b0  gui=none
hi Type          guifg=#0050b0  gui=none
hi Constant      guifg=#204070  gui=none
hi Conditional   guifg=#006040  gui=none
hi Delimiter     guifg=SteelBlue2  gui=none
hi PreProc       guifg=#007050  gui=none
hi Special       guifg=#a05050  gui=none
hi SpecialKey    guifg=lightgray gui=none
hi Keyword       guifg=#007050  gui=none
hi Braces        guifg=SteelBlue1 gui=none

hi link Function        Normal
hi link Character       Constant
hi link String          Constant
hi link Boolean         Constant
hi link Number          Constant
hi link Float           Number
hi link Repeat          Conditional
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

