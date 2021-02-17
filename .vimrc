"Create custom mappings:
" F1   None
" F2   Remove trainging whitespace
" F3   Toggle wells
" F4   toggle paste mode
" F5   Toggle background colour
" F6   Insert python if main block
" F8   Autopep8
"
filetype off   	   "required
filetype plugin indent on    " required
set background=dark
set hlsearch
set incsearch
set nocompatible   "required
set noerrorbells visualbell t_vb=
set noshowmode " remove the -- INSERT -- message
set nowrap
set number
set relativenumber
set t_ut= "to disable Background Color Erase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add
syntax enable

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"usage
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline' " currently causing issues on vim 7.2 at work
Plugin 'vim-airline/vim-airline-themes' " included so the solarized airline theme can be used
Plugin 'tpope/vim-fugitive' " provides the git integration on the powerline
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'frazrepo/vim-rainbow'

"Colors!!!
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized' " The colorscheme for work hence included

"python sytax checker
Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale' " reuires vim 8, only 7 at work
Plugin 'tell-k/vim-autopep8'

"Text Objects
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'bps/vim-textobj-python'

call vundle#end()

colorscheme gruvbox

function! TrimWhiteSpace() "Removes trailing spaces
  %s/\s*$//
  ''
endfunction

function! IfMain()
  let s:line=line(".")
  call append(s:line,"if __name__ == \"__main__\":")
  unlet s:line
endfunction

let g:wells_on = 1
function! ToggleWells()
    if g:wells_on
	set norelativenumber
        set nonumber
        SyntasticReset
        let g:wells_on = 0
    else
        set number
        set relativenumber
        SyntasticCheck
        let g:wells_on = 1
    endif
endfunction

nnoremap <F2> :call TrimWhiteSpace()<CR>
nnoremap <F3> :call ToggleWells() <CR>
nnoremap <F4> :set paste!<CR>
inoremap <F4> <esc>:set paste!<CR>i
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <F6> :call IfMain()<CR>
call togglebg#map("<F7>")
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
imap <C-BS> <C-W> " Map Ctrl-Backspace to delete the previous word in insert mode.

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Configure Autopep8
let g:autopep8_max_line_length=160
let g:autopep8_disable_show_diff=1

" Configure Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args="--max-line-length=300"

" Configure Vim-rainbow
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['red', 'lightblue', 'yellow', 'lightgreen', 'magenta']

" Configure Undotree

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|tmp$',
  \ 'file': '\v\.(pyc|ipynb|gz)$'
  \ }
"

"------------Start Python PEP 8 stuff----------------
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
set encoding=utf-8
autocmd FileType python set autoindent
autocmd FileType python set foldmethod=indent
set nofoldenable    " disable folding
"----------Stop python PEP 8 stuff--------------
