" Inspired from BlackLight's damn cool .vimrc

let mapleader=","
syntax on
set autoindent
set smartindent
set smarttab
set expandtab 		" expand tabs into spaces
set cindent 		" indentation special to C files
set linebreak
set wrap
set nocompatible
set hidden

" search related options
set ic 			" ignorecase when searching
set smartcase 		" override ic when uppercase given
set hlsearch
set incsearch

set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P
set laststatus=2

set encoding=utf-8
set fileencodings=utf-8

set nu 			" show line numbers
set ru 			" show cursor position below each window
set showmode 		" display the current mode on status line
set showmatch 		" show matching paranthesis, brackets
set shiftwidth=4	" number of spaces for each step of indent
set tabstop=4		" number of spaces for each <TAB>
set softtabstop=4
set backspace=2
set diffopt+=iwhite	" option for diff mode

set noerrorbells
set novisualbell

set wildmode=longest:full
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

set clipboard=unnamed,autoselect

augroup PERL
 au BufNewFile *.pl 0put = 'use strict;'
 au BufNewFile *.pl 1put = 'use warnings;'
 " check perl code with :make
 autocmd FileType perl set makeprg=perl\ -c\ %\ $*
 autocmd FileType perl set errorformat=%f:%l:%m
 autocmd FileType perl set autowrite
 autocmd FileType perl nnoremap <buffer> <C-R> :exec '!perl' shellescape(@%, 1)<cr>
augroup END

set tags=
au FileType c,cpp set tags+=$HOME/.vim/tags/libc
au FileType cpp set tags+=$HOME/.vim/tags/cpp
au FileType cpp set tags+=$HOME/.vim/tags/Boost
au FileType cpp set tags+=$HOME/.vim/tags/qt

au BufNewFile *.c 0put = '#include <stdio.h>'
au BufNewFile *.c 1put = '#include <stdlib.h>'
au BufNewFile *.c 2put = ''
au BufNewFile *.c 3put = 'int main(int argc, char **argv, char **envp) {'
au BufNewFile *.c 4put = '	return 0;'
au BufNewFile *.c 5put = '}'

au BufNewFile *.cpp 0put = '#include <iostream>'
au BufNewFile *.cpp 1put = 'using namespace std;'
au BufNewFile *.cpp 2put = ''
au BufNewFile *.cpp 3put = 'int main(int argc, char **argv, char **envp) {'
au BufNewFile *.cpp 4put = '	return 0;'
au BufNewFile *.cpp 5put = '}'
set tags+=./tags
set tags+=../tags

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" TagList
let Tlist_Auto_Highlight_Tag = 0
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1

" Use arrow keys to move windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" Disable autoindent for pasted code
map <leader>pp :set paste<cr>
map <leader>np :set nopaste<cr>

" Use J and K to move page up/down
map J <C-f>
map K <C-b>

" Open .vimrc
nmap <leader>v :vsplit $HOME/.vimrc<CR>

" Join two or more lines
nmap <leader>j :join<CR>
vmap <leader>j :join<CR>

" Indent stuff
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" Map ,g to grep a word/regex
map ,g :Grep<CR>

" Airline Settings
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1

" NERDTree stuff
let g:NERDTreeIgnore=['\.o$', '\.so$', '\.lo$', '\.a$', '\.la$', '\.log$', '\.m4$', 'tags', '\~$', '\.pyc']
let g:NERDTreeWinPos = "right"
map <leader>d :call ToggleNERD()<CR>

" CtrlP configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" /////////////////////////////
" Bundles configuration START "
" /////////////////////////////
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'msencer/vim-perltidy'
Plugin 'exvim/main'
Plugin 'exvim/ex-project'
Plugin 'exvim/ex-utility'
Plugin 'exvim/ex-tags'
Plugin 'exvim/ex-gsearch'
Plugin 'exvim/ex-taglist'
Plugin 'exvim/ex-hierarchy'
Plugin 'exvim/ex-indenthtml.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic' " syntax checking
Plugin 'jnurmine/Zenburn' " color scheme
Plugin 'altercation/vim-colors-solarized' " color scheme
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter' " for git line changes
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-perl/vim-perl'
Plugin 'tpope/vim-surround'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Shougo/neocomplete.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" /////////////////////////////
" Bundles configuration END "
" /////////////////////////////

" beautiful code
let python_highlight_all=1

colorscheme zenburn

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

function! ToggleNERD()
	exe ':NERDTreeToggle'
	wincmd l
endfunction
