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
			\ [ '    m    m mmmmm  m    m'
			\ , '    "m  m"   #    ##  ##'
			\ , '     #  #    #    # ## #'
			\ , '     "mm"    #    # "" #'
			\ , '      ##   mm#mm  #    #'
			\ ]
" }}}
" {{{ Custom Mapping
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
