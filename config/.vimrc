set bs=indent,eol,start     " allow backspacing over everything in insert mode
set ai                      " always set autoindenting on
set history=50              " keep 50 lines of command line history
set ruler                   " show the cursor position all the time
set nu                      " line numbering on
set noerrorbells            " bye bye bells :)
set ignorecase              " search without regards to case
set laststatus=2            " Always have statusbar showing
set tabstop=4               " set tab spacing
set softtabstop=4 expandtab " insert spaces when tab key pressed
set shiftwidth=4            " number of space characters inserted for indentation
set novisualbell            " to disable bell sound
set encoding=utf-8
set clipboard=unnamed       " Share system's clipboard instead of using vim specific one (*)
set hidden confirm          " Allow keep changes to unwritten buffer and confirm before deleting the buffer
let mapleader=" "           " Set space as the leader key
set lcs=tab:▶\              " Set trianlge as the list character for tab to show on list command
set invlist                 " Toggle list option to show invisible characters (particularly tabs as defined above)

set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

    "core plugins
    Plugin 'gmarik/Vundle.vim'

    "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'ryanoasis/vim-devicons'             " Icons for files
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'ctrlpvim/ctrlp.vim'                 " Fast transitions on project files
    Plugin 'christoomey/vim-tmux-navigator'     " Seamless navigation between tmux and vim panes

    "-------------------=== Other ===-------------------------------
    Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
    Plugin 'morhetz/gruvbox'
    Plugin 'flazz/vim-colorschemes'             " Colorschemes
    Plugin 'vim-airline/vim-airline-themes'     " Airline themes
    Plugin 'tpope/vim-fugitive'                 " Git

    "-------------------=== Code Completion and Syntax ===----------
    Plugin 'tpope/vim-surround'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}
    Plugin 'Chiel92/vim-autoformat'
    Plugin 'mboughaba/i3config.vim'

call vundle#end()           " required

filetype plugin indent on   " required
syntax on

" Colorschemes config
colorscheme gruvbox

"split direction
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>   " TODO: Fix console clear issue with zsh and bash
nnoremap <C-H> <C-W><C-H>

" Buffer navigation shortcuts
nnoremap <silent><Leader>bn :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent><Leader>bp :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nnoremap <Leader>b          :ls<CR>:b<Space>
nnoremap <C-c>              :bp\|bd #<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Auto delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Auto indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Only needed for Ubuntu terminal
" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif


" airline status bar customization
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#enabled = 1

" ctrlp customization
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" NerdTree customization
nmap <leader>ne :NERDTreeToggle<cr>

" Start NerdTree on start up
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if last window open is nerd tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Hide files in nerd tree
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store
let NERDTreeRespectWildIgnore=1

" coc.nvim configurations
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
