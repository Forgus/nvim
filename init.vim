syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
let mapleader= " "
noremap <silent> J 5j
noremap <silent> K 5k
" make Y to copy till the end of the line
nnoremap Y y$
" Copy to system clipboard
vnoremap Y "+y
" Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
map <LEADER>sd :w !sudo tee %<CR>
map <LEADER>rd :source $MYVIMRC<CR>
noremap <LEADER><CR> :nohlsearch<CR>
