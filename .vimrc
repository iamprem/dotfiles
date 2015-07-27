if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set nu              	" line numbering on
set noerrorbells        " bye bye bells :)
set nowrap          	" no wrapping!
set ignorecase          " search without regards to case
"set colorcolumn=80	" Draws a red line at 80 character limit
set nohlsearch          " meh
set laststatus=2	" Always have statusbar showing
set nohlsearch		" no highlight on search
set tabstop=4		" set tab spacing
"set rnu			" set the relative numbering
set novisualbell		" to disable bell sound
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" rhbz 1159920
if $COLORTERM=="gnome-terminal"
     set background=light
else
     set background=dark
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
let g:airline_powerline_fonts = 1


"Pathogen
"call pathogen#runtime_append_all_bundles()
execute pathogen#infect()

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup


"============== Custom scripts ===============
"source ~/.vim/after/syntaxcheck.vim


"============== Filetype stuff ===============
filetype plugin on
filetype indent on

"============== Script configs ===============
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" Load custom settings
" source ~/.vim/startup/color.vim
" source ~/.vim/startup/commands.vim
" source ~/.vim/startup/functions.vim
"source ~/.vim/startup/mappings.vim
"source ~/.vim/startup/settings.vim

" Syntax-specific settings
"source ~/.vim/startup/js.vim
"source ~/.vim/startup/php.vim
"source ~/.vim/startup/vim.vim
"source ~/.vim/startup/yaml.vim
"source ~/.vim/startup/html.vim
