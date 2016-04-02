set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'         "Search
Plugin 'tpope/vim-fugitive'     "Git Integration
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} "status bar


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""" KEY COMBOS

set splitbelow
set splitright

""" split navigations

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" Enable Folding """
""" Plugin 'tmhedberg/SimpylFold'

set foldmethod=indent
set foldlevel=99

""" Enable folding with the spacebar """
nnoremap <space> za

let g:SimpylFold_docstring_preview=1


""" Python Indentation (PEP8) """
""" Plugin 'vim-scripts/indentpython.vim'
""" Of course for code folding to work based on indentations, you want your indents to be correct. Again VIM falls short a bit out of the box because it doesn’t handle auto-indent after a function definition. Two things can be done with indentation:
  """ 1. The first is to get indentation to follow PEP8 standards.
  """ 2. The second part is to better handle auto-indentation.

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
        \ set tabstop=2
        \ set softtabstop=2
        \ set shiftwidth=2

""" Flagging Unnecessary Whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""" UTF8 Support
set encoding=utf-8

""" You Complete configuration
""" Bundle 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

""" python with virtualenv support

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax Checking/Highlighting
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

""" Color Schemes
""" Plugin 'jnurmine/Zenburn'
""" Plugin 'altercation/vim-colors-solarized'

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

""" FILE BROWSING
""" Plugin 'scrooloose/nerdtree'
""" Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

""" Line Numbering On
set nu

""" Git Integration
""" Want to perform basic git commands without leaving the comfort of VIM? Then vim-fugitive is the way to go

""" Powerline is a status bar that displays things like the current virtualenv, git branch, files being edited, and much more.

""" System Clipboard
""" Vim usually has its own clipboard and ignores the system keyboards, but sometimes you might want to cut, copy, and/or paste to/from other applications outside of VIM. On OSX, you can access your system clipboard with this line:

set clipboard=unnamed

""" VIM in the Shell
""" And finally, once you’ve mastered VIM and its keyboard shortcuts, you’ll often find yourself getting annoyed with the lack of those same shortcuts in the shell. Fear not, most shells have a VI mode. To turn it on for your shell, add the following line to ~/.inputrc: set editing-mode vi
