set encoding=utf-8
set nu
set splitbelow
set splitright

"visual bell instead of ringing
set vb
"split navigations without mouse
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
 nnoremap <space> za

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'kien/ctrlp.vim'

Plugin 'gmarik/Vundle.vim'

Plugin 'tmhedberg/SimpylFold'

Plugin 'vim-scripts/indentpython.vim'

" Bundle 'Valloric/YouCompleteMe'

" for syntax checking
Plugin 'scrooloose/syntastic'

" for PEP8 checking
Plugin 'nvie/vim-flake8'

"Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'


Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"git integration
Plugin 'tpope/vim-fugitive'

"git line changes
Plugin 'airblade/vim-gitgutter'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'christoomey/vim-tmux-navigator'

" for whitespace hygiene
Plugin 'bronson/vim-trailing-whitespace'

Plugin 'vim-perl/vim-perl'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" NERDTree properties
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd vimenter * NERDTree

" SimplyFold properties
let g:SimpylFold_docstring_preview=1

" YouCompleteMe properties
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Frontend file indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"python with virtualenv support>
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" beautiful code
let python_highlight_all=1
syntax on

try
	if has('gui_running')
		set background=dark
		colorscheme solarized
	else
		colorscheme zenburn
	endif
catch
endtry
augroup PERL
"autoindent
 autocmd FileType perl set autoindent|set smartindent

 autocmd filetype perl setlocal autoindent
 autocmd filetype perl setlocal expandtab
 autocmd filetype perl setlocal shiftwidth=4
 autocmd filetype perl setlocal tabstop=4

 " show matching brackets
 autocmd FileType perl set showmatch

 " show line numbers
 autocmd FileType perl set number

 " check perl code with :make
 autocmd FileType perl set makeprg=perl\ -c\ %\ $*
 autocmd FileType perl set errorformat=%f:%l:%m
 autocmd FileType perl set autowrite
 autocmd FileType perl nnoremap <buffer> <C-R> :exec '!perl' shellescape(@%, 1)<cr>
augroup END

" CtrlP configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" enable tab and s-tab in vmode
vmap <tab> >gv
vmap <s-tab> <gv

" syntastic perl config
let env = $DEVMACH

if env == "MSK"
let g:syntastic_enable_perl_checker = 1
else
let g:syntastic_enable_perl_checker = 0
endif

let g:syntastic_perl_checkers = ['perl']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1
