" don't force strict vi-compatibility
set nocompatible

" enable Pathogen PlugIn-Manager
call pathogen#infect()

" General Settings {{{

" automatic file identification
filetype indent plugin on

" turn syntax-highlighting on
syntax on
" stop coloring very long lines
set synmaxcol=2048

" set backspace behaviour. Should be default anyway - just in case it is not
set backspace=indent,eol,start

" special syntax-highlighting for Doxygen-comments
let g:load_doxygen_syntax=1

" is needed for applying latex-rules on newly created files
let g:tex_flavor='latex'

" set errorformat so it can differ between real errors and warnings
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

" self-explanatory - prefer unix over dos over mac formats
set fileformats=unix,dos,mac

" use unicode
set encoding=utf-8

" automatic smart indenting is set
set autoindent
set smartindent

" if a file is changed outside of vim, reload it automatically
set autoread

" allow placing the cursor at arbitrary positions on the screen in visual
" block mode
set virtualedit=block

" retain the current cursor postion when making jumps
set nostartofline

" directory for the vim swap-files
if isdirectory(expand('~/.vimtmp'))
  set directory=~/.vimtmp
else
  set directory=
  set noswapfile
endif

" allow switching buffers, even if the current buffer is not saved
set hidden

" size of the history-file
set history=1000

" I don't want to hear or see any 'bell' indications
set visualbell t_vb=

" statusline is only displayed when more than one window exists
set laststatus=1

" statusline layout (without powerline)
"set statusline=%#StatusLine#\ \|%#Folded#\ %02n\ %#StatusLine#\|
      "\\ \"%f\"\ %#ErrorMsg#%w%r%m%#StatusLine#%=
      "\\ [%{&filetype}\|%{&fileformat}\|%{&fileencoding}]
      "\\ \ [L:%3l/%L,\ C:%2v]\ \ [%3b\|0x%-2B]

" directory paths always use forward-slashes, even on windows
set shellslash

" wrap text after 78 characters
set textwidth=78
" always wrap text in comments
set formatoptions=crq

" Do not use the internal formatter
set formatexpr=

" Use par for formatting plaintext
set formatprg=par\ 72j

" show current position of the cursor
set ruler

" show which mode I'm in
set showmode

" show the current command on the bottom right corner
set showcmd

" activate mouse
set mouse=a
" hide the mouse-cursor while using the keyboard
set mousehide

" scroll text 5 lines before the cursor hits the bottom/top of the window
set scrolloff=5

" don't redraw the screen while using a macro
set lazyredraw

" code indentation of 2 spaces - do not use real tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

" preserve indent for wrapped lines
set breakindent

" show tabs and trailing spaces
set listchars=tab:»\ ,trail:· ",eol:¬
set list

" highlight search results
set hlsearch
" interactive search while typing
set incsearch
" usually use ignorecase while search except when capital letters are used
set ignorecase
set smartcase

" code folding via standard markers
set foldmethod=marker
" fold code automatically
set foldenable
" open fold, if one of these commands is used within a closed fold
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" use wildmenu for command completion and ignore certain files-endings
set wildmenu
set wildignore=*.o,*.class,*.toc,*.aux

" don't use any characters in the window-separators
set fillchars=""

" ignore whitespaces in diff-mode
set diffopt+=iwhite

" use german and english for spell checking
set spelllang=de,en

" custom mappings begin with ,
let mapleader=','

" do not scan included files for completion (removed 'i'-option)
set complete=.,w,b,u,t

" 7.3 features
if version >= 703
  " in vim 7.3 persitant undo was added - creates very large undo-histories
  "set undofile
  "set undodir=~/.vimundo

  " turn off the conceal feature (for example replace latex code with the
  " accordant unicode-character)
  set conceallevel=0
  " conceal in LaTeX for accents, delimters, greek & math
  let g:tex_conceal="adgm"
  "let g:tex_conceal="adg"
endif

" }}}
" Autocommands {{{

augroup VIMRC

  " clear all previous autocommands
  autocmd!

  " change directory according to the current file
  autocmd BufEnter * :silent! lcd %:p:h

  " always activate spelling in LaTeX, txt-Files and MDown-Files
  autocmd BufRead,BufNewFile *.tex,*.txt,*.mkd setlocal spell

  " update ctags database in C++ if a header is changed
  autocmd BufWritePost *.h,*.hpp :silent! :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

  " do not show special characters in terminal view (PLUGIN!)
  autocmd FileType conque_term setl nolist

  " set compiler to javac for java-files
  autocmd Filetype java setl makeprg=javac\ %

  " set compiler to scalac for scala-files
  autocmd Filetype scala setl makeprg=scalac\ %

  " set compiler to gcc for c-files
  autocmd Filetype c setl makeprg=make

  autocmd BufRead,BufNewFile *.des set syntax=levdes

  " set compiler to ghc for haskell
  autocmd Filetype haskell setl makeprg=ghc\ -Wall\ -O3\ \ -o\ %:t:r\ %

  " set compiler to pdflatex for LaTeX-Code
  autocmd Filetype tex setl makeprg=pdflatex\ %

  " java code-completion with javacomplete-PlugIn
  autocmd Filetype java setl omnifunc=javacomplete#Complete

  " visualbell has to be silenced again if a GUI is entered
  autocmd GuiEnter * set visualbell t_vb=

  " make the current file executable if it's a shellscript
  autocmd BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile> | endif | endif

  " set compiler for graphviz dot
  autocmd Filetype dot setl makeprg=dot\ -Tpdf\ %\ >%:t:r.pdf
  "autocmd Filetype dot setl makeprg=neato\ -Tpdf\ %\ >%:t:r.pdf

  " remove trailing characters before saving a file
  autocmd BufWritePre * call <SID>DeleteTrailings()

  " settings for pandoc markdown
  autocmd Filetype pandoc setl makeprg=pandoc\ -s\ %\ -o\ %:t:r.html
  autocmd Filetype pandoc setl ts=4 sts=4 sw=4
  " automatically compile Pandoc files after saving
  autocmd! BufWritePost * if &ft == 'pandoc' | silent make | endif

