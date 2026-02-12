" --- VISUALS (Inherit Terminal Colors) ---
syntax on                   " Enable syntax highlighting based on terminal colors
set relativenumber                  " Show line numbers
set number                  " Show line numbers
set cursorline              " Highlight the current line
set showmatch               " Highlight matching brackets [] {} ()

" --- SHORTCUTS ---
let mapleader = " "         " Set the 'Leader' key to Spacebar
" Map Space + e to toggle the file tree sidebar
nnoremap <leader>e :Lexplore<CR>

" --- EDITOR BEHAVIOR ---
set mouse=a                 " Enable mouse support (click, resize, scroll)
set clipboard=unnamedplus   " Use system clipboard (Ctrl+V outside vim)
set wildmenu                " Visual autocomplete for command menu
set wildmode=longest:full,full

" --- TABS & INDENTATION ---
set expandtab               " Convert tabs to spaces
set tabstop=4               " A tab is 4 spaces wide
set shiftwidth=4            " Indents are 4 spaces wide
set smartindent             " Auto-indent new lines

" --- SEARCH ---
set incsearch               " Search as you type
set hlsearch                " Highlight search matches
set ignorecase              " Ignore case...
set smartcase               " ...unless you type a capital letter

" --- FILE EXPLORER (Netrw) ---
let g:netrw_banner = 0      " Hide the help banner at the top
let g:netrw_liststyle = 3   " Tree View style
let g:netrw_browse_split = 4" Open files in the previous window
let g:netrw_winsize = 25    " Sidebar width (25% of screen)

" -- keep cursor in center --
set scrolloff=999
