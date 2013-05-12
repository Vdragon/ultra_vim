" ---------------
" Powerline
" ---------------
if exists('python_support') && exists('full_color')
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13
  set noshowmode
endif

" ---------------
" vim-markdown
" ---------------
let g:vim_markdown_folding_disabled=1
