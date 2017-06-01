"   __
"  / _|___
" | |_/ __|
" |  _\__ \
" |_| |___/
"
" Vim Color File
" Author: fullsalvo

hi clear
set background=dark

if exists("syntax_on")
	syntax reset
endif

set t_co=256
let colors_name = "fs"

" colors {{{
" UI Colors {{{
hi Folded ctermfg=0 ctermbg=7
hi Error ctermbg=1
hi Todo ctermfg=None ctermbg=None
hi ErrorMsg ctermbg=1
hi CursorLine cterm=NONE ctermbg=black guibg=black
hi LineNr ctermfg=0
hi CursorLineNr ctermfg=8
hi Search ctermfg=1
hi IncSearch ctermfg=1
hi MatchParen ctermbg=6
hi VertSplit cterm=None ctermfg=0
hi StatusLine ctermfg=256 cterm=None
hi StatusLineNC ctermfg=8 cterm=None
hi Underlined term=underline cterm=underline ctermfg=None ctermbg=None
" }}}
" Syntax Highlighting {{{
hi Comment ctermfg=8
hi Identifier ctermfg=4
hi Title ctermfg=11
hi Constant ctermfg=2
hi Identifier ctermfg=4
hi String ctermfg=2
hi Function ctermfg=5
" Language Highlights {{{
" Python {{{
hi pythonFunction ctermfg=4
hi pythonStatement ctermfg=1
hi pythonException ctermfg=1
hi pythonExceptions ctermfg=3
hi pythonOperator ctermfg=1
hi pythonConditional ctermfg=1
hi pythonExtraOperator ctermfg=4
hi pythonBuiltin ctermfg=5
hi pythonInclude ctermfg=1
hi pythonConstant ctermfg=1
" }}}
" }}}
" }}}
" }}}
