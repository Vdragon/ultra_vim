" ---------------
" Color
" ---------------
set term=xterm-256color
set t_ut=          " Disable BCE (Background Color Erase)
if &term =~ '256color' || has("gui_running")
  syntax enable
  colorscheme hybrid
  set hlsearch
endif

" -----------------------------
" Backups, Tmp Files, and Undo
" -----------------------------
set backup
set backupdir=~/.vim/.backup
set directory=~/.vim/.tmp
"Persistent Undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
endif

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set number         " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set encoding=utf-8
set title          " Set the title of the window in the terminal to the file

" ---------------
" Behaviors
" ---------------
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2  " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc
