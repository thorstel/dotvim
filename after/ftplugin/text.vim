setlocal linebreak
setlocal breakat-=*
setlocal wrap

setlocal display=lastline
setlocal nojoinspaces

" do not show colorcolumn when using this filetype, since lines are not being
" wrapped.
if version >= 703
  setlocal colorcolumn=
endif
