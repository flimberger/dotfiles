"
" General Configuration
"

" enable 256-color support
set t_Co=256

" The one true encoding
set encoding=utf-8
set fileencoding=utf-8
if has("unix")
	set termencoding=utf-8
endif

set autoindent
set backspace=indent,eol,start " new-style backspace behaviour
set cursorline " highlight current line
set incsearch
set hlsearch " highlight search results
set laststatus=2 " enable statusline
set nocompatible " don't emulate vi
set number " line numbers
set ruler " show my position
set showcmd  " show command sequences
set showmode  " show the current mode
set smarttab
set ttyfast  " assume fast terminal
set wildmenu

" syntax highlighting
syntax on
filetype plugin indent on

" I want to have nearly all files honor the 80 lines limit
set colorcolumn=80

" colors
colorscheme lucius
LuciusDark

" force .h files to be interpreted as C
" not valid for most Android code
"augroup project
"	autocmd!
"	autocmd BufRead,BufNewFile *.h set filetype=c
"augroup END
autocmd BufNewFile,BufRead *.bb set filetype=bitbake

" disable background files (VCS FTW!)
set nobackup
set noswapfile

"
" GUI Options
"

set guioptions-=m " no menu
set guioptions-=T " no toolbars
set guioptions-=L " no scrollbars

if has("win32")
	set shellslash " use slashes on windows, too

	set guifont=Consolas:h10
	colorscheme hilal
endif

"
" Custom statusbar in console
"

if !has("gui_running")
	set background=dark
	" current line highlight
	" highlight CursorLineNr ctermfg=red
	" highlight CursorLine cterm=None ctermbg=darkblue
	" long highlight
	" highlight ColorColumn ctermbg=blue

	" statusline stuff
	function! SetStatusHighlight(insertmode)
		if a:insertmode != 0
			" TODO: How to use values from gui colorscheme?  Currently it
			" is ``hilal``
			highlight User1 ctermbg=yellow ctermfg=black
			highlight User2 ctermbg=yellow ctermfg=red
			highlight User3 ctermbg=yellow ctermfg=darkblue
			highlight User4 ctermbg=yellow ctermfg=blue
		else
			highlight User1 ctermbg=darkcyan ctermfg=black
			highlight User2 ctermbg=darkcyan ctermfg=yellow
			highlight User3 ctermbg=darkcyan ctermfg=darkblue
			highlight User4 ctermbg=darkcyan ctermfg=yellow
		endif
		set statusline=%1*	" Default colors: User1 highlight
		set statusline+=%t	" filename
		set statusline+=%2*%m%1*	" modified flag (User2 hl)
		set statusline+=\ %3*%y%1*	" filetype (User3 hl)
		set statusline+=%=	" separator
		set statusline+=%4*%v-	" virtual cursor column (User4 hl)
		set statusline+=%l%1*/%L	" cursor line/total lines
		set statusline+=\ %P	" percentage of file position
	endfunction
	autocmd InsertEnter * call SetStatusHighlight(1)
	autocmd InsertLeave * call SetStatusHighlight(0)
	call SetStatusHighlight(0)
endif

" whitespace remover
function! StripTrailingWhitespace()
	if !&binary && &filetype != 'diff'
		normal mz
		normal Hmy
		%s/\s\+$//e
		normal 'yz<CR>
		normal `z
	endif
endfunction

set exrc
set secure
