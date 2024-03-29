" -----------------------------
" Backups, Tmp Files, and Undo
" -----------------------------
set backup
set backupdir=~/.vim/.backup
set directory=~/.vim/.tmp

if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
endif

" ---------------
" UI
" ---------------
if exists('term_color')
  syntax enable
  set hlsearch
  highlight CursorLine ctermbg=Blue ctermfg=White
  highlight ColorColumn ctermbg=Cyan
  highlight TrailSpace ctermbg=Red
  match TrailSpace /\s\+$/
endif

if exists('full_color')
  highlight CursorLine ctermbg=235 guibg=#2c2d27 guifg=White
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  highlight TrailSpace guibg=DarkRed
endif

set ruler          " Ruler on
set number         " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set encoding=utf-8 " UTF-8 encoding
set cursorline     " Highlight current line
let &colorcolumn=join(range(71,999),",")  " Set column ruler to 70

" ---------------
" Behaviors
" ---------------
set autoread       " Automatically reload changes if detected
set wildmenu wildmode=list:longest,full  " Turn on wild menu

" X11-clipboard support
if has('xterm_clipboard')
  set clipboard=unnamedplus
endif

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2    " Delete everything with backspace
set shiftwidth=2   " Tabs under smart indent
set smarttab
set expandtab

" ---------------
" Searching
" ---------------
set ignorecase     " Case insensitive search
set smartcase      " Non-case sensitive search
set incsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc

" ---------------
" Visual
" ---------------
set list listchars=tab:——,extends:>,precedes:<
