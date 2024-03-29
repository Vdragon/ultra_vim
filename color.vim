" Enable 256-color terminal
if !(&term=~'256color') && !has('gui_running')
  set term=xterm-256color
endif
set t_ut=  " Disable BCE (Background Color Erase) for xterm-256color

" Basic color support
if &t_Co >= 8 || has('gui_running')
  let g:term_color=1
endif

" Full color support
if &t_Co >= 256 || has('gui_running')
  let g:full_color=1
endif
