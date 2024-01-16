"_______________________________________
"
"   ▌      ▜    ▐  ▌     
" ▞▀▌▞▀▌▞▀▖▐ ▞▀▖▜▀ ▌▗▘▞▀▖
" ▌ ▌▚▄▌▛▀ ▐ ▛▀ ▐ ▖▛▚ ▌ ▌
" ▝▀▘▗▄▘▝▀▘ ▘▝▀▘ ▀ ▘ ▘▝▀ 
"_______________________________________

" disable vi compatibility (!first entry!)
set nocompatible

" bootstrap vim-plug plugin manager
let vimhome = $HOME.'/.vim'
if empty(glob(vimhome . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.vimhome.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" configure vim-plug plugins
set rtp+=~/.vim/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
"Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-syntastic/syntastic'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'neoclide/coc.nvim'
Plug 'mitsuhiko/vim-jinja'
Plug 'ap/vim-css-color'
"Plug 'dracula/vim', {'as': 'dracula'}
"Plug 'arcticicestudio/nord-vim'
"Plug 'ryanoasis/vim-devicons'
call plug#end()

" default shell 
set shell=/bin/bash

set autoread

" spacing/indentation
set expandtab
set smarttab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
"set textwidth=140
"set colorcolumn=120

" disable annoying visual bell
set visualbell t_vb=
set noerrorbells

" show line number
set number
set relativenumber

" folding
set foldenable
set foldmethod=syntax
set foldlevel=99
set foldlevelstart=99

" status line
set laststatus=2
set showmode
set showcmd
set ruler
set wildmenu

" fuzzy search
"set autochdir
set path+=**
map <leader>f :find<Space>

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" background and colorscheme
syntax on
set t_Co=256
set background=dark
"set guifont=FiraCode\ Nerd\ Font\ 10
if has("gui_running")
    highlight Normal guifg=white guibg=black
endif
"colorscheme nord

" remember window position/size (gui)
set sessionoptions+=resize

" enable loading file specific plugins
filetype plugin indent on

" enable built-in plugins
"   man: man page viewing
"   matchit: extended % matching
runtime ftplugin/man.vim
runtime macros/matchit.vim

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" nerdtree
map <leader>ne :NERDTreeToggle<cr>
let NERDTreeShowHidden = 1
"let NERDTreeMinimalUI = 1

" airline
"let g:airline_disable_statusline = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" vim devicons
let g:webdevicons_enable = 1
"let g:webdevicons_enable_nerdtree = 1
"let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 0
"let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0

" vimwiki
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/Documents/notes/vimwiki/', 'path_html': '~/Documents/notes/vimwiki/html/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}]
"let g:vimwiki_hl_headers = 1
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_auto_header = 1

" ycm
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python': 1, }
"let g:ycm_autoclose_preview_window_after_insertion = 1
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

