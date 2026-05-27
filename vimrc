let g:polyglot_disabled = ['vue']
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', {'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'posva/vim-vue'
Plug 'wxmvv/citylights.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch':'master'}
Plug 'kshenoy/vim-signature'
Plug 'Exafunction/codeium.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
call plug#end()

" auto number
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

let g:mapleader = " "

set encoding=utf-8

syntax on
filetype plugin indent on

set cursorline
set signcolumn=yes
set termguicolors
set background=dark
silent! colorscheme citylights
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set conceallevel=0
set nowrap

if has('termguicolors')
  set termguicolors
endif
let &t_SI = "\e[6 q"   " Insert 模式 -> 竖杠 (或 "\e[5 q" 为细竖杠)
let &t_EI = "\e[2 q"   " Normal 模式 -> 方块
let &t_SR = "\e[4 q"   " Replace 模式 -> 下划线

set ignorecase
set smartcase
set incsearch
set hlsearch

set backspace=indent,eol,start

set splitright
set splitbelow

set nospell

set clipboard=

set hidden
set updatetime=300
set scrolloff=4
set mouse=a
set noshowmode
set wildmenu
set wildmode=longest:full,full


set redrawtime=20000


let g:airline_theme = 'minimalist'

let g:vue_pre_processors = []
"let g:vue_pre_processors = 'detect_on_enter'
autocmd FileType vue syntax sync minlines=50 maxlines=200


" =============================================================================
" coc.nvim  (补全 / LSP / 诊断 — 替代 blink.cmp + lspconfig + mason)
" =============================================================================
" 对应 mason ensure_installed 的语言服务, 首次启动 coc 会自动安装
let g:coc_global_extensions = [
      \ 'coc-pyright',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-tailwindcss',
      \ '@yaegassy/coc-volar',
      \ ]

function! CheckBackspace() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Tab / Shift-Tab 在补全菜单里选择
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" 回车确认补全 (auto-pairs 兼容)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 手动触发补全 (对应 blink 的 <A-Space>)
inoremap <silent><expr> <A-Space> coc#refresh()

" 跳转 (LSP)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" 悬浮文档 (K)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" 重命名 / code action
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>ca <Plug>(coc-codeaction-cursor)

" 格式化 (替代 conform.nvim; g:autoformat=false -> 不保存时自动格式化)
command! -nargs=0 Format :call CocActionAsync('format')
nnoremap <leader>cf :Format<CR>

" 诊断列表 (替代 trouble.nvim)
nnoremap <silent> <leader>xx :<C-u>CocList diagnostics<CR>


" =============================================================================
" NERDTree  (替代 snacks.explorer)
" =============================================================================
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.git$', 'node_modules$', '\.DS_Store$']
" 最后一个窗口是 NERDTree 时自动关闭
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" =============================================================================
" vim-startify  (替代 snacks.dashboard)
" =============================================================================
let g:startify_custom_header = [
      \ '   C I T Y   L I G H T S',
      \ ]
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   最近文件'] },
      \ { 'type': 'dir',       'header': ['   当前目录'] },
      \ { 'type': 'bookmarks', 'header': ['   书签'] },
      \ ]
" 对应 options.lua 里的 :Home 命令
command! Home Startify


" =============================================================================
" fzf  (替代 snacks.picker)  —— 键位贴近 LazyVim
" =============================================================================
nnoremap <leader><space> :Files<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>/  :Rg<CR>
nnoremap <leader>,  :Buffers<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>sm :Marks<CR>
" fzf 排除目录
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*" --glob "!node_modules/*"'


" =============================================================================
" vim-airline  (状态栏 + buffer Tab 栏, 替代 lualine + bufferline)
" =============================================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_type = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_symbols = {}

let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" <leader>b1 ~ b9 跳到对应 buffer (替代 bufferline 的 <leader>b1~9)
nmap <leader>b1 <Plug>AirlineSelectTab1
nmap <leader>b2 <Plug>AirlineSelectTab2
nmap <leader>b3 <Plug>AirlineSelectTab3
nmap <leader>b4 <Plug>AirlineSelectTab4
nmap <leader>b5 <Plug>AirlineSelectTab5
nmap <leader>b6 <Plug>AirlineSelectTab6
nmap <leader>b7 <Plug>AirlineSelectTab7
nmap <leader>b8 <Plug>AirlineSelectTab8
nmap <leader>b9 <Plug>AirlineSelectTab9
" 切换 buffer
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>


" =============================================================================
" Codeium  (替代 neocodeium, 键位照搬你的 LazyCity.lua)
" 首次使用先运行 :Codeium Auth 登录
" =============================================================================
let g:codeium_disable_bindings = 1
let g:codeium_manual = v:true              " 对应 neocodeium manual = true
let g:codeium_filetypes = {
      \ 'TelescopePrompt': v:false,
      \ }
imap <silent> <M-Bslash> <Cmd>call codeium#CycleOrComplete()<CR>
imap <silent> <M-f>      <Cmd>call codeium#Accept()<CR>
imap <silent> <M-w>      <Cmd>call codeium#AcceptNextWord()<CR>
imap <silent> <M-l>      <Cmd>call codeium#AcceptNextLine()<CR>
imap <silent> <M-]>      <Cmd>call codeium#CycleCompletions(1)<CR>
imap <silent> <M-[>      <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <silent> <C-]>      <Cmd>call codeium#Clear()<CR>


" =============================================================================
" vim-signature  (标记 / 书签 gutter, 替代 marks.nvim)
" =============================================================================
let g:SignatureMarkTextHLDynamic = 1
" mx 设标记, dmx 删, m<Space> 删全部; m. 自动放下一个标记
nnoremap <leader>md :SignatureWipeBuffer<CR>
nnoremap <leader>mD :delmarks A-Z<CR>


" =============================================================================
" vim-highlightedyank  (yank 高亮)
" =============================================================================
let g:highlightedyank_highlight_duration = 200


" =============================================================================
" autocmd  (对应 autocmds.lua)
" =============================================================================
" yank 时才同步到系统剪贴板 (delete/change 不污染剪贴板)
if has('patch-8.0.1394') || has('nvim')
  augroup YankToSystemClipboard
    autocmd!
    autocmd TextYankPost *
          \ if v:event.operator ==# 'y' |
          \   call setreg('+', v:event.regcontents, v:event.regtype) |
          \   call setreg('*', v:event.regcontents, v:event.regtype) |
          \ endif
  augroup END
endif

