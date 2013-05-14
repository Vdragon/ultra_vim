" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Backups and temp files
set backupdir=~/.vim/.backup
set directory=~/.vim/.tmp
set backup

" Persistent undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax enable
  set hlsearch
  set guifont=DejaVu_Sans_Mono_for_Powerline:h14
  colorscheme molokai
  highlight TrailSpace guibg=Magenta
  match TrailSpace /\s\+$/
endif

" ---------------
" Behaviors
" ---------------
set ruler          " show the cursor position all the time
set autoread       " automatically reload changes if detected
set wildmenu wildmode=list:longest,full  " turn on wild menu

" ---------------
" Searching
" ---------------
set ignorecase     " Case insensitive search
set smartcase      " Non-case sensitive search
set incsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2    " Delete everything with backspace
set shiftwidth=2   " Tabs under smart indent
set smarttab
set expandtab
set number         " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cursorline     " Highlight current line
let &colorcolumn=join(range(71,999),",")  " Set column ruler to 70

" ---------------
" Visual
" ---------------
set list listchars=tab:——,extends:»,precedes:«
