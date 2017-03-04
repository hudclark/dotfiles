function! DoRemote(arg)
	UpdateRemotePlugins
endfunction
call plug#begin('~/.config/nvim/plugged')
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/kchmck/vim-coffee-script.git'
Plug 'https://github.com/benekastah/neomake.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/heartsentwined/vim-ember-script.git'
Plug 'https://github.com/mustache/vim-mustache-handlebars.git'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'https://github.com/alvan/vim-closetag.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/AlessandroYorba/Despacio'
Plug 'https://github.com/mbbill/vim-seattle'
Plug 'https://github.com/YorickPeterse/happy_hacking.vim'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material'
Plug 'https://github.com/tyrannicaltoucan/vim-quantum'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive'
"Plug 'https://github.com/flazz/vim-colorschemes'
Plug 'https://github.com/wellle/targets.vim'
Plug 'https://github.com/xuhdev/vim-latex-live-preview'
Plug 'https://github.com/morhetz/gruvbox'
"Plug 'https://github.com/rakr/vim-one'
"Plug 'https://github.com/joshdick/onedark.vim'
call plug#end()

let g:deoplete#enable_at_startup=1

set history=100
set showbreak=↪\ \
set linebreak
set ignorecase
set smartcase

"Disable the mouse
set mouse=""

set ruler

"No backup or swap
set nobackup nowritebackup noswapfile autoread
"Show line numbers
set relativenumber
set number
"Scroll the window so I can see end of file
set scrolloff=10
"Double press j to escape
imap jj <Esc>
"Filetypes
filetype plugin indent on
"Make switching windows more natural
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
nnoremap _ :sp<return>

"Formatting
set ts=2 sw=2
set autoindent
set smartindent

"File type specific formatting
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype php setlocal ts=2 sw=2 expandtab
autocmd Filetype cpp setlocal ts=2 sw=2 cindent expandtab
autocmd FileType python set ts=4 sts=4 sw=4
autocmd FileType json set ts=2 sts=2 sw=2

" Make it pretty
set termguicolors
syntax on
set t_Co=256
"let g:solarized_termcolors=256
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'dark'
let g:enable_bold_font = 1
set background=dark
colorscheme gruvbox

"Change the background for first 80 chars
set colorcolumn=80 "This is only for a single column
"execute set colorcolumn= . join(range(81,335), ',') 

"Set netrw to use tree style browsing
"let g:netrw_liststyle = 3
"Remove the help banner on top of netrw
let g:netrw_banner = 0

" change default mapping for ctrlp
nnoremap <c-p> :Files<return>

" change the size of viewports
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" For coffeescripting
let coffee_cake_options = 'build'

" Swap subsequent words
nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>"

"Check syntax on write
autocmd! BufWritePost * Neomake
let g:neomake_coffeescript_enabled_makers = ['coffeelint']
let g:neomake_sass_enabled_makers = ['sass-lint']

nnoremap \ :noh<return>
nnoremap <Tab> :tabn<return>
nnoremap <Esc> :tabp<return>

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

let g:closetag_filenames = "*.html,*.xhtml,*.hbs"

" For getting out of a term
tnoremap jj <C-\><C-n>
tnoremap <esc><esc> <C-\><C-n>

let g:neomake_cpp_gcc_maker = {
    \ 'args': ['-fsyntax-only', '-Wall', '-Wextra', '-std=c++1y'],
    \ }

" snippets
"let g:UltiSntipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" fzf + ripgrep
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
