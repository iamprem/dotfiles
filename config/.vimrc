set bs=indent,eol,start		" allow backspacing over everything in insert mode
set ai						" always set autoindenting on
set history=50				" keep 50 lines of command line history
set ruler					" show the cursor position all the time
set nu              		" line numbering on
set noerrorbells        	" bye bye bells :)
set ignorecase          	" search without regards to case
set laststatus=2			" Always have statusbar showing
set tabstop=4				" set tab spacing
set novisualbell			" to disable bell sound
set softtabstop=0 noexpandtab
set shiftwidth=4
set encoding=utf-8

set nocompatible            " be iMproved, required
filetype off               	" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

	"core plugins
	Plugin 'gmarik/Vundle.vim'

	 "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

	"-------------------=== Other ===-------------------------------
    Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
    Plugin 'flazz/vim-colorschemes'             " Colorschemes
	Plugin 'tpope/vim-fugitive'
	
	"-------------------=== Code Completion and Syntax ===----------
	Plugin 'davidhalter/jedi-vim'
	Plugin 'vim-syntastic/syntastic'
	Plugin 'mboughaba/i3config.vim'


call vundle#end()			" required

filetype plugin indent on   " required
syntax on


"split direction
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Auto indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Only needed for Ubuntu terminal
" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif


