#!/bin/bash

mkdir -p ~/.vim
cat <<EOF > ~/.vim/vimrc
"  TODO
"  Plug 'HerringtonDarkholme/yats.vim'
"  Plug 'pangloss/vim-javascript'
"  Plug 'MaxMEllon/vim-jsx-pretty'
"  Plug 'styled-components/vim-styled-components'
"  Plug 'elzr/vim-json'
"  Plug 'jparise/vim-graphql'

set nocompatible

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source \$MYVIMRC
endif

call plug#begin()
Plug 'zhou13/vim-easyescape'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-python/python-syntax'
Plug 'patstockwell/vim-monokai-tasty'
"  Plug 'sjbach/lusty'
call plug#end()

set title
set number
set ruler
set wrap
set hidden

set scrolloff=3

set ignorecase
set smartcase
set incsearch
set hlsearch

set visualbell
set noerrorbells

set backspace=indent,eol,start

set termguicolors

set mouse=a

if !exists('g:syntax_on')
    syntax enable
endif

"  zhou13/vim-easyescape

let g:easyescape_chars = { 'j': 1, 'k': 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>

"  preservim/nerdtree

let g:NERDTreeHijackNetrw = 1
au VimEnter NERD_tree_1 enew | execute 'NERDTree '.argv()[0]

"  ctrlpvim/ctrlp.vim

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"  vim-python/python-syntax

let g:python_highlight_all = 1

"  patstockwell/vim-monokai-tasty

set background=dark
let g:vim_monokai_tasty_italic = 1
silent! colorscheme vim-monokai-tasty
EOF