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
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

augroup FileTypeIndent 
    autocmd!
    autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
    autocmd FileType vue setlocal sw=2 sts=2 ts=2 et
augroup END

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

"
set inccommand=nosplit

"BEEP
set visualbell t_vb=
set noerrorbells

"ALIAS
let mapleader = "\<Space>"

nnoremap Q <Nop>

nnoremap ; :
"nnoremap <C-q> :%bd<Space>\|<Space>q<CR>
nnoremap <C-q> :qa<CR>
"nnoremap <C-a> <Esc>$a
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

"PLUGINS
let s:use_plugins = 1

if s:use_plugins

	let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
	let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

	" dein {{{
	let s:dein_cache_dir = g:cache_home . '/nvim/dein'

	" reset augroup
	augroup MyAutoCmd
		autocmd!
		autocmd InsertLeave * set nopaste
		autocmd VimEnter * vsplit
		autocmd VimEnter * wincmd l
		autocmd VimEnter * term
		autocmd VimEnter * wincmd h
	augroup END

	if &runtimepath !~# '/dein.vim'
		let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

		" Download dein.vim
		if !isdirectory(s:dein_repo_dir)
			call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
		endif

		" Load dein.vim as a plugin
		execute 'set runtimepath^=' . s:dein_repo_dir
	endif

	" settings of dein.vim
	let g:dein#install_max_processes = 16
	let g:dein#install_progress_type = 'title'
	let g:dein#install_message_type = 'none'
	let g:dein#enable_notification = 1

	if dein#load_state(s:dein_cache_dir)
		call dein#begin(s:dein_cache_dir)

		let s:toml_dir = g:config_home . '/nvim/dein'

		call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
		call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
		if has('nvim')
			call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
		endif

		call dein#end()
		call dein#save_state()
	endif

	if has('vim_starting') && dein#check_install()
		call dein#install()
	endif
endif
