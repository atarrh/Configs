
" Try hopelessly to fix tabbing
set expandtab
set smarttab

set tabstop=4
set shiftwidth=4

set number

" Spaces before cursor

" Force movement keys to wrap around
set whichwrap+=<,>,[,],h,l

" Make VIM use ZSH as default shell
set shell=/bin/zsh

" Reduce timeout
set timeoutlen=500

set textwidth=80

" *****************
" KEYBINDINGS AND SHIT
" *****************
 
" In Normal mode, semicolon brings up colon prompt
cnoremap ; :
nnoremap ; :
nnoremap : ;

" Exit Insert mode with jj
inoremap jj <Esc>

" Quick newline chars with enter
nnoremap <silent> <CR> O<Esc>

" Remap space to insert single character
noremap <Space> i_<Esc>r

" Enable syntax highlighting
syntax enable



