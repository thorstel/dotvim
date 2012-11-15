" ======================
"  ThorsteLs Vimrc-File
" ======================
"
" Shortcut Overview
" =================
"
" Arrow Keys
" ----------
"  right        -   next buffer
"  left         -   previous buffer
"  up           -   toggle Tagbar-view
"  down         -   toggle NERDTree-Explorer
"
" Insert Mode
" -----------
"  Ctrl-a       -   jump to the beginning of line
"  Ctrl-e       -   jump to the end of line
"  Ctrl-f       -   one character forward
"  Ctrl-b       -   one character backward
"  Ctrl-Space   -   code completion
"  Shift-Enter  -   ESC
"  Ctrl-Enter   -   ESC
"
" Normal Mode
" -----------
"  Space        -   scroll down half a page
"  Shift-Space  -   scroll up half a page
"  Tab          -   invoke Tabularize Plugin
"  Ctrl-b       -   invoke EasyMotion goto character in backward direction
"  Ctrl-f       -   invoke EasyMotion goto character in foreward direction
"  Ctrl-h       -   select window left to the current window
"  Ctrl-j       -   select window below the current window
"  Ctrl-k       -   select window above the current window
"  Ctrl-l       -   select window right to the current window
"  Ctrl-e       -   open CtrlP Path explorer
"  ,a           -   switch between active and alternate buffer
"  ,b           -   open CtrlP Buffer explorer
"  ,cr          -   compiles and runs the active c-file (gcc)
"  ,d           -   delete current buffer
"  ,e           -   open CtrlP Path explorer
"  ,h           -   turn off highlighting
"  ,jr          -   compiles ands runs the active java-file
"  ,l           -   switch between relative and absolute line number display
"  ,m           -   maximize the window
"  ,n           -   restore the default window
"  ,q           -   open quickfix view
"  ,qc          -   close quickfix view
"  ,s           -   toggle spelling
"  ,sl          -   load vim session from default file
"  ,sr          -   compile and run the active scala file
"  ,ss          -   save current vim session to default file
"  ,t           -   delete trailing whitespaces manually
"  ,u           -   open view for the Gundo PlugIn
"  ,v           -   open the vimrc file
"  ,w           -   toggle line wrapping at window-borders
"  Q            -   reformat the text (shortcut for gq)
"  Ctrl-p       -   open pdf-equivalent to the active buffer
"  Ctrl-F10     -   create tag-database of the current location
"  Ctrl-F11     -   remove 10 columns from the window
"  Ctrl-F12     -   add 10 columns to the window
"
" Mac OS X only
" -------------
"  Cmd-0..9     -   select Tab no. 0 to 9
"  Cmd-i        -   shortcut for ci -l of the active buffer (RCS)
"  Cmd-k        -   move selected text up
"  Cmd-j        -   move selected text down
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" don't force strict vi-compatibility
set nocompatible

" enable Pathogen PlugIn-Manager
call pathogen#infect()

" *** General Settings *** {{{

" automatic file identification
filetype indent plugin on

" turn syntax-highlighting on
syntax on
" stop coloring very long lines
set synmaxcol=512

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

" cursor can be placed everywhere on the screen, even if there are no
" characters
set virtualedit=all

" directory for the vim swap-files
set directory=~/.vimtmp

" allow switching buffers, even if the active buffer is not saved
set hidden

" size of the history-file
set history=1000

" I don't want to hear or see any 'bell' indications
set visualbell t_vb=

" statusline is always displayed - not only in split view
set laststatus=2

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

" two lines for the command line
set cmdheight=2

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

  " turn on the conceal feature (for example replace latex code with the
  " accordant unicode-character)
  set conceallevel=2
  " conceal in LaTeX for accents, delimters, greek & math
  let g:tex_conceal="adgm"
  "let g:tex_conceal="adg"
endif

" }}}
" *** Autocommands *** {{{

augroup VIMRC

  " clear all previous autocommands
  autocmd!

  " change directory according to the active file
  autocmd BufEnter * :silent! lcd %:p:h

  " always activate spelling in LaTeX, txt-Files and MDown-Files
  autocmd BufRead,BufNewFile *.tex,*.txt,*.mkd setlocal spell

  " always wrap text in LaTeX
  autocmd BufRead,BufNewFile *.tex,*.txt,*.mkd setlocal formatoptions+=t

  " update ctags database in C++ if a header is changed
  autocmd BufWritePost *.h,*.hpp :silent! :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

  " do not show special characters in terminal view (PLUGIN!)
  autocmd FileType conque_term setl nolist

  " reload the vimrc file if changed
  autocmd BufWritePost vimrc.vim,.vimrc source $MYVIMRC

  " set compiler to javac for java-files
  autocmd Filetype java setl makeprg=javac\ %

  " set compiler to scalac for scala-files
  autocmd Filetype scala setl makeprg=scalac\ %

  " set compiler to gcc for c-files
  autocmd Filetype c setl makeprg=gcc\ -Wall\ -o\ %:t:r\ %

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
  autocmd Filetype pandoc setl makeprg=pandoc\ -s\ -c\ pandoc-stylesheet.css\ %\ -o\ %:t:r.html
  autocmd Filetype pandoc setl ts=4 sts=4 sw=4
  " automatically compile Pandoc files after saving
  autocmd! BufWritePost * if &ft == 'pandoc' | silent make | endif

augroup END

" }}}
" *** PlugIn - Settings *** {{{

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

" Powerline
" ---------
let g:Powerline_theme = 'default'
let g:Powerline_colorscheme = 'default'

" Syntastic
" ---------
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': [] }

" }}}
" *** UI / GUI - Settings *** {{{

" show line numbers
set number
" display line numbers with 5 digits
set numberwidth=5

" colorscheme setup
let g:solarized_visibility="low"
let g:solarized_contrast="normal"
" I like the degraded color palette of solarized better
let g:solarized_degrade=1
set background=dark
colo solarized

" columns from 80 shall be in a different color (vim 7.3 feature)
if version >= 703
    set colorcolumn=81,82,83,84,85
endif

" do not highlight the line where the cursor is at
set nocursorline

if has("gui_running")
  " minimalistic GUI - I don't need no fancy buttons
  set guioptions=ac
  " only show tabline if more than one tab page is present
  set showtabline=1
  " number of colums
  set co=90
  " total number of lines of the window (statusline and command line included!)
  set lines=53
  " cursor only blinks in insert mode
  set gcr=n:blinkon0
  " favorite font for coding so far
  "set guifont=Anonymous\ Pro:h12
  " patched Anonymous Pro font for Powerline Plugin
  set guifont=Anonymous\ Pro\ for\ Powerline:h12
  " enable status line decorations in gui vim
  let g:Powerline_symbols = 'fancy'
endif

" }}}
" *** Custom Functions *** {{{

" delete all trailings in the active buffer
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
let g:thorstel_darkbg=1
function! <SID>ToggleColorScheme()
  if (g:thorstel_darkbg == 1)
    set bg=light
    colo github
    let g:thorstel_darkbg = 0
  else
    set bg=dark
    colo solarized
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
  set lines=53
endfunction

" }}}
" *** Mappings *** {{{

" place cursor between braces / quotes
inoremap () ()<Left>
inoremap [] []<Left>
inoremap {} {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
" LaTeX-Math
inoremap $$ $$<Left>

" curly brace completion like in eclipse
inoremap <silent> {<CR> <Esc>:call <SID>PlaceCurlyBraces()<CR>$i<CR><CR><Up><Tab>

" place ; always at the end of a line in insert mode
inoremap ; <End>;

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

" window navigation in normal mode
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

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

" change tabs firefox style with command-0..9 (Mac only)
if has("mac")
  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt
  map <D-0> :tablast<CR>
endif

" always open file under cursor - even if it does not exist
map <silent> gf :e <cfile><CR>

" turn off hlsearch
noremap <silent> <leader>h :noh<CR>

" toggle spell checking
noremap <silent> <leader>s :set spell! <CR>

" shortcut for editing the vimrc file
noremap <silent> <leader>v :e ~/.vimrc<CR>

" switch between active and alternate buffer
noremap <silent> <leader>a :b#<CR>

" open Gundo-PlugIn view
noremap <silent> <leader>u :GundoToggle<CR>

" close the active buffer
noremap <silent> <leader>d :bd<CR>

" toggle line wrapping
noremap <silent> <leader>w :set wrap!<CR>

" RCS checkin of current file on Mac OS X
if has("mac")
    map <silent> <D-i> :!ci -l % <CR>
endif

" switch between absolute and relative line numbers (only vim 7.3 and after)
if version >= 703
  nnoremap <silent> <leader>l :call <SID>SwitchLineNumbers()<CR>
else
  nnoremap <silent> <leader>l :set number!<CR>
endif

" open the pdf-equivalent to the active buffer.
" 'open' only works on Mac OS X - on linux it has to be replaced with
" gnome-open or an explicit pdf-viewer
map <silent> <C-p> :!open -a skim %:t:r.pdf<CR>

" show/hide the NERDTree filebrowser
map <silent> <down> :NERDTreeToggle<CR>

" toggle the Tagbar-PlugIn view
map <silent> <up> :TagbarToggle<CR>

" restore standard window layout
map <silent> <leader>n :call <SID>DefaultWindow()<CR>

" delete trailing whitespaces manually
nmap <silent> <leader>t :call <SID>DeleteTrailings()<CR>

" maximize the current window
map <silent> <leader>m :set co=181<CR>

" compile and run the active java-file
map <silent> <leader>jr :!javac % && java %:t:r<CR>

" compile and run the active c-file
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
nmap <tab> :Tab /
vmap <tab> :Tab /

" Y should copy from the current position to the end of line
noremap <silent> Y y$

" scale the window up / down by 10 columns
noremap <silent> <C-F12> :set co+=10<CR>
noremap <silent> <C-F11> :set co-=10<CR>

" create ctags database of current location
map <silent> <C-F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" move marked text up / down by holding the command key (OS X only)
if has("mac")
  vmap <silent> <D-k> [egv
  vmap <silent> <D-j> ]egv
endif

" open / close the quickfix view
map <silent> <leader>q :copen<CR>
map <silent> <leader>qc :cclose<CR>

" save and restore vim Sessions
noremap <silent> <leader>ss :mksession! ~/.vimtmp/latestSession<CR>:echo "Session saved!"<CR>
noremap <silent> <leader>sl :source ~/.vimtmp/latestSession<CR>

" toggle solarized background color
"call togglebg#map("<F5>")
" toggle between favorite dark and light colorschemes
nnoremap <silent> <F5> :call <SID>ToggleColorScheme()<CR>

" call CtrlP buffer explorer
noremap <silent> <leader>b :CtrlPBuffer<CR>
" call CtrlP file explorer
noremap <silent> <leader>e :CtrlP<CR>

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
