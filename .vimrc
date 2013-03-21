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
set gtl=%t gtt=%t
set tabstop=4
set shiftwidth=4
set mouse=a

set clipboard=unnamed

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wildignore=app/public/*,app/build/**,public/**/*.js,*/node_modules/**/*,solo/**/*.js

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

:set tabline=%!ShortTabLine()

function! ShortTabLine()
	let ret = ''
	for i in range(tabpagenr('$'))
		"find the buffername for the tab label
		let tab = i + 1
		let winnr = tabpagewinnr(tab)
		let buflist = tabpagebuflist(tab)
		let buffername = bufname(buflist[ winnr - 1 ] )
		let filename = fnamemodify(buffername, ':t')
		let ret .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
		" check if there is no name
		if filename == ''
			let filename = 'noname'
		endif
		let filename = substitute(filename, "\.coffee", "", "")
		let filename = substitute(filename, "\.controller", "\.ct", "")
		let filename = substitute(filename, "\.view", "\.vw", "")
		let filename = substitute(filename, "\.template.html", "\.tmp", "")
		let filename = substitute(filename, "\.markup.html", "\.mrk", "")
		" only show the first 6 letters of the name and
		" .. if the filename is more than 8 letters long
		if strlen(filename) >= 18
			let ret .= ' '.filename[0:15].'.. '
		else
			let ret .= ' '.filename.' '
		endif
		let ret .= '%#TabLineFill#'
	endfor
	" after the last tab fill with TabLineFill and reset 
	let ret .= '%#TabLineFill#%T'
	return ret
endfunction

		
