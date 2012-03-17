"
" =========================================
"  T H O R S T E L s   V I M R C - F I L E
" =========================================
"

"  Shortcut Overview
" ===================
"
" Arrow Keys
" ----------
"  right        -   next buffer
"  left         -   previous buffer
"  up           -   toggle Taglist-view
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
"  Ctrl-h       -   select window left to the current window
"  Ctrl-j       -   select window below the current window
"  Ctrl-k       -   select window above the current window
"  Ctrl-l       -   select window right to the current window
"  ,a           -   switch between active and alternate buffer
"  ,b           -   buffer-overview (LustyJuggler PlugIn - requires Ruby-Vim)
"  ,cr          -   compiles and runs the active c-file (gcc)
"  ,d           -   delete current buffer
"  ,h           -   turn off highlighting
"  ,jr          -   compiles ands runs the active java-file
"  ,ll          -   compiles the active latex-file
"  ,l<space>    -   align text around spaces (or - =)
"  ,m           -   maximize the window
"  ,n           -   restore the default window
"  ,q           -   open quickfix view
"  ,qc          -   close quickfix view
"  ,s           -   toggle spelling
"  ,t           -   delete trailings in this file
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

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" ==================
"  General Settings
" ==================

" don't force strict vi-compatibility
set nocompatible

" automatic file identification
filetype indent plugin on

" turn syntax-highlighting on
syntax on

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

" create backups and save them in the accordant folder
set backup
set backupdir=~/.vimbackup

