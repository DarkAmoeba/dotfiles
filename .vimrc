"vundle
set nocompatible   "required
filetype off   	   "required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"python sytax checker
Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale' " reuires vim 8, only 7 at work
"Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'

"Colors!!!
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized' " The colorscheme for work hence included

"prevent excessive default folding with this plugin
"Plugin 'tmhedberg/SimpylFold' " Causing errors, removed

"usage
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline' " currently causing issues on vim 7.2 at work
Plugin 'vim-airline/vim-airline-themes' " included so the solarized airline theme can be used
Plugin 'tpope/vim-fugitive' " provides the git integration on the powerline

"Text Objects
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'bps/vim-textobj-python'

call vundle#end()
filetype plugin indent on    " required

" Set up the colour theme and syntax highlighting
"colorscheme gruvbox
let python_highlight_all=1
syntax enable
set background=dark
"let g:solarized_termcolors=256
colorscheme gruvbox
set t_ut= "to disable Background Color Erase

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
"set ignorecase
"set smartcase
set nowrap
" Search highlighting options
set hlsearch
set incsearch
set relativenumber

"Create custom mappings:
" F1   None
" F2   Remove trainging whitespace
" F3   Toggle wells
" F4   toggle paste mode
" F5   Toggle background colour
" F6   Insert python if main block
" F8   Autopep8

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>

"Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

function! IfMain()
  let s:line=line(".")
  call append(s:line,"if __name__ == \"__main__\":")
  unlet s:line
endfunction

nnoremap <F6> :call IfMain()<CR>

nnoremap <F2> :call TrimWhiteSpace()<CR>

nnoremap <F3> :call ToggleWells() <CR>
let g:wells_on = 1
function! ToggleWells()
    if g:wells_on
        set nonumber
        SyntasticReset
        let g:wells_on = 0
    else
        set number
        SyntasticCheck
        let g:wells_on = 1
    endif
endfunction

nnoremap <F4> :set paste!<CR>
inoremap <F4> <esc>:set paste!<CR>i

call togglebg#map("<F5>")
let g:autopep8_max_line_length=160
let g:autopep8_disable_show_diff=1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
"set relativenumber

"turn on numbering
set number

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" set status line configuration for lightline
"set laststatus=2
set noshowmode " remove the -- INSERT -- message

" Configure Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args="--max-line-length=300"
"let g:syntastic_python_checkers = ['pyflakes', 'pycodestyle']
"let g:syntastic_python_pycodestyle_post_args="--max-line-length=140"

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
"set backspace=indent,eol,start

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
set nofoldenable    " disable folding

"----------Stop python PEP 8 stuff--------------
