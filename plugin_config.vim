" ---------------
" Fugitive
" ---------------
nmap <Leader>gc :Gcommit -v<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gx :wincmd h<CR>:q<CR>

" ---------------
" Powerline
" ---------------
if &term ~= 'xterm-256color' || has("gui_running")
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
  set noshowmode
endif

" ---------------
" vim-markdown
" ---------------
let g:vim_markdown_folding_disabled=1

" ---------------
" Vundle
" ---------------
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bu :BundleInstall!<CR>
nmap <Leader>bc :BundleClean<CR>
