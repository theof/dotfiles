set nocompatible
filetype off

set rtp+=/usr/lib/python3.8/site-packages/powerline/bindings/vim

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin("~/.vim/plugged")

let g:powerline_loaded = 1
Plug 'VundleVim/Vundle.vim'
Plug 'chriskempson/base16-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mcfiredrill/vim-liquidsoap'
Plug 'jceb/vim-orgmode'
Plug 'kchmck/vim-coffee-script'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

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
  hi SpellBad cterm=bold ctermbg=red ctermfg=white
  hi SpellCap cterm=italic ctermbg=blue ctermfg=white
endif
"" do not use the theme background
hi Normal guibg=NONE ctermbg=NONE

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType go set tabstop=4|set shiftwidth=4
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType javascript.jsx set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab
au BufRead,BufNewFile *.liq set filetype=liquidsoap

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

"" Clang format
let clang_format=expand("~/.vim/clang-format.py")
if filereadable(g:clang_format)
	"execute "map <C-K> :pyf ".g:clang_format."<cr>"
    "execute "imap <C-K> <c-o>:pyf ".g:clang_format."<cr>"

    function! Formatonsave()
        let l:formatdiff = 1
        execute "pyf ".g:clang_format
    endfunction
    autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
endif

let g:rustfmt_autosave = 1
autocmd filetype rust set colorcolumn=100
