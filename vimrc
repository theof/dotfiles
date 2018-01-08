set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

filetype plugin indent on

syntax on

set laststatus=2
set background=dark
set nu
set foldmethod=syntax
set ts=4
set colorcolumn=80
colorscheme solarized
imap ˙ <Esc>
