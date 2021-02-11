set nocompatible

" General Settings {{{

filetype indent plugin on
syntax on

set autoread
set backspace=indent,eol,start
set breakindent
set complete=.,w,b,u,t
set completeopt=menuone
set cursorline
set diffopt+=iwhite
set encoding=utf-8
set fillchars=""
set foldenable
set foldmethod=marker
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set formatoptions=cjrq
set hidden
set history=1000
set ignorecase
set incsearch
set laststatus=1
set lazyredraw
set list
set listchars=tab:→\ ,space:·,trail:·,nbsp:•,precedes:←,extends:→,eol:¶ "eol:¬
set mouse=a
set mousehide
set hlsearch
set nomodeline
set nostartofline
set number
set numberwidth=5
set relativenumber
set ruler
set scrolloff=5
set shellslash
set showcmd
set showmode
set smartcase
set spelllang=de,en
set synmaxcol=2048
set textwidth=72
set virtualedit=block
set visualbell t_vb=
set wildignore=*.o,*.class,*.toc,*.aux
set wildmenu

" Indentation
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=8

let &errorformat          = "%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat
let g:load_doxygen_syntax = 1
let g:tex_flavor          = 'latex'
let mapleader             = ','

" Only use swap file if dedicated directory is available
if isdirectory(expand('~/.vimtmp'))
    set directory=~/.vimtmp
elseif isdirectory(expand('~/_vimtmp'))
    set directory=~/_vimtmp
else
    set directory=
    set noswapfile
endif

if version >= 703
    set conceallevel=0
    let g:tex_conceal="adgm"
endif

" }}}
" Autocommands {{{

augroup VIMRC
    autocmd!
    autocmd BufEnter * :silent! lcd %:p:h " auto change directory
    autocmd BufRead,BufNewFile *.tex,*.txt,*.mkd setlocal spell
    autocmd BufRead,BufNewFile *.des set syntax=levdes
    autocmd GuiEnter * set visualbell t_vb=
    autocmd colorscheme * highlight clear CursorLine
augroup END

" }}}
" PlugIn Settings {{{

" GTAGS-CScope
let g:GtagsCscope_Absolute_Path     = 1
let g:GtagsCscope_Auto_Load         = 0
let g:GtagsCscope_Auto_Map          = 0
let g:GtagsCscope_Auto_Update_Gtags = 1
let g:GtagsCscope_Quiet             = 1

" Display CScope output in quickfix window.
set cscopequickfix=s-,c-,d-,i-,t-,e-
" Use CScope for default tag lookup.
set cscopetag

" CtrlP
let g:ctrlp_map               = '<c-e>'
let g:ctrlp_cmd               = 'CtrlP'
let g:ctrlp_working_path_mode = 1

" Lightline
let g:lightline = { 'colorscheme' : 'landscape' }
"let g:lightline = { 'colorscheme' : 'solarized' }

" Easy-Align
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif

let g:easy_align_delimiters['d'] = {
  \ 'pattern': ' \ze\S\+\s*[;=]',
  \ 'left_margin': 0, 'right_margin': 0
  \ }

" Supertab (invoke with ctrl-space)
let g:SuperTabMappingForward  = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" }}}
" (G)UI Settings {{{

" Gruvbox
let g:gruvbox_contrast_dark  = "hard"
let g:gruvbox_contrast_light = "hard"

" Jellybeans
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_overrides = {
            \ 'SpecialKey': { 'guibg': '' },
            \ 'NonText':    { 'guifg': '444444' },
            \}

if has("gui_running")
    set guicursor=n:blinkon0
    set guioptions=cem
    set showtabline=1

    if has("gui_win32")
        set guifont=Consolas:h10
    else
        set guifont="Deja Vu Sans Mono 10"
    endif

    colorscheme Notepad++
    " toggle between dark and light colorschemes
    "let g:wincmd_use_legacy_colors = 1
    "let g:thorstel_lightcolor      = "Notepad++"
    "let g:thorstel_darkcolor       = "wincmd"

    "let g:thorstel_darkbg = 0
    "set background=light
    "execute "colorscheme " . g:thorstel_lightcolor

    "nnoremap <silent> <F2> :call <SID>ToggleColorScheme()<CR>
else
    colo default
endif

" }}}
" Custom Commands / Functions {{{

" Compare current buffer with its unchanged state
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

" Close all buffers
command! -bang Bdall bufdo bd<bang>

