set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mcfiredrill/vim-liquidsoap'
Plugin 'jceb/vim-orgmode'
Plugin 'kchmck/vim-coffee-script'
Plugin 'posva/vim-vue'
Plugin 'dense-analysis/ale'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'

call vundle#end()

let g:gruvbox_italic=1
colorscheme gruvbox

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

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl
autocmd FileType * set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
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
let g:ale_c_build_dir_names = ['build', 'release']

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:rustfmt_autosave = 1
let g:maplocalleader = ","
autocmd filetype rust set colorcolumn=100
let g:ale_linters = {'rust': ['rls']}
let g:airline_powerline_fonts = 1
