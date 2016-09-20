"-------------------
" Basic settings
"-------------------
" The indentation of the new line, the same as the current line.
set autoindent

" To specify a directory of backup files.
set backupdir=$HOME/vimbackup

" To work the clipboard and Windows
set clipboard=unnamed

" To turn off the vi-compatible
set nocompatible

" To specify a directory of swap file
set directory=$HOME/vimbackup

" To specify a blank character instead of the tab
set expandtab

" In the file being changed, to display the order files without saving.
set hidden

" Perform an incremental search
set incsearch

" To display the line number
set number

" When entering the closing parenthesis, emphasize the corresponding parenthesis
set showmatch

" When create a new line, perform automatic indentation
set smarttab

" Don't take over the comments to the next line
autocmd FileType * setlocal formatoptions-=ro

" Setting a grep search
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" To clear the search results of the highlights in the ESC key
nnoremap <ESC><ESC> :nohlsearch<CR>

"----------------------------------------------------
" Emacs key bind(Only input mode)
"----------------------------------------------------
" Command input interruption
imap <silent> <C-g> <ESC><ESC><ESC><CR>i

" Screen split
imap <silent> <C-x>1 <ESC>:only<CR>i
imap <silent> <C-x>2 <ESC>:sp<CR>i
imap <silent> <C-x>3 <ESC>:vsp<CR>i
imap <silent> <C-x>o <ESC><C-w>w<CR>i
imap <silent> <C-x>p <ESC><C-w>p<CR>i

" Delete, Edit
imap <C-k> <ESC>d$i
imap <C-y> <ESC>pi
imap <C-d> <ESC>xi

" Move
imap <C-a>  <Home>
imap <C-e>  <End>
imap <C-b>  <Left>
imap <C-f>  <Right>
imap <C-n>  <Down>
imap <C-p>  <UP>
"imap <ESC>< <ESC>ggi
"imap <ESC>> <ESC>Gi

" File
imap <C-c><C-c>  <ESC>:qa<CR>
imap <C-x><C-c>  <ESC>:qa!<CR>
imap <C-w><C-w>  <ESC>:w<CR>
imap <C-x><C-w>  <ESC>:w!<CR>
imap <C-x><C-f>  <ESC>:e

" Error recovery
" imap <C-/> <ESC>ui

" Other
imap  <C-x><C-e>  :Explore<CR>

"----------------
" NeoBundle settings
"----------------

set nocompatible               " be iMproved
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'


" NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on

"----------------
" changelog setting
"----------------
let g:changelog_dateformat='%Y-%m-%d'
let g:changelog_username='name <example@mail.com>'
nnoremap <Leader>o :new ~/changelog/changelog<CR>

"----------------
" Markdown setting
"----------------
NeoBundle 'plasticboy/vim-markdown'
au BufRead,BufNewFile *.md set filetype=markdown

"----------------
" scala's syntax highlight
"----------------
NeoBundle 'derekwyatt/vim-scala'

" https://github.com/Shougo/neocomplete.vim
NeoBundle 'Shougo/neocomplete.vim'

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Use underbar completion.
let g:neocomplete#enable_underbar_completion = 1

" Dict setting
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
  \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
" Comment out, so conflict to Emacs keybind.
" inoremap <expr><C-e>  neocomplete#cancel_popup()

" lightline
NeoBundle 'itchyny/lightline.vim'

" vim-haskell-indent
NeoBundle 'vim-haskell-indent'

" calendar
NeoBundle 'itchyny/calendar.vim'

" vim-highlighturl
NeoBundle 'vim-highlighturl'

" To convenient file open
NeoBundle 'Shougo/unite.vim'
" In Unite.vim, to display the recent documents
NeoBundle 'Shougo/neomru.vim'
" Tree display the file
NeoBundle 'scrooloose/nerdtree'
" Comments of the ON/OFF
NeoBundle 'tomtom/tcomment_vim'
" Add color to the indentation
NeoBundle 'nathanaelkane/vim-indent-guides'

" When launched the Vim, automatically turn on the vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

" Add color the log file
NeoBundle 'vim-scripts/AnsiEsc.vim'

" Visualize the end-of-line half-width space
NeoBundle 'bronson/vim-trailing-whitespace'

" If the file type is Ruby and CoffeeScript, execute to "~/.vim/ftplugin/ruby"
autocmd BufRead,BufNewFile *.rb setfiletype ruby
autocmd BufRead,BufNewFile *.scss setfiletype ruby
autocmd BufRead,BufNewFile *.coffee setfiletype ruby

" If the file type is Javascript, execute to "~/.vim/ftplugin/javascript"
autocmd BufRead,BufNewFile *.js setfiletype javascript

" If the file type is yml, execute to "~/.vim/ftplugin/yml"
autocmd BufRead,BufNewFile *.yml setfiletype yml

" Error handing to "neosnippet"
NeoBundle 'Shougo/neosnippet-snippets'




