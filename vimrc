"for pathogen

"ask Steve Losh
call pathogen#infect()

" haha 
set nocompatible

"now we start
syntax enable                    " syntax highlighting
syntax on
filetype on
filetype plugin on
filetype plugin indent on

" persistent undo
set undofile
set undodir=~/.vim-tmp

" persistent paste
"set paste

"history stuff
set history =700                " setting history length to 700

"encoding stuff
set encoding=utf-8

set autoread                     " detect changes in outside apps
set ruler                        " show cursor position
set number                        " line numbers

set ignorecase                    " case insensitive searching...
set smartcase                    " ...unless query is capitalized
set hlsearch                    " highlight matches...
set magic                        " pattern match with special characters
set showmatch                    " show matching braces/paren

set showcmd                         " display incomplete commands.
set showmode                    " display the mode you're in.

set gfn=Menlo:h18                " gVim font
set shell=/bin/bash                " for running things

set backspace=indent,eol,start  " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

"set wrap                          " Turn on line wrapping.
set nowrap
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " no swap files
"set directory=$HOME/.vim/tmp/  " Keep swap/backup files in one location

set expandtab                 " spaces instead of tabs
set shiftwidth=4                " shift width
set tabstop=4           " tab width
set smarttab

set laststatus=2                  " Show the status line all the time

" sexy status line
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

"set lbr                            " smart word breaking
"set tw=80                        " line width

set si              " smart indenting
set wrap

set list
"display some chars with some other magicchars
set listchars=tab:▸\ ,eol:¬,trail:·,extends:>,precedes:<
set showbreak=↪
"clipboarding
set clipboard=unnamed
"set clipboard+=unnamed

"colorscheme
"colorscheme elflord
set background=dark
let g:solarized_visibility="high"
colorscheme solarized

" folding
set foldmethod=indent

" Enable mouse support
set mouse=a


""""""""""""""""""""""""""""""""
" custom keys
" custom keys
" custom keys
""""""""""""""""""""""""""""""""
nnoremap <Space> za
vnoremap <Space> zf


"remap movement keys
"down, up, left, right
"j     k     l     ;
noremap l <left>
noremap <C-w>l <C-w><left>
noremap ; <right>
noremap <C-w>; <C-w><right>
noremap <C-x> :x<CR>

let mapleader = ","

""""""""""""""""""""""""""""""""
"for switching tabs/windows
"CTRL for tabs, ALT for windows
map <C-left> <C-w><left>
map <C-right> <C-w><right>
map <C-up> <C-w><up>
map <C-down> <C-w><down>
" complement <C-w>n :new<CR>
map <C-w>m :vnew<CR>

"just use gt and gT
map <A-left> :tabnext<CR>
map <A-right> :tabprevious<CR>
map <A-up> :tabs<CR>
map <A-down> :tabe<CR>
"map <A-c> :tabeclose<CR>

"For NERDTree
map <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeWinSize=20

"For TagBar
map <F5> :TagbarToggle<CR>

"For CtrlP
map <C-p> :CtrlP<CR>

"For autocmd
autocmd VimEnter * NERDTree " start nerd tree

"For vimshell
map <C-w>s :source ~/.vim/bundle/vimsh/vimsh.vim<CR>

" Shell command (copy result into a buffer)
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction
