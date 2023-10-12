map <Space> <Leader>

" Me
set hidden
set encoding=utf-8
:imap jk <Esc>
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
set updatetime=300

" https://github.com/junegunn/vim-plug
" call plug#begin()
" Plug 'preservim/nerdtree'
" Plug 'easymotion/vim-easymotion'
" Plug 'vim-airline/vim-airline'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'mattn/emmet-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" call plug#end()

" Ref: https://github.com/Chewie/dotfiles/blob/master/vim/.vimrc

set autoread
set autowrite
set nobackup
set encoding=utf-8
set noswapfile
" set term=xterm-256color
set scrolloff=5

set number
set relativenumber
set numberwidth=2
set cmdheight=2

syntax on

set cursorline
set ignorecase
set smartcase
set incsearch
set nohlsearch
" let mapleader = ","

" 252
" noremap ; :

" 288
" colorscheme jellybeans

" cnoremap sudow w !sudo tee % >/dev/null

" Help
nmap gx <C-]>
autocmd FileType help nnoremap <buffer> <C-]> gx
" nmap gn :NERDTreeToggle<CR>
" nmap gf :Files ./

set autowrite
" set patchmode=.orig

" Remove all trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
command! -nargs=0 W :w !sudo tee %

set foldmethod=syntax

" map n <Plug>(easymotion-next)
" map N <Plug>(easymotion-prev)

" Hard vim :D
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set foldmethod=indent