" path for the vim intern 'find' command to search for files
if has("mac")
    set path+=~/Uni/**,~/LaTeX/**,~/Programmierung/Cpp/**,~/MaTA/**
endif

" allow switching buffers, even if the active buffer is not saved
set hidden

" size of the history-file
set history=1000

" I don't want to hear or see any 'bell' indications
set visualbell t_vb=

" statusline is always displayed - not only in split view
set laststatus=2

" statusline layout
set statusline=%#StatusLine#\ \|%#Folded#\ %02n\ %#StatusLine#\|
      \\ \"%f\"\ %#ErrorMsg#%w%r%m%#StatusLine#%=
      \\ [%{&filetype}\|%{&fileformat}\|%{&fileencoding}]
      \\ \ [L:%3l/%L,\ C:%2v]\ \ [%3b\|0x%-2B]

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

" real tabs are displayed with: ▸
" if there are trailings in the file the show up as: •
set listchars=tab:▸\ ,trail:• ",eol:¬
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

" 7.3 features
if version >= 703
  " in vim 7.3 persitant undo was added - creates very large undo-histories
  "set undofile
  "set undodir=~/.vimundo

  " turn on the conceal feature (for example replace latex code with the
  " accordant unicode-character)
  set conceallevel=2
  " conceal in LaTeX for accents, delimters, greek & math
  "let g:tex_conceal="adgm"
  let g:tex_conceal="adg"
endif

" =========================
"  Autocommands - Settings
" =========================

augroup VIMRC

  " clear all previous autocommands
  autocmd!

  " change directory according to the active file
  autocmd BufEnter * :silent! lcd %:p:h

  " always activate spelling in LaTeX, txt-Files and MDown-Files
  autocmd BufRead,BufNewFile *.tex,*.txt,*.mdown setlocal spell

  " always wrap text in LaTeX
  autocmd BufRead,BufNewFile *.tex,*.txt setlocal formatoptions+=t

  " don't make backups of files in my encrypted folders
  if has("mac")
      autocmd BufRead,BufNewFile /Volumes/NOT\ FOR\ YOU/** set nobackup
  else
      autocmd BufRead,BufNewFile /media/NOT\ FOR\ YOU/** set nobackup
  endif
  " XXX: only needed if persistent undo is active
  "autocmd BufRead,BufNewFile /Volumes/NOT\ FOR\ YOU/** setl noundofile

  " update ctags database in C++ if a header is changed
  autocmd BufWritePost *.h,*.hpp :silent! :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

  " do not show special characters in terminal view (PLUGIN!)
  autocmd FileType conque_term setl nolist

  " do not display standard statusline in taglist window
  autocmd FileType taglist setl statusline=Taglist

  " reload the vimrc file if changed
  autocmd BufWritePost vimrc.vim,.vimrc source $MYVIMRC

  " set compiler to javac for java-files
  autocmd Filetype java setl makeprg=javac\ %

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

  " set compilter for Markdown
  autocmd Filetype markdown setl makeprg=markdown\ %\ >%:t:r.html

augroup END

" ===================
"  PlugIn - Settings
" ===================

" Taglist
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Exist_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 30
" do not show every single variable in PHP
let tlist_php_settings = 'php;c:class;d:constant;f:function'

" file browsers width is 30 columns
let NERDTreeWinSize = 30
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
set tags+=~/.vimtags/commontags,~/.vimtags/stltags,~/.vimtags/qttags

" SuperTab Completion
" -------------------
" do not use standard <tab> to complete code, that is reserved for snipMate
" use ctrl-space completion insted (Eclipse-like)
let g:SuperTabMappingForward = '<C-Space>'

" ================
"  GUI - Settings
" ================

" my colorscheme
colo thorstel

if has("gui_running")
  " minimalistic GUI - I don't need no fancy buttons
  set guioptions=ac
  " only show tab-bar if more than one tab is present
  set showtabline=1
  " show line numbers
  set number
  " display line numbers with 5 digits
  set numberwidth=6
  " number of colums
  set co=105
  " highlight the line where the cursor is at
  set cursorline
  " columns from 80 shall be in a different color (vim 7.3 feature)
  if version >= 703
      set colorcolumn=81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292
  endif
  " maximize window vertically
  set lines=999
  " cursor only blinks in insert mode
  set gcr=n:blinkon0
endif

" ===========
"  Functions
" ===========

" delete all trailings in the active buffer
function! <SID>DeleteTrailings()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

" ==========
"  Mappings
" ==========

" place cursor between braces / quotes
inoremap () ()<Left>
inoremap [] []<Left>
inoremap {} {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
" LaTeX-Math
inoremap $$ $$<Left>

" curly brace completion like in eclipse
inoremap {<CR> {}<Left><CR><CR><Up><Tab>

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

" compile the active latex-file (latex-box PlugIn)
noremap <silent> <leader>ll :Latexmk<CR>

" call the DeleteTrailings() function
noremap <silent> <leader>t :call <SID>DeleteTrailings()<CR>

" turn off hlsearch
noremap <silent> <leader>h :noh<CR>

" toggle spell checking
noremap <silent> <leader>s :set spell! <CR>

" show all open buffers (LustyJuggler PlugIn)
noremap <silent> <leader>b :LustyJuggler<CR>

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

" open the pdf-equivalent to the active buffer.
" 'open' only works on Mac OS X - on linux it has to be replaced with
" gnome-open or an explicit pdf-viewer
map <silent> <C-p> :!open %:t:r.pdf<CR>

" show/hide the NERDTree filebrowser
map <silent> <down> :NERDTreeToggle<CR>

" toggle the Taglist-PlugIn view
map <silent> <up> :TlistToggle<CR>

" restore standard window layout
map <silent> <leader>n :NERDTreeClose<CR>:TlistClose<CR>:set co=105<CR>:set lines=999<CR>

" maximize the current window
map <silent> <leader>m :set co=999<CR> :set lines=999<CR>

" compile and run the active java-file
map <silent> <leader>jr :!javac % && java %:t:r<CR>

" compile and run the active c-file
map <silent> <leader>cr :!gcc -Wall -o %:t:r % && ./%:t:r<CR>

" go to the next buffer
map <silent> <right> :bn<CR>

" got to the previous buffer
map <silent> <left> :bp<CR>

" format text with Q instead of gq
map <silent> Q gq

" align text around <space> / = / : / -
map <silent> <leader>l<space> :Tab /\v\w\zs\s\ze\w<CR>
map <silent> <leader>l= :Tab /=<CR>
map <silent> <leader>l: :Tab /:\zs<CR>
map <silent> <leader>l- :Tab /-<CR>

" Y shall copy from the current position to the end of line
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
noremap <silent> <leader>ls :source ~/.vimtmp/latestSession<CR>

" adjust very frequent mistakes
iab esle else
iab flase false
iab ture true
iab itme item

" =============================
"  consider local Vim Settings
" =============================

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
