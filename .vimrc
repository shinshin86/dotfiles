""""""""""""""""""""""""""""""
" vimrc
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Japanese Help
Plug 'vim-jp/vimdoc-ja'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim lsp setting
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" code completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" color scheme
Plug 'chriskempson/base16-vim'

" Customize status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" file explorer
Plug 'mattn/vim-molder'

" toml
Plug 'cespare/vim-toml'

" vim-sonictemplate
Plug 'mattn/vim-sonictemplate'

" twc
Plug 'shinshin86/twc.vim'
let g:twc_colors = ["base16-default-dark", "desert", "evening", "slate", "shine", "blue", "darkblue", "default"]

" zig
Plug 'ziglang/zig.vim'

call plug#end()
""""""""""""""""""""""""""""""
set nocompatible
set backspace=indent,eol,start
set encoding=utf-8
set helplang=ja,en
set number
set expandtab
set hlsearch
set ignorecase
set incsearch
set smartcase
set laststatus=2
syntax on
set autoindent
filetype plugin indent on
set showcmd
set background=dark
set wildmenu
set ruler
set showmatch
set clipboard+=unnamed
set tabstop=2
set shiftwidth=2
autocmd FileType * setlocal formatoptions-=ro

" line number color
highlight lineNr term=underline ctermfg=11 guifg=Grey

" setting color scheme
let base16colorspace=256  " Access colors present in 256 colorspace
set termguicolors
colorscheme base16-default-dark

" setting status bar
let g:airline_theme='luna'

" Emacs Move
imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>
imap <C-n>  <Down>
imap <C-p>  <UP>

" tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" bprev/bnext
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" vimgrep
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

" lsp
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
