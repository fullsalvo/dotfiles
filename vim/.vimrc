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
