autocmd BufWritePre * :%s/\s\+$//e

set relativenumber
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set smartindent
set nowrap

" Make Y consistent with C and D
nnoremap Y y$

let mapleader = " "

nnoremap <leader><leader> <cmd>Telescope git_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:lf_replace_netrw = 1

call plug#begin()
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-speeddating'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

colorscheme duskfox
