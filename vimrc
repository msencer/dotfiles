set encoding=utf-8
set nu
set splitbelow
set splitright

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
Plugin 'gmarik/Vundle.vim'

Plugin 'tmhedberg/SimpylFold'

Plugin 'vim-scripts/indentpython.vim'

Bundle 'Valloric/YouCompleteMe'

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

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'christoomey/vim-tmux-navigator'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" NERDTree properties 
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd vimenter * NERDTree

" SimplyFold properties
let g:SimpylFold_docstring_preview=1

" YouCompleteMe properties
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

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

" To toggle colorscheme to dark/light
call togglebg#map("<F5>")

