" Automatic reload of .vimrc
autocmd! bufwritepost .vimrc source %

" set nocompatible
" syntax off

filetype off
set rtp+=~/.vim/vundle

" Call Vundle
call vundle#begin()

" This is the Vundle package itself
" Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Lokaltog/vim-powerline.git'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'vim-scripts/Conque-Shell'
" Plugin 'rson/Conque-Shell'
" Plugin 'lrvick/Conque-Shell'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'               " Better Folding

Plugin 'scrooloose/nerdtree'                " Project and file navigation
Plugin 'majutsushi/tagbar'                  " Class/module browser


call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on
syntax on

" Permet de temporairement virer les indentations automatiques.
" délanchement avec F2
set pastetoggle=<F2>
let mapleader = ","

" Menu completion
set wildmenu
set wildmode=longest:full,list:full

" Encoding with something readable
set enc=utf-8

" Quelques remaps
"" Y permet de copier la fin de la ligne courante
map Y y$
"" . utilisable sur une sélection visuelle
vnoremap . :normal .<CR>

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" turn off search highlight on demand
nnoremap <leader><space> :nohlsearch<CR>

set history=700
set undolevels=700

" Gestion des tabulations
set tabstop=4       " tabs are 4 spaces
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set shiftround
set expandtab       " tabs are spaces

" Affichage des numéro de ligne en raltif pour déplacements rapide
set relativenumber  " Show relative line numbers
set number          " Show current line number
set nocursorline    " Do not show me that blank line
set showmatch       " highlight matching [{()}]
set nowrap          " No wrap on load
set tw=79           " Largeur de l'ecran = 79 colonnes
set fo-=t           " No wrap while typing either
set colorcolumn=80  " We display coloumn 80 with color
highlight ColorColumn ctermbg=233

set hlsearch        " hilight search match
set incsearch       " Incremental search
set ignorecase      " Case insensitive
set smartcase       " ???

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Plugins
" vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
let g:airline_inactive_collapse=1
" let g:airline_theme='dark'
let g:airline_skip_empty_sections = 1

" Color scheme
" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
" set wildignore+=*_build/*
" set wildignore+=*/coverage/*

" Jedi-vim
" Autocompletion for python
let g:jedi#use_splits_not_buffers = "left"  " opens definitions in a split on the left
let g:jedi#show_call_signatures = "1"       " signatures shows in a pop-up buffer (1) or in the cmd line (2)
let g:jedi#goto_command = "<Leader>d"
let g:jedi#usages_command = "<Leader>z"
let g:jedi#popup_on_dot = 1                 " A tester...
let g:jedi#popup_select_first = 1           " A tester...
map <Leader>b Oimport ipdb; ipdb.set_trace() # Breakpoint<C-c>

" SimplyFold
" Folding for python...
" let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 1            " Fold theses imports

" Tag Bar
" sudo apt-get install exuberant-ctags
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose
set tags=~/.vim/mytags

" NerdTree Settings
let NERDTreeIgnore=['.vim$', '\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
" set nofoldenable
set foldenable          " enable folding
set foldlevelstart=1    " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <Space> za
set foldmethod=indent   " fold based on indent level

" Conque : cmd line from Vim
" vim 'https://conque.googlecode.com/files/conque_2.3.vmb' -c ':so % | q'
" Deux bind pratiques :
" Shift+t : ouvrir un split vertical avec un terminal
noremap <S-t> :ConqueTermVSplit bash<CR>
" shift + w : ferme le split actif
noremap <S-w> :q!<CR>

