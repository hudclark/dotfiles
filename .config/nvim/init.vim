" === PLUGINS ===
call plug#begin('~/.local/share/nvim/plugged')
Plug 'derekwyatt/vim-scala'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug '~/.fzf'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

" === AIR LINE CONFIG ===
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" === SCALA CONFIG ===
au BufRead,BufNewFile *.sbt set filetype=scala

autocmd FileType scala let b:coc_root_patterns = ['build.sbt']

" === coc.nvim CONFIG ===

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Expand on the diagnostic under the cursor
nmap <leader>i <Plug>(coc-diagnostic-info)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" === NERDTREE CONFIG ===
"
" Open nerdtree if opening vim to a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd l | endif

" Slightly wider than default
:let g:NERDTreeWinSize=50

" === FZF CONFIG ===

" fuzzy finder with ctrl-p
nnoremap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" === NAVIGATION CONFIG ===

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
nnoremap _ :sp<return>

" === GENEREAL CONFIG ===

set history=100
set showbreak=↪\ \
set linebreak
set ignorecase
set smartcase
set incsearch
set hlsearch
set cursorline
set showmatch

set backspace=indent,eol,start

set clipboard+=unnamedplus

" Disable the mouse
set mouse=""
set ruler

"No backup or swap
set nobackup nowritebackup noswapfile autoread

"Show line numbers
set number

"Scroll the window so I can see end of file
set scrolloff=10

"Double press j to escape
imap jj <Esc>

nnoremap j gj
nnoremap k gk

" === THEME CONFIG ===

syntax on

colorscheme gruvbox
let g:gruvbox_contrast_dark='soft'
set background=dark

"set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" === FILE CONFIG ===

autocmd BufNewFile,BufRead *.json setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.conf setf dosini

"File type specific formatting
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype php setlocal ts=2 sw=2 expandtab
autocmd Filetype cpp setlocal ts=2 sw=2 cindent expandtab
autocmd FileType python set ts=4 sts=4 sw=4
autocmd FileType json set ts=2 sts=2 sw=2
autocmd FileType java set ts=2 sts=2 sw=2

filetype plugin indent on
