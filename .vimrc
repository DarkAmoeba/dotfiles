"Create custom mappings:
" F1   None
" F3   Toggle wells
" F4   toggle paste mode
" F5   Undo tree
" F6   Insert python if main block
" F7   Toggle background color
" F8   Ruff fix

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
" set undodir=~/.vim/undodir
" set undofile

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
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'mbbill/undotree'
Plugin 'frazrepo/vim-rainbow'

"Colors!!!
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized' " The colorscheme for work hence included

"python sytax checker
Plugin 'dense-analysis/ale'

"Text Objects
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'bps/vim-textobj-python'

"rust
Plugin 'rust-lang/rust.vim'

call vundle#end()

colorscheme gruvbox

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
	ALEDisable
	let g:ale_virtualtext_cursor = 0
        let g:wells_on = 0
    else
        set number
        set relativenumber
	ALEEnable
	let g:ale_virtualtext_cursor = 1
        let g:wells_on = 1
    endif
endfunction

nnoremap <F3> :call ToggleWells() <CR>
nnoremap <F4> :set paste!<CR>
inoremap <F4> <esc>:set paste!<CR>i
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <F6> :call IfMain()<CR>
call togglebg#map("<F7>")
nnoremap <F8> :ALEFix<CR>

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
imap <C-BS> <C-W> " Map Ctrl-Backspace to delete the previous word in insert mode.

" Configure Ale
let g:ale_linters = {'python': ['ruff'] }
let g:ale_linters_explicit = 1

" Fixers
let g:ale_fixers = { 'python': ['ruff', 'ruff_format'] }
let g:ale_python_ruff_options = '--config ~/dotfiles/ruff.toml'
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Configure Vim-rainbow bracket highlighting
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
