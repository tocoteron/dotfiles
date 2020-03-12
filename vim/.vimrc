"COLOR SCHEME
"syntax on
if $TERM == 'xterm-256color'
	if empty($TMUX)
		if has('nvim')
			let $NVIM_TUI_ENABLE_TRUE_COLOR=1
		endif
		if has("termguicolors")
			set termguicolors
		endif
	endif
	colorscheme one
	set background=dark
endif

"COMPATIBLE
set nocompatible

"INCREMENT
set nf=alpha,hex

"SCREEN
set title
set number
set cursorline
set showmatch
set ambiwidth=double

"TAB
"set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

"INVISIBLE CHARACTER
set list
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮,nbsp:%

"CURSOR MOVING
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set scrolloff=8

"FILE
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set confirm
set hidden
set autoread
set nobackup
set noswapfile

"SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

"BEEP
set visualbell t_vb=
set noerrorbells

"ALIAS
let mapleader = "\<Space>"

nnoremap Q <Nop>

nnoremap ; :
"nnoremap <C-q> :%bd<Space>\|<Space>q<CR>
nnoremap <C-q> :qa<CR>
nnoremap <C-a> <Esc>$a
nnoremap <C-e> <Esc>^a
nnoremap <S-k> <C-b>
nnoremap <S-j> <C-f>
nnoremap <C-n> :noh<CR>
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w
nnoremap <leader>g <s-g><s-a>
nnoremap <leader>s :term<CR>

inoremap <C-j> <Esc>
inoremap jj <Esc>
inoremap <C-a> <Esc>$a
inoremap <C-e> <Esc>^a

tnoremap <esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n>
tnoremap jj <C-\><C-n>

"BRANCH FOR ENVIRONMENT
if has('unix')
endif

if has('mac')
endif

if has('win32') || has('win64')
endif

if has('clipboard')
	set clipboard=unnamedplus
endif
