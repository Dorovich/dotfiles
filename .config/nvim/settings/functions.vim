" FOCUS MODE
function! ToggleFocusMode()
	if (&foldcolumn != 12)
		set laststatus=0
		set showtabline=0
		set nonumber
		set noruler
		set foldcolumn=12
		set numberwidth=10
		hi FoldColumn ctermbg=none
		hi NonText ctermfg=0
	else
		set laststatus=2
		set showtabline=2
		set number
		set ruler
		set foldcolumn=0
		set numberwidth=4
		execute 'colorscheme ' . g:colors_name
		hi clear CursorLine
		hi CursorLine ctermbg=234
		hi Whitespace ctermfg=8
	endif
endfunc
