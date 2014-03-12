" Author: Chris Linstid <chris@linstid.com
" Last Change: 24 Jan 2013

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="256_vilight"

hi Normal         ctermfg=NONE   ctermbg=NONE
hi Cursor         ctermfg=233  ctermbg=15
hi CursorLine     ctermfg=NONE  ctermbg=238
hi Directory      ctermfg=107  ctermbg=233
hi VertSplit      ctermfg=0  ctermbg=0
hi Folded         ctermfg=102  ctermbg=235
hi FoldColumn     ctermfg=167  ctermbg=233
hi vimFold        ctermfg=15   ctermbg=235
hi IncSearch      ctermfg=68   ctermbg=15
hi LineNr         ctermfg=238  ctermbg=NONE
hi ModeMsg        ctermfg=228  ctermbg=233
hi MoreMsg        ctermfg=228  ctermbg=233
hi NonText        ctermfg=59   ctermbg=NONE
hi Search         ctermfg=15 ctermbg=32
hi StatusLine     ctermfg=16   ctermbg=111
hi StatusLineNC   ctermfg=16   ctermbg=255
hi ColorColumn    ctermfg=NONE ctermbg=234

hi Visual         ctermfg=NONE ctermbg=237
hi WildMenu       ctermfg=99   ctermbg=234
hi MatchParen     ctermfg=15   ctermbg=68
hi ErrorMsg       ctermfg=167  ctermbg=NONE
hi WarningMsg     ctermfg=167  ctermbg=NONE
hi Title          ctermfg=167  ctermbg=233

"Syntax hilight groups

hi Comment        ctermfg=244
hi Constant       ctermfg=103
hi String         ctermfg=107
hi Variable       ctermfg=103
hi Number         ctermfg=167
hi Boolean        ctermfg=167
hi Float          ctermfg=167
hi Identifier     ctermfg=103
hi Statement      ctermfg=179
hi Keyword        ctermfg=179
hi PreProc        ctermfg=103
hi Type           ctermfg=246
hi Typedef        ctermfg=179
hi Special        ctermfg=179
hi SpecialChar    ctermfg=103
hi SpecialComment ctermfg=68
hi SpecialKey     ctermfg=233
hi Ignore         ctermfg=102
hi Error          ctermfg=167              ctermbg=NONE
hi Todo           ctermfg=233                 ctermbg=228
hi Pmenu          ctermfg=103              ctermbg=234
hi PmenuSel       ctermfg=179              ctermbg=234
hi PmenuSbar      ctermbg=59
hi PmenuThumb     ctermfg=248

hi SpellBad       ctermfg=NONE            ctermbg=237

"diff

hi DiffAdd        ctermfg=107              ctermbg=235
hi DiffChange     ctermfg=179              ctermbg=235
hi DiffText       ctermfg=15              ctermbg=235
hi DiffDelete     ctermfg=167              ctermbg=235
