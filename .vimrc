set encoding=utf-8
set hidden
set cmdheight=2

set updatetime=300





set number
set relativenumber
set numberwidth=2

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

inoremap jk <esc>



call plug#begin('~/.vim/plugged')

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

call plug#end()

