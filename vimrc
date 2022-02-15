set nocompatible
filetype off

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-metals'
\ ]

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin("~/.vim/plugged")

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'Damond5/vim-scl-1'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:airline_powerline_fonts = 1

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-@> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

" =============================================================================

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
let g:clang_format_fallback_style="LLVM"
let clang_format=expand("~/.vim/clang-format.py")
if filereadable(g:clang_format)
    "execute "map <C-K> :pyf ".g:clang_format."<cr>"
    "execute "imap <C-K> <c-o>:pyf ".g:clang_format."<cr>"

    function! Formatonsave()
        let l:formatdiff = 1
        execute "pyf ".g:clang_format
    endfunction
    autocmd BufWritePre *.c,*.h,*.cc,*.cpp call Formatonsave()
endif

let g:rustfmt_autosave = 1
autocmd filetype rust set colorcolumn=100

map <f8> :w<CR>:silent !black %<CR>:e<CR>
imap <f8> <ESC>:w<CR>:silent !black %<CR>:e<CR>
