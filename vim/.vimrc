set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set laststatus=2
set tabstop=4

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Liberation_Mono:h11
set renderoptions=type:directx,gamma:1.0,contrast:0.2,level:1.0,geom:1,renmode:5,taamode:1

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'notpratheek/vim-luna'
Plug 'PProvost/vim-ps1'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme luna
