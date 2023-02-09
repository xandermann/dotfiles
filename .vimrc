" Me
set hidden
set encoding=utf-8
:imap jk <Esc>
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
set updatetime=300

" Ref: https://github.com/Chewie/dotfiles/blob/master/vim/.vimrc

" 88
set autoread

" 91
set autowrite

" 94
set nobackup

" 98
set encoding=utf-8

" 101
set noswapfile

" 112
set term=xterm-256color

" 123
set scrolloff=5

" 132
set number
set relativenumber
set numberwidth=2
set cmdheight=2

" 163
syntax on

" 169
" set mouse=a

" 184
set cursorline

" 191
set ignorecase

" 194
set smartcase

" 197
set incsearch

" 200
set nohlsearch

" 236
let mapleader = ","

" 246 Yank from cursor to end of line, to be consistent with C and D
nnoremap Y y$

" 252
noremap ; :

" 288
" colorscheme jellybeans
