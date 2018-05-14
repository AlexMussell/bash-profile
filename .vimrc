" syntax highlighing
:syntax on
" show line numbers
:set number
" set minimum line number width to 3
:set numberwidth=3
" show line under line cursor is on
:set cursorline
" set the line highlight colour to clear
:hi cursorline cterm=none
" set the line number for the current cursor line to red (this can only be done by having current line highlighted)
:hi cursorlinenr ctermfg=red
" jump to search results whilst typing
:set incsearch
" ignore case whilst searching unless a capital is in the search string
:set smartcase
" use indentation of previous line when making a new line
:set autoindent
" allow using undo even after closing a file
set undodir=~/.vim/undodir