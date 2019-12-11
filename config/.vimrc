set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set nu              	" line numbering on
set noerrorbells        " bye bye bells :)
set nowrap          	" no wrapping!
set ignorecase          " search without regards to case
set laststatus=2	" Always have statusbar showing
set nohlsearch		" no highlight on search
set tabstop=4		" set tab spacing
set novisualbell	" to disable bell sound
"
filetype plugin on
filetype indent on
syntax on

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif
