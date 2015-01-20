set nocompatible "Set this first or risk undoing other settings
set number "Line numbers 
set ruler "Position
set showcmd "Incomplete commands

set term=xterm-256color
set mouse=a

filetype plugin indent on
execute pathogen#infect()
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>

set guifont=Menlo\ Regular\ for\ Powerline
let g:Powerline_symbols = 'fancy'

set nosmd
set laststatus=2
set showmode

set autochdir "cd into directory with file

set scrolloff=5 "Lines above/below cursor 
set cmdheight=1 "shortens cmd height

set backspace=eol,start,indent "backspace configuration
set whichwrap+=<,>,[,],h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight searches
set incsearch "more like browser search

set nolazyredraw "Don't redraw during macros

set magic "For regular expressions

set showmatch "Matching braces highlighting
set mat=2 "Blink for above

"No sound on errors
set noerrorbells
set visualbell

"Timeout
set timeoutlen=500

"Color scheme
set t_Co=256
syntax enable "Enable highlighting
set bg=dark
colorscheme solarized

set encoding=utf8
try
  lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"Text tab indent etc.
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

"Leave Makefiles alone
au BufRead,BufNewFile Makefile set ts=4 sw=4 noexpandtab

set lbr "Line break
set tw=500 "Text wrap

set autoindent
set smartindent

"Highlight disabling shortcut
ca nh nohl

"In Normal mode, semicolon brings up colon prompt
cnoremap ; :
nnoremap ; :
nnoremap : ;

":nonum turns off line numbers, :num restores them
ca nonum set nonumber
ca num set number

" Remap jj to escape insert mode 
inoremap jj <Esc>

"Disable 'Entering Ex mode. Type 'visual' to go to Normal mode.'
map Q <Nop>

"Disable K looking things up
map K <Nop>

"Disable F1 help. Better yet, I meant Esc anyway.
imap <F1> <Esc>

"Quick insertion of a newline by pressing enter
nnoremap <silent> <CR> O<Esc>

"Remap space to insert a single character
noremap <Space> i_<Esc>r

"Y yanks to the end of the line, rather than the whole line (use yy)
noremap Y y$

"End of this line more important than end of previous line
noremap - _
noremap _ -

":make runs the Makefile, if present, else ./compile 
"http://stackoverflow.com/questions/729249
set shell=/bin/bash
set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ ./compile
" = saves all and compiles (runs make)
nnoremap = :wa<bar>:make<bar><CR>
"Having overwritten =, assign it to Tab to align text
noremap <Tab> =

filetype on
autocmd BufEnter *.txt setlocal ft=txt
au BufNewFile,BufRead *.imp set filetype=scheme
au BufNewFile,BufRead *.ic set filetype=scheme
au FileType text setl sw=2 sts=2 et
au FileType txt setl sw=2 sts=2 et

"Text autowrap to 80 columns
set textwidth=80
set wrap

" Yank text to the OS X clipboard
vnoremap <leader>y "*y
vnoremap <leader>yy "*Y

vnoremap <leader>p "*p
vnoremap <leader>pp "*P




