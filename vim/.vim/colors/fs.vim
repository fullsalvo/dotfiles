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
hi CursorLine cterm=NONE ctermbg=black guibg=black
hi LineNr ctermfg=0
hi CursorLineNr ctermfg=8
hi Search ctermfg=1
hi IncSearch ctermfg=1
hi MatchParen ctermbg=6
hi VertSplit cterm=None ctermfg=0
hi StatusLine ctermfg=256 cterm=None
hi StatusLineNC ctermfg=8 cterm=None
" }}}
" Syntax Highlighting {{{
hi Comment ctermfg=8
hi Title ctermfg=11
hi Constant ctermfg=2
hi Identifier ctermfg=4
hi String ctermfg=2
hi Function ctermfg=5
" }}}
" }}}
