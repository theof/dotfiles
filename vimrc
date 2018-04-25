set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mcfiredrill/vim-liquidsoap'

call vundle#end()

filetype plugin indent on

syntax on

"More useful backspace behavior
set backspace=indent,eol,start

"Better search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

""Use statusbar on all windows
set laststatus=2

au BufRead,BufNewFile *.liq set filetype=liquidsoap
set background=dark
set nu
set foldmethod=syntax
set colorcolumn=80
colorscheme solarized
imap ˙ <Esc>
setl tabstop=2
setl noexpandtab

set autochdir

""netrw
let g:netrw_banner=0
let g:netrw_liststyle = 3

"" Split settings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
