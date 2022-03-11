set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
call plug#end()

set path+=**
filetype on
filetype plugin on
filetype indent on
let mapleader = " "
set lazyredraw
set number
set relativenumber
set formatoptions-=cro
set nowrap
set formatoptions-=cro
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
colorscheme gruvbox
set bg=dark 

" indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>se :e $MYVIMRC<cr>

"nnoremap <Leader>b :Buffers
"nnoremap <silent> [b :bprev<CR>
"nnoremap <silent> ]b :bnext<CR>
"nnoremap <silent> [B :bfirst<CR>
"nnoremap <silent> ]B :blast<CR>

nnoremap <leader>ff :FZF<CR>

" netrw
let g:netrw_keepdir = 0
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
hi! link netrwMarkFile Search
nnoremap <Leader>fe :Lexplore<CR>
nnoremap <leader>fc :Lexplore %:p:h<CR>

function! NetrwMapping()
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>
  nmap <buffer> P <C-w>z
  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>fc :Lexplore<CR>
endfunction

augroup filetype_vim
		autocmd!
		autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
autocmd BufWritePost *redshift.conf !pkill -USR1 redshift
autocmd BufWritePost *config.h !sudo make clean install
autocmd BufWritePost ~/.Xresources !xrdb ~/.Xresources

" autocmds
augroup general
    autocmd!
    autocmd VimResized * wincmd =
augroup END
