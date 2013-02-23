setlocal formatoptions=1
setlocal linebreak
setlocal breakat-=*
setlocal wrap
setlocal nolist

nnoremap <buffer> j gj
nnoremap <buffer> k gk
vnoremap <buffer> j gj
vnoremap <buffer> k gk

nnoremap <buffer> 0 g0
nnoremap <buffer> ^ g^
nnoremap <buffer> $ g$
vnoremap <buffer> 0 g0
vnoremap <buffer> ^ g^
vnoremap <buffer> $ g$

setlocal display=lastline
setlocal nojoinspaces

" do not show colorcolumn when using this filetype, since lines are not being
" wrapped.
if version >= 703
  setlocal colorcolumn=
endif
