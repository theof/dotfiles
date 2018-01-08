filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

filetype plugin indent on

syntax on
set nu
set foldmethod=syntax
set ts=4
set nocompatible
set colorcolumn=80
colorscheme solarized
imap ˙ <Esc>
