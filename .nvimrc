set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" some markdown support
Bundle 'https://github.com/plasticboy/vim-markdown.git'

" full path fuzzy search
Bundle 'kien/ctrlp.vim'

" some yaml support
Bundle 'https://github.com/avakhov/vim-yaml.git'

" jump around documents
Bundle 'Lokaltog/vim-easymotion'

" JavaScript w00t
Plugin 'pangloss/vim-javascript'

" gitgutter
Plugin 'airblade/vim-gitgutter'

" TOML Support
Plugin 'toml-lang/toml'

" Rust support
Plugin 'rust-lang/rust.vim'

" TOML syntax
Plugin 'cespare/vim-toml'

" M-M-M-MULTIJAMES!
Plugin 'terryma/vim-multiple-cursors'

" editor-config
Plugin 'editorconfig/editorconfig-vim'

Plugin 'fatih/vim-go'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

call vundle#end()

filetype plugin indent on

set background=dark
colorscheme koehler 
let g:solarized_termtrans=1

" Setup soft tabs (spaces)
set softtabstop=2
set shiftwidth=2
set expandtab

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
" set encoding=utf-8 nobomb
set encoding=utf-8

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
" set cursorline
" Make tabs as wide as two spaces
" set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling twelve lines before the horizontal window border
set scrolloff=12

" Strip trailing whitespace (,ss)
" function! StripWhitespace()
"		let save_cursor = getpos(".")
"		let old_query = getreg('/')
"		:%s/\s\+$//e
"		call setpos('.', save_cursor)
"		call setreg('/', old_query)
" endfunction

"noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
"noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
"if has("autocmd")
"	" Enable file type detection
"	filetype on
"	" Treat .json files as .js
"	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
"	" Treat .md files as Markdown
"	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
"endif
