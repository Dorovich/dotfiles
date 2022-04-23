" FOCUS MODE
" {{{
"function! ToggleFocusMode()
"    if (&foldcolumn != 12)
"        set laststatus=0
"        set showtabline=0
"        set nonumber
"        set noruler
"        set noshowmode
"        set foldcolumn=12
"        set numberwidth=10
"        hi FoldColumn ctermbg=none
"        hi NonText ctermfg=0
"    else
"        set number
"        set ruler
"        set showmode
"        set foldcolumn=0
"        set numberwidth=4
"        execute 'colorscheme ' . g:colors_name
"        hi clear CursorLine
"        hi CursorLine ctermbg=234
"        hi Whitespace ctermfg=8
"        hi NonText ctermfg=0
"        hi LineNr ctermfg=8
"        hi CursorLineNr ctermfg=6 ctermbg=234 cterm=bold
"        hi CursorLine ctermbg=234
"        hi ModeMsg ctermfg=6
"    endif
"endfunc
" }}}

" LIMPIAR CMD
autocmd CursorMoved * echon ''

" LIMPIAR BUFFERS BASURA DE NETRW
autocmd FileType netrw setl bufhidden=wipe

" COLORES
function! MyHighlights() abort
    highlight clear CursorLine
    highlight ModeMsg       cterm=NONE ctermfg=6
    highlight LineNr        cterm=NONE ctermfg=8
    highlight CursorLine    cterm=NONE           ctermbg=234
    highlight CursorLineNr  cterm=bold ctermfg=6 ctermbg=234
    highlight NonText       cterm=NONE ctermfg=0
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme pablo