augroup END

" }}}
" PlugIn Settings {{{

" file browsers width is 40 columns
let NERDTreeWinSize = 40
" always display bookmarks
let NERDTreeShowBookmarks=0

" no preview window for cppcomplete
set completeopt=menuone
" select first match for code completion but don't replace before confirmed
let OmniCpp_SelectFirstItem = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
" tag-databases for system / C++ STL / QT-Lib
"set tags+=~/.vimtags/commontags,~/.vimtags/stltags,~/.vimtags/qttags

" SuperTab Completion
" -------------------
" do not use standard <tab> to complete code, that is reserved for snipMate
" use ctrl-space completion insted (Eclipse-like)
let g:SuperTabMappingForward = '<C-Space>'

" EasyMotion
" ----------
" all EasyMotion commands are triggered with double pressing leader key
let g:EasyMotion_leader_key = '<leader><leader>'

" CtrlP
" -----
" CtrlP Plugin is invoked with ctrl-e
let g:ctrlp_map = '<c-e>'
let g:ctrlp_cmd = 'CtrlP'
" work with dircetory of current file
let g:ctrlp_working_path_mode = 1
" do not rebuild cache every time called the first time after start up
"let g:ctrlp_clear_cache_on_exit = 0

" Lightline
" ---------

let g:lightline = {
  \ 'colorscheme' : 'Tomorrow'
  \ }

" Org Mode
" --------
let g:ft_ignore_pat = '\.org'
" and then put these lines in vimrc somewhere after the line above
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

let g:org_todo_setup='TODO | DONE'
let g:org_command_for_emacsclient = 'emacsclient'


" }}}
" (G)UI Settings {{{

" show line numbers
set number
" display line numbers with 5 digits
set numberwidth=5

" colorscheme setup
colo badwolf

" hightlight the current line of the cursor
set cursorline

if has("gui_running")
  colo github

  " columns from 80 shall be in a different color (vim 7.3 feature)
  "if version >= 703
    "set colorcolumn=81,82,83,84,85,86,87,88,89,90
  "endif

  " minimalistic GUI - I don't need no fancy buttons
  set guioptions=acm
  " only show tabline if more than one tab page is present
  set showtabline=1
  " number of colums
  set co=90
  " total number of lines of the window (statusline and command line included!)
  set lines=56
  " cursor only blinks in insert mode
  set gcr=n:blinkon0
  " favorite font for coding so far
  if has("gui_win32")
    set guifont=Consolas:h10
    set guioptions+=r
  else
    set guifont=Deja\ Vu\ Sans\ Mono\ 13
  endif
endif

" }}}
" Custom Commands / Functions {{{

" compare current buffer with its unchanged state
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

" save and restore vim Sessions
command SaveSession mksession! ~/.vimtmp/latestSession | echo "Session saved!"
command LoadSession source ~/.vimtmp/latestSession

" set the arglist to the filenames currently referenced in the quickfix list
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" delete all trailings in the current buffer
function! <SID>DeleteTrailings()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

" places {} at the end of the line
function! <SID>PlaceCurlyBraces()
  s/\s*$/ {}
endfunction

" toggle between a light and a dark colorscheme
let g:thorstel_darkbg=0
function! <SID>ToggleColorScheme()
  if (g:thorstel_darkbg == 1)
    set bg=light
    colo github
    let g:thorstel_darkbg = 0
  else
    set bg=dark
    colo badwolf
    let g:thorstel_darkbg = 1
  endif
endfunction

" function for switching between relative and absolute line numbers
function! <SID>SwitchLineNumbers()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunction

" restores the default window settings. call with <leader>n
function! <SID>DefaultWindow()
  NERDTreeClose
  TagbarClose
  set co=90
  set lines=56
endfunction

