"for pathogen
"ask Steve Losh
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on		" type file detection
set nocompatible

"now we start
syntax enable					" syntax highlighting
syntax on

"history stuff
set history =700				" setting history length to 700

"encoding stuff
set encoding=utf-8

set autoread 					" detect changes in outside apps
set ruler						" show cursor position
"set number						" line numbers

set ignorecase					" case insensitive searching...
set smartcase					" ...unless query is capitalized
set hlsearch					" highlight matches...
set magic						" pattern match with special characters
set showmatch					" show matching braces/paren

set showcmd    	     	        " display incomplete commands.
set showmode					" display the mode you're in.

set gfn=Menlo:h18			    " gVim font
set shell=/bin/bash		    	" for running things

set backspace=indent,eol,start  " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

"set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " no swap files
"set directory=$HOME/.vim/tmp/  " Keep swap/backup files in one location

set expandtab					" spaces instead of tabs
set shiftwidth=2				" shift width
set tabstop=2					" tab width
set smarttab

set laststatus=2                  " Show the status line all the time

" sexy status line
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set lbr							" smart word breaking
set tw=80						" line width

set si              " smart indenting
set wrap						" word wrapA

set list
"display some chars with some other magicchars
set listchars=tab:▸\ ,eol:¬
set showbreak=↪

"clipboarding
set clipboard+=unnamed

"colorscheme
"colorscheme elflord
set background=dark
colorscheme solarized

" folding
set foldmethod=indent

" Enable mouse support
set mouse=a

"for switching tabs/windows
"CTRL for tabs, ALT for windows
map <C-left> <C-w><left>
map <C-right> <C-w><right>
map <C-up> <C-w><up>
map <C-down> <C-w><down>

"just use gt and gT
"map <A-left> :tabnext<CR>
"map <A-right> :tabprevious<CR>
"map <A-down> :tabclose<CR>
"map <A-up> :tabs<CR>
map <A-down> :tabe<CR>

"For NERDTree
map <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeWinSize=20

"For TagBar
map <F5> :TagbarToggle<CR>

"For autocmd
autocmd VimEnter * NERDTree
