" Enable 256-color terminal
if !(&term=~'256color') && !has('gui_running')
  set term=xterm-256color
  set t_ut=          " Disable BCE (Background Color Erase)
endif

" Enable color support
if &t_Co >= 8 || has('gui_running')
  let g:color=1
endif
