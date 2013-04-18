" ----------------------------------------
" Auto Commands
" ----------------------------------------
if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line ("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
