set nocompatible  
set encoding=utf-8
set helplang=cn
syntax on
set number
set relativenumber
set cursorline  " 显示光标所在行
set wrap " 自动换行
set showcmd  " 显示输入信息
set wildmenu " 显示补全提示
set hlsearch " 高亮搜索结果
"打开vim运行nohlsearch，取消高亮
exec "nohlsearch"
set incsearch " 一边输入一边高亮
set ignorecase " 忽略大小写
set smartcase " 智能大小写
set scrolloff=5 " 光标行上下移动范围各缩小5行
"寻找下一搜索结果，并将其置于屏幕中心
noremap = nzz               
"寻找上一搜索结果，并将其置于屏幕中心
noremap - Nzz
" ===
" === Normal Mode
" ===
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>
noremap s <nop>
map R :source $MYVIMRC<CR>
noremap <silent> J 5j
noremap <silent> K 5k
" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-K> 5<C-y>
noremap <C-J> 5<C-e>
nnoremap Y y$
" 全选
map <C-a> ggVG
" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
" Copy to system clipboard
vnoremap Y "+y
" Place the two screens up and down
noremap su <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
"新建标签页
map tn :tabe<CR>
"前一标签页
map th :-tabnext<CR>
"后一标签页
map tl :+tabnext<CR>
" 将当前标签和前一标签交换位置
noremap tmh :-tabmove<CR>
" 将当前标签和后一标签交换位置
noremap tml :+tabmove<CR>
" ===
" === Insert Model
" ===
inoremap <C-a> <ESC>A
" ===
" === Command Mode
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" ===
" === Leader Mapping
" ===
let mapleader= " "
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
map <LEADER>sd :w !sudo tee %<CR>
map <LEADER><CR> :nohlsearch<CR>
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

" Plugin List
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
"Plug 'connorholyday/vim-snazzy'
Plug 'liuchengxu/space-vim-theme'
call plug#end()
colorscheme space_vim_theme
"==================      snazzy config 	    =====================      
"color snazzy
"let g:SnazzyTransparent = 1
"let g:lightline = {
"\ 'colorscheme': 'snazzy',
"\ }
