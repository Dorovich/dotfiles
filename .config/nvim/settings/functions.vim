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

" LIMPIAR BUFFERS NETRW
autocmd FileType netrw setl bufhidden=wipe

" COLORES
function! MyHighlights() abort
    highlight clear CursorLine
    "         object       effect       foreground   background
    highlight Normal       cterm=none   ctermfg=15   ctermbg=none
    highlight VertSplit    cterm=none   ctermfg=0    ctermbg=0
    highlight Statement    cterm=none   ctermfg=3    ctermbg=none
    highlight Directory    cterm=none   ctermfg=4    ctermbg=none
    highlight Constant     cterm=none   ctermfg=3    ctermbg=none
    highlight Special      cterm=none   ctermfg=4    ctermbg=none
    highlight Identifier   cterm=none   ctermfg=6    ctermbg=none
    highlight PreProc      cterm=none   ctermfg=5    ctermbg=none
    highlight String       cterm=none   ctermfg=12   ctermbg=none
    highlight Number       cterm=none   ctermfg=1    ctermbg=none
    highlight Function     cterm=none   ctermfg=1    ctermbg=none
    highlight Visual       cterm=none   ctermfg=none ctermbg=238
    highlight Character    cterm=none   ctermfg=12   ctermbg=none
    highlight ModeMsg      cterm=none   ctermfg=6    ctermbg=none
    highlight LineNr       cterm=none   ctermfg=8    ctermbg=none
    highlight CursorLine   cterm=none   ctermfg=none ctermbg=234
    highlight CursorLineNr cterm=bold   ctermfg=6    ctermbg=234
    highlight NonText      cterm=none   ctermfg=0    ctermbg=none
    highlight Comment      cterm=none   ctermfg=8    ctermbg=none
    highlight StatusLine   cterm=none   ctermfg=none ctermbg=none
    highlight MatchParen   cterm=none   ctermfg=none ctermbg=238
    highlight Folded       cterm=italic ctermfg=8    ctermbg=none
    highlight SignColumn   cterm=none   ctermfg=none ctermbg=none
    highlight Pmenu        cterm=none   ctermfg=7    ctermbg=236
    highlight PmenuSel     cterm=none   ctermfg=236  ctermbg=180
    highlight PmenuSbar    cterm=none   ctermfg=none ctermbg=236
    highlight PmenuThumb   cterm=none   ctermfg=none ctermbg=238
    highlight Todo         cterm=bold   ctermfg=0    ctermbg=2
    highlight Error        cterm=bold   ctermfg=0    ctermbg=1
    highlight ErrorMsg     cterm=bold   ctermfg=0    ctermbg=1
    "  LSP object               effect          foreground   background   visual
    hi DiagnosticUnderlineError cterm=underline ctermfg=none ctermbg=none guisp=#e06c75
    hi DiagnosticError          cterm=italic    ctermfg=1    ctermbg=none
    hi DiagnosticUnderlineHint  cterm=underline ctermfg=none ctermbg=none guisp=#98c379
    hi DiagnosticHint           cterm=italic    ctermfg=2    ctermbg=none
    hi DiagnosticUnderlineWarn  cterm=underline ctermfg=none ctermbg=none guisp=#d19a66
    hi DiagnosticWarn           cterm=italic    ctermfg=3    ctermbg=none
    hi DiagnosticUnderlineInfo  cterm=underline ctermfg=none ctermbg=none guisp=#61afef
    hi DiagnosticInfo           cterm=italic    ctermfg=4    ctermbg=none
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme pablo

" AUTOCENTRAR
"autocmd InsertEnter * norm zz