let g:thorstel_qwertz = 0
function! <SID>ToggleQWERTZLayout()
  if (g:thorstel_qwertz == 0)
    inoremap ; ö
    inoremap : Ö
    inoremap ' ä
    inoremap " Ä
    inoremap [ ü
    inoremap { Ü
    inoremap < ;
    inoremap > :
    inoremap z y
    inoremap y z
    inoremap Z Y
    inoremap Y Z
    inoremap - ß
    let g:thorstel_qwertz = 1
  else
    iunmap ;
    iunmap :
    iunmap '
    iunmap "
    iunmap [
    iunmap {
    iunmap <
    iunmap >
    iunmap z
    iunmap y
    iunmap Z
    iunmap Y
    iunmap -
    let g:thorstel_qwertz = 0
  endif
endfunction

" }}}
" Mappings {{{

" place cursor between braces / quotes
inoremap () ()<Left>
inoremap [] []<Left>
inoremap {} {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
" LaTeX-Math
inoremap $$ $$<Left>

" curly brace completion like in eclipse
"inoremap <silent> {<CR> <Esc>o<Esc>:call <SID>PlaceCurlyBraces()<CR>$i<CR><CR><Up><Tab>
inoremap <silent> {<CR> <Esc>o{<CR>}<Esc>O

noremap <silent> <C-l> :call <SID>ToggleQWERTZLayout()<CR>
inoremap <silent> <C-l> <Esc>:call <SID>ToggleQWERTZLayout()<CR>a

" emacs-like insert mode navigation
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <End>
inoremap <C-a> <Home>

" alternatives for the escape button
noremap <C-CR> <ESC>
noremap <S-CR> <ESC>
inoremap <C-CR> <ESC>
inoremap <S-CR> <ESC>

" scroll in normal mode with space
noremap <space> <C-d>
noremap <S-space> <C-u>

" center around line with current search result
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" make the Easymotion goto-character-function more accessible
nnoremap <C-f> :call EasyMotion#F(0,0)<CR>
nnoremap <C-b> :call EasyMotion#F(0,1)<CR>

" always open file under cursor - even if it does not exist
map <silent> gf :e <cfile><CR>

" turn off hlsearch
noremap <silent> <leader>h :noh<CR>

" toggle spell checking
noremap <silent> <leader>s :set spell! <CR>

" shortcut for editing the vimrc file
noremap <silent> <leader>v :e $MYVIMRC<CR>

" switch between current and alternate buffer
noremap <silent> <leader>a :b#<CR>

" open Gundo-PlugIn view
noremap <silent> <leader>u :GundoToggle<CR>

" close the current buffer
noremap <silent> <leader>d :bd<CR>

" toggle line wrapping
noremap <silent> <leader>w :set wrap!<CR>

" switch between absolute and relative line numbers (only vim 7.3 and after)
if version >= 703
  nnoremap <silent> <leader>l :call <SID>SwitchLineNumbers()<CR>
else
  nnoremap <silent> <leader>l :set number!<CR>
endif

" show/hide the NERDTree filebrowser
map <silent> <down> :NERDTreeToggle<CR>

" toggle the Tagbar-PlugIn view
map <silent> <up> :TagbarToggle<CR>

" restore standard window layout
map <silent> <leader>n :call <SID>DefaultWindow()<CR>

" delete trailing whitespaces manually
"nmap <silent> <leader>t :call <SID>DeleteTrailings()<CR>

" maximize the current window
map <silent> <leader>m :set co=181<CR>

" compile and run the current java-file
map <silent> <leader>jr :!javac % && java %:t:r<CR>

" compile and run the current c-file
map <silent> <leader>cr :!gcc -Wall -o %:t:r % && ./%:t:r<CR>

map <silent> <leader>sr :!scalac % && scala %:t:r<CR>

" go to the next buffer
map <silent> <right> :bn<CR>

" got to the previous buffer
map <silent> <left> :bp<CR>

" format text with Q instead of gq
map <silent> Q gq

" spilt line at current position - opposite of J
nnoremap K i<CR><ESC>k$

" align text with Tabularize
nmap <tab> :Tabularize /
vmap <tab> :Tabularize /

" Y should copy from the current position to the end of line
nnoremap <silent> Y y$

" Y yanks to the clipboard in visual mode
vnoremap <silent> Y "+y
vnoremap <silent> <C-c> "+y

" Paste from system clipboard with ctrl-p
nnoremap <silent> <C-p> o<Esc>"+p

" scale the window up / down by 10 columns
noremap <silent> <C-F12> :set co+=10<CR>
noremap <silent> <C-F11> :set co-=10<CR>

" create ctags database of current location
map <silent> <C-F10> :!ctags -R .<CR>

" open / close the quickfix view
map <silent> <leader>q :copen<CR>
map <silent> <leader>qc :cclose<CR>

" toggle background color
"call togglebg#map("<F5>")
" toggle between favorite dark and light colorschemes
nnoremap <silent> <F2> :call <SID>ToggleColorScheme()<CR>

nnoremap <F5> :make<CR>

" call CtrlP buffer explorer
noremap <silent> <leader>b :CtrlPBuffer<CR>
" call CtrlP file explorer
noremap <silent> <leader>e :CtrlP<CR>
" call CtrlP tag explorer
noremap <silent> <leader>t :CtrlPBufTag<CR>

" adjust very frequent mistakes
iab esle else
iab flase false
iab ture true
iab itme item

" }}}

"  consider local Vim Settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" vim: fdm=marker
