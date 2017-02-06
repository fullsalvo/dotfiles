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
