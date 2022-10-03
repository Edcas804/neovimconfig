syntax on
set title
set number
set relativenumber
set mouse=a

" Indentacion con espacios
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround

set ignorecase
set spelllang=en,es
set termguicolors 
set clipboard+=unnamedplus
set encoding=UTF-8


let g:mapleader = ' '

imap ñl <Esc>
map <leader>w :w <CR>
map <leader>q :q <CR>

nnoremap <leader>e :source ~/.config/nvim/init.vim <CR>
nnoremap <leader>op :e ~/.config/nvim/init.vim <CR>

call plug#begin('~/.vim/plugged')
" Themes 
Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'navarasu/onedark.nvim'
Plug 'Yazeed1s/minimal.nvim'

" Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" or                                , { 'branch': '0.1.x' }
" Autopairs
Plug 'windwp/nvim-autopairs'
" Nerdtree
Plug 'preservim/nerdtree'
" Devicons
Plug 'ryanoasis/vim-devicons'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Scrollbar
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
" Zen mode
Plug 'folke/zen-mode.nvim'
" Emmet
Plug 'mattn/emmet-vim'
" Sniprun
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
	" 'bash install.sh 1' to get the bleeding edge or if you have trouble with the precompiled binary,
	"  but you'll compile sniprun at every update & will need the rust toolchain
	" Initialize plugin system
" Notify
Plug 'rcarriga/nvim-notify'
" Commentary
Plug 'shoukoo/commentary.nvim'
" Git
Plug 'airblade/vim-gitgutter'

" Git diff in display 
" !!!awesome plugin¡¡¡
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
" post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Markdown preview
Plug 'davidgranstrom/nvim-markdown-preview'
"
" Coq 
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" end Coq 
call plug#end()

colorscheme  onedark

" Autopairs config
lua << EOF
require("nvim-autopairs").setup {}
EOF
" Telescope config
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Airline config
let g:airline_powerline_fonts = 1
" Zen mode config
lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" Snip Run with notify

lua << EOF
	require'sniprun'.setup({
		display = {"NvimNotify"},
		display_options = {
			notification_timeout = 10   -- timeout for nvim_notify output
		},
	})
EOF
" :ColorizerToggle
"
" 🐓 Coq completion settings

" Set recommended to false
let g:coq_settings = { "keymap.recommended": v:false }

" Keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
