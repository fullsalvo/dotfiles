" {{{ Setup
set nocompatible
set number
set cursorline
set showcmd
set laststatus=2
set statusline=%t\ %m%=Line:\ %l,\ Column:\ %c
set backspace=indent,eol,start
" }}}
" {{{ Folding
set foldenable
set foldnestmax=10
set foldmethod=marker
nnoremap <space> za
" }}}
" {{{ Colors
colorscheme fs
syntax on
" }}}
" {{{ Plugins
call plug#begin('~/.vim/plugged')
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
call plug#end()
" }}}
" {{{ Startify
let g:startify_custom_header =
\[ '     u            @88>                      '
\ ,'    88Nu.   u.    %8P      ..    .     :    '
\ ,'    `88888.o888c    .     .888: x888  x888.  '
\ ,'    ^8888  8888  .@88u  ~`8888~`888X`?888f` '
\ ,'     8888  8888 ``888E`   X888  888X `888>  '
\ ,'     8888  8888   888E    X888  888X `888>  '
\ ,'     8888  8888   888E    X888  888X `888>  '
\ ,'    .8888b.888P   888E    X888  888X `888>  '
\ ,'     ^Y8888*""    888&   "*88%""*88" `888!` '
\ ,'       `Y"        R888"    `~    "    `"`   '
\ ,'                  ""               ',
\ ]
" }}}
" {{{ Custom Mapping
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
" {{{ Goyo Functions
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  set number
  set statusline=%t\ %m%=Line:\ %l,\ Column:\ %c
  hi StatusLineNC ctermfg=8 cterm=None
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
" }}}
" {{{ autocmd
autocmd VimEnter * Goyo
" }}}