" Set the arglist to the filenames currently referenced in the quickfix list
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
    " Building a hash ensures we get each buffer only once
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" Delete all trailings in the current buffer
command! WhiteSpaceCleanUp call <SID>DeleteTrailings()
function! <SID>DeleteTrailings()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" toggle between a light and a dark colorscheme
function! <SID>ToggleColorScheme()
    if (g:thorstel_darkbg == 1)
        set bg=light
        execute "colorscheme " . g:thorstel_lightcolor
        let g:thorstel_darkbg = 0
    else
        set bg=dark
        execute "colorscheme " . g:thorstel_darkcolor
        let g:thorstel_darkbg = 1
    endif
endfunction

" function for switching between relative and absolute line numbers
function! <SID>SwitchLineNumbers()
    if (&relativenumber == 1)
        set number
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

" Command for copying to the system clipboard in normal mode.
command! CopyToClipboard call <SID>CopyToClipboard()
function! <SID>CopyToClipboard()
    let l = line(".")
    let c = col(".")
    if mode() == 'n'
        normal! "+yiW
        echo "Copied \"" . getreg('+') . "\" to clipboard!"
    endif
    call cursor(l, c)
endfunction

" }}}
" Mappings {{{

" place cursor between braces / quotes
inoremap () ()<Left>
inoremap [] []<Left>
inoremap {} {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>

" curly brace completion
inoremap <silent> {<CR> <Esc>o{<CR>}<Esc>O

" emacs-style insert mode navigation
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <End>
inoremap <C-a> <Home>

" scroll with space
noremap <space> <C-d>
noremap <S-space> <C-u>

" Make ctrl-Backspace delete the previous word (console and gVim)
inoremap <C-h> <C-w>
inoremap <C-BS> <C-w>

" Invoke Easy-Align with tab
nmap <tab> <Plug>(EasyAlign)
xmap <tab> <Plug>(EasyAlign)

" always open file under cursor - even if it does not exist
map <silent> gf :e <cfile><CR>

" Go to the next/previous entry in the quickfix window
nnoremap <silent> <C-j> :cn<CR>
nnoremap <silent> <C-k> :cp<CR>

" Toggle settings
noremap <silent> <leader>h :nohlsearch<CR>
noremap <silent> <leader>s :set spell! <CR>
noremap <silent> <leader>w :set wrap!<CR>

" shortcut for editing the vimrc file
noremap <silent> <leader>v :e $MYVIMRC<CR>

" switch between current and alternate buffer
noremap <silent> <leader>a :b#<CR>

" close the current buffer
noremap <silent> <leader>d :bd<CR>

" switch between absolute and relative line numbers (only vim 7.3 and after)
if version >= 703
    nnoremap <silent> <leader>l :call <SID>SwitchLineNumbers()<CR>
else
    nnoremap <silent> <leader>l :set number!<CR>
endif

" format text with Q instead of gq
map <silent> Q gq

" spilt line at current position - opposite of J
nnoremap K i<CR><ESC>k$

" Y should copy from the current position to the end of line
nnoremap <silent> Y y$

" Use ctrl-c to copy to the system clipboard. In visual mode the current
" selection is copied. In normal mode, copy the whitespace-delimited
" word under the cursor.
vnoremap <silent> <C-c> "+y
nnoremap <silent> <C-c> :CopyToClipboard<CR>

" Paste from system clipboard with ctrl-v
vnoremap <silent> <C-v> "+p
nnoremap <silent> <C-v> o<Esc>:set paste<CR>"+p:set nopaste<CR>

" Invoke CtrlP
noremap <silent> <leader>b :CtrlPBuffer<CR>
noremap <silent> <leader>e :CtrlP<CR>
noremap <silent> <leader>t :CtrlPBufTag<CR>
noremap <silent> <leader>q :CtrlPQuickfix<CR>

" Use Ctrl-\ for the CScope reference lookup.
nnoremap <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>

" Invoke Cscope symbol lookup for the current cursor position
noremap gs :cs find s <C-R>=expand("<cword>")<CR><CR>

" Mirror the insert Time/Date of Notepad
nnoremap <F5> o<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
inoremap <F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
cnoremap <F5> <C-R>=strftime("%Y%m%d%H%M%S")<CR>

" For more consistency when tabbing back and forth.
nmap <F3> n
nmap <S-F3> N

" Set the search pattern to the word under the cursor and enable hlsearch.
nnoremap <silent> <C-h> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
inoremap <silent> <C-h> <C-O>:let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR><C-O>:set hls<CR>

" adjust very frequent mistakes
iab esle else
iab flase false
iab ture true
iab itme item
iab enld endl

" }}}

" local Vim Settings
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

" vim: fdm=marker
