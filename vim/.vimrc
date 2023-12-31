"_______________________________________
"
"   ▌      ▜    ▐  ▌     
" ▞▀▌▞▀▌▞▀▖▐ ▞▀▖▜▀ ▌▗▘▞▀▖
" ▌ ▌▚▄▌▛▀ ▐ ▛▀ ▐ ▖▛▚ ▌ ▌
" ▝▀▘▗▄▘▝▀▘ ▘▝▀▘ ▀ ▘ ▘▝▀ 
"_______________________________________

" disable vi compatibility (!first entry!)
set nocompatible

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

" auto change working directory
"set autochdir
set path+=**

" status line
set laststatus=2
set showmode
set showcmd
set ruler
set wildmenu

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

" airline
"let g:airline_powerline_fonts = 1
"let g:airline_skip_empty_sections = 1

" vim devicons
"let g:webdevicons_enable = 1
"let g:webdevicons_enable_nerdtree = 1
"let g:webdevicons_enable_airline_tabline = 1
"let g:webdevicons_enable_airline_statusline = 1
"let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0

" vimwiki
"let g:vimwiki_global_ext = 0
"let g:vimwiki_list = [{'path': '~/Documents/notes/vimwiki/', 'path_html': '~/Documents/notes/vimwiki/html/'}]
"let g:vimwiki_list = [{'path': '~/Documents/notes/vimwiki/', 'path_html': '~/Documents/notes/vimwiki/html/', 'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_hl_headers = 1

" ycm
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python': 1, }
"let g:ycm_autoclose_preview_window_after_insertion = 1
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

