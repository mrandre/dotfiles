call pathogen#infect()
colorscheme wombat
set go-=T
set wildmenu
set wildmode=list:longest
set title
set ignorecase
set smartcase
set number
set gfn=Inconsolata:h12.00
set hlsearch
set autoindent
set laststatus=2
set incsearch
set hidden
set history=1000
set scrolloff=3
set visualbell
set gtl=%t gtt=%F
set tabstop=4
set shiftwidth=4

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wildignore=compiled/**

syntax on
filetype on
filetype plugin on
filetype indent on

let mapleader = ","
map <silent> <leader>n :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0
let g:CommandTMatchWindowAtTop=1
let g:CommandTAcceptSelectionMap = ['<C-b>']
let g:CommandTAcceptSelectionTabMap = ['<CR>']
let g:session_autosave='yes'
let g:session_autoload='yes'
let g:session_default_to_last=1
let g:miniBufExplVSplit = 20
