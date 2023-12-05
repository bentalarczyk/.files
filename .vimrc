"'''      '''"
"   VIM RC   "
"'''      '''"

set title
" set bg=light
set noshowmode
set noruler
set noshowcmd

" Adds line numbers:
    set number relativenumber
" No Highlight search:
    set nohlsearch
" Searches incrementely:
    set incsearch
" Set out tab to 4 spaces:
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
" Converts tabs to spaces:
    set expandtab
" Some basics:
    set autoindent
    set fileformat=unix
" Syntax highlighting:
    syntax on
" Character encoding:
    set encoding=utf-8
" Splits open at the bottom and right:
    set splitbelow splitright
" Enables autocompletion:
    set wildmode=longest,list,full
" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Copy selected text to system clipboard (requires gvim installed):
    vnoremap <C-c> "*Y : let @+=@*<CR>
    map <C-p> "+P
" Automatically deletes all trailing whitespace on save:
    autocmd BufWritePre * %s/\s\+$//e
