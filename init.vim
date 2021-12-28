set tabstop=4
set shiftwidth=4
set autoindent
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
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')
" ===
" === Leader Mapping
" ===
let mapleader= " "
map <LEADER>rc :e $MYVIMRC<CR>
map <LEADER>sd :w !sudo tee %<CR>
map <LEADER><CR> :nohlsearch<CR>
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>ff :Ranger<CR>
map <LEADER>fn :RangerNewTab<CR>
map <LEADER>pi :PlugInstall<CR>
map <LEADER>mp :MarkdownPreview<CR>
map <LEADER>mg :Goyo<CR>
"nmap <LEADER>wn <Plug>VimwikiNextLink
"nmap <LEADER>wp <Plug>VimwikiPrevLink



noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap <silent> <LEADER>y :<C-u>CocList -A --normal yank<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'python'
		set splitbelow
		:sp
		:term python %
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	endif
endfunc

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <LEADER>ph <C-\><C-n><C-w>h
tnoremap <LEADER>pj <C-\><C-n><C-w>j
tnoremap <LEADER>pk <C-\><C-n><C-w>k
tnoremap <LEADER>pl <C-\><C-n><C-w>l
nnoremap <LEADER>ph <C-w>h
nnoremap <LEADER>pj <C-w>j
nnoremap <LEADER>pk <C-w>k
nnoremap <LEADER>pl <C-w>l

nnoremap <silent> <leader>gg :LazyGit<CR>

" Plugin List
call plug#begin('$XDG_CONFIG_HOME/plugged')
Plug 'tversteeg/registers.nvim'
Plug 'vim-airline/vim-airline'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'francoiscabrol/ranger.vim'
Plug 'https://github.com.cnpmjs.org/rbgrouleff/bclose.vim.git'
Plug 'https://github.com.cnpmjs.org/iamcco/markdown-preview.nvim.git', { 'do': 'cd app && yarn install'  }
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'https://github.com.cnpmjs.org/plasticboy/vim-markdown.git'
Plug 'junegunn/goyo.vim'
Plug 'https://github.com.cnpmjs.org/junegunn/limelight.vim.git'
"Plug 'vimwiki/vimwiki'
" nvim v0.5.0
Plug 'kdheepak/lazygit.nvim'
call plug#end()


" ================ lazygit config ===================
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

" ================ vimwiki config ===================
"let g:vimwiki_list = [{'path': '~/vimwiki/','syntax': 'markdown','ext': '.md'}]

" ================ markdown-preview config ===================
let g:mkdp_auto_close = 0
" ================ vim-markdown config ==================
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" ================ nerdtree config ===================
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0 
let g:ranger_replace_netrw = 1 
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Toggle
nnoremap <silent> tt :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"==================      vim-one config 	    =====================      
colorscheme one
set background=dark
let g:airline_theme='one'
set termguicolors
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
"==================      coc config      =====================      
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use ? to show documentation in preview window.
nnoremap <silent> ? :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>la  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current documentl.
nnoremap <silent><nowait> <space>lo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next iteml.
nnoremap <silent><nowait> <space>lj  :<C-u>CocNext<CR>
" Do default action for previous litem.
nnoremap <silent><nowait> <space>lk  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>lp  :<C-u>CocListResume<CR>
autocmd FileType json syntax match Comment +\/\/.\+$+
let g:coc_global_extensions = ['coc-java','coc-snippets','coc-git','coc-json','coc-marketplace','coc-pyright','coc-lua']
if exists('*complete_info')
	  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" <CR> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" Map <tab> to trigger completion and navigate to the next item: >
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
let g:coc_snippet_next = '<tab>'
