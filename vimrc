set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mcfiredrill/vim-liquidsoap'
Plugin 'jceb/vim-orgmode'

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


" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

au BufRead,BufNewFile *.liq set filetype=liquidsoap
set nu
set foldmethod=syntax
set colorcolumn=80

"" base-16 shell stuff
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
"" do not use the theme background
hi Normal guibg=NONE ctermbg=NONE

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
autocmd FileType * set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set noexpandtab

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
