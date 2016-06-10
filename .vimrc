set nocompatible                    " We want the latest Vim settings.
set hidden                          " Switch between buffers without having to save first.

set autoread                        " Set to auto read when a file is changed from the outside.

so ~/dotfiles/plugins.vim           "Source the plugins file.

syntax enable                       " Enable syntax highlighting.


set encoding=utf-8

" Map the leader key to comma, default is \
let mapleader=','
let g:mapleader=','
nmap <Space> <Leader>

set number                          " Activate line numbers.
set linespace=1                     " Set vertical line spacing.
set so=7                            " Set 7 lines to the cursor(above and bellow) - when moving vertically using j/k

set ruler                           " Always show current position

"set colorcolumn=90

set backspace=indent,eol,start      " Make backspace behave like other editors

set cmdheight=1                     " Height of the command bar

set wildmenu                        " Activate the wild menu

"----------------------------------------------------------------------------------------
" Gui specific settings
"----------------------------------------------------------------------------------------

"au GUIEnter * simalt ~x                    " Start gVim maximized.

set noeb vb t_vb=                           " No beeping sounds.

set guiheadroom=0                           " Stop the ugly white line at the bottom from showing up after sourcing the .vimrc file 

set background=dark
colorscheme gruvbox                         " Set colorscheme

" Custom matching parenteses highlights
"hi  MatchParen                              cterm=NONE  ctermfg=1  ctermbg=10  guifg=#2E334A  guibg=#586E75  gui=NONE

set t_CO=256                                " Set terminal colors to 256. 

"Use ':set guifont=* to select a new font
"Then use 'set guifont?' to check the correct font name and set it here
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 16

set guioptions-=l                   " Remove left-hand scrollbar
set guioptions-=L                   " Remove left-hand scrollbar when split
set guioptions-=r                   " Remove right-hand scrollbar
set guioptions-=R                   " Remove right-hand scrollbar when split
set guioptions-=m                   " Remove the menu
set guioptions-=T                   " Remove the toolbar
set guioptions-=e

set showmatch                       " Show matching brackets when text indicator is over them

set mat=2                           " How many tenths of a second to blink when matching brackets

"----------------------------------------------------------------------------------------
" Files/Backups/Undo
"----------------------------------------------------------------------------------------
" Turn backup off
set nobackup
set nowb
set noswapfile

set laststatus=2                    " Always show the status line



"----------------------------------------------------------------------------------------
" Text/Indent options
"----------------------------------------------------------------------------------------

" Use spaces instead of tabs
"===========================
set expandtab

" Be smart when using tabs
"=========================
set smarttab

" 1 tab == 4 spaces
"==================
set shiftwidth=4
set tabstop=4

set ai		        " Auto indent
set si		        " Smart indent
set wrap	        " Wrap lines

" Make wrapping lines break at the appropriate indent level
"==========================================================
set breakindent



"----------------------------------------------------------------------------------------
" Search
"----------------------------------------------------------------------------------------

" Activate the search results highlighting. Note: must be disabled afterwards
"============================================================================
set hlsearch

" Activate incremental search highlighting
"=========================================
set incsearch

" Ignore case when searching
"===========================
set ignorecase

" When searching try to be smart about cases
"===========================================
set smartcase


if executable('ag')
    " Use ag over grep
    "=================
    set grepprg=ag
    let g:grep_cmd_opts = '--line-numbers --noheading'

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    "==========================================================================
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    "===================================================
    let g:ctrlp_use_caching = 0
endif



"----------------------------------------------------------------------------------------
" Split Management
"----------------------------------------------------------------------------------------
set splitbelow
set splitright

" Better movement for split windows.
"===================================
nnoremap <down>     <C-W><C-J>
nnoremap <up>       <C-W><C-K>
nnoremap <left>     <C-W><C-H>
nnoremap <right>    <C-W><C-L>

nnoremap <C-down>   <C-W>-
nnoremap <C-up>     <C-W>+
nnoremap <C-left>   <C-W>>
nnoremap <C-right>  <C-W><







"----------------------------------------------------------------------------------------
" Mappings/Bindings
"----------------------------------------------------------------------------------------

" Map Leader + q to execute the recording in the q register
" =========================================================
nnoremap <Leader>q @q

" Map ; to enter command mode
"============================
nnoremap ; :

" Map jj to enter normal mode from insert mode
"=============================================
inoremap jj <esc>

" Map Leader+w to save file, awesome!
"====================================
nnoremap <Leader>w :w<cr>

" Map Leader+p paste from clipboard and Leader+y yank to clipboard
"=================================================================
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+yy

" Map Y so it yanks till the end of line w/o EOL like y$, 
" default is to yank the whole line, use yy to yank whole line with EOL
"======================================================================
nnoremap Y y$

" Yank whole buffer to clipboard
" NOTE: set mark with mm then go to top with gg,
" yank to clipboard with "+y and G then return to previous position with `m
"==========================================================================
nnoremap <Leader>ya mmgg"+yG`m



" Map leader+e+v to open a new buffer with the Vimrc file so it's easier to edit.
"================================================================================
nnoremap <Leader>ev :e ~/.vimrc<cr>

"Edit vim plugins file
"=====================
nnoremap <Leader>ep :e ~/dotfiles/plugins.vim<cr>

"Edit tmux config file
"====================
nnoremap <Leader>et :e ~/dotfiles/.tmux.conf<cr>

" Previous and next buffers
"==========================
nnoremap <c-l> :bnext<cr>
nnoremap <c-h> :bprevious<cr>

" Map leader+t+m open the current buffer in a new tab
"====================================================
nnoremap <Leader>tm <C-W>s <C-W>T

" Map leader+space to disable the search highlight.
"==================================================
nnoremap <Leader><space> :nohlsearch<cr>


" Specify the behavior when switching between buffers 
"====================================================
try
  set switchbuf=useopen,usetab
  set stal=2
catch
endtry

" Move a line of text using ALT+[jk] or Command+[jk] on mac
"=========================================================
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
"===========================================================================
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()






"----------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------

" NERDTree
"~~~~~~~~~
"let NERDTreeHijackNetrw = 0
" Make NERDTree easier to toggle.
"nmap <Leader>nt :NERDTreeToggle<cr>

" ~~~ Supertab ~~~
"~~~~~~~~~~~~~~~~~~
let g:SuperTabDefaultCompletionType = "context"

" ~~~ CtrlP ~~~
"~~~~~~~~~~~~~~~
" CtrlP custom ignore.
"=====================
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'

" CtrlP positioning.
"===================
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" Make Leader+r search tags/methods/symbols in buffer.
"=====================================================
nmap <Leader>r :CtrlPBufTag<cr>

" Map Leader+e open the most recently used files.
"================================================
nmap <Leader>e :CtrlPMRUFiles<cr>


" ~~~ PHP Documentator for Vim ~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>


" ~~~ Emmet ~~~
"~~~~~~~~~~~~~~~

" Remap Emmet leader to Ctrl+E
"=============================
let g:user_emmet_leader_key='<c-E>'


" ~~~ Startify ~~~
"~~~~~~~~~~~~~~~~~~

" Set startify bookmarks
"=======================
let g:startify_bookmarks = [ {'p': '~/Projects'} ]
let g:startify_custom_header = [
            \'        ________ ++     ________',
            \'       /VVVVVVVV\++++  /VVVVVVVV\\',
            \'       \VVVVVVVV/++++++\VVVVVVVV/',
            \'        |VVVVVV|++++++++/VVVVV/',
            \'        |VVVVVV|++++++/VVVVV/',
            \'       +|VVVVVV|++++/VVVVV/+',
            \'     +++|VVVVVV|++/VVVVV/+++++',
            \'   +++++|VVVVVV|/VVVVV/+++++++++',
            \'     +++|VVVVVVVVVVV/+++++++++',
            \'       +|VVVVVVVVV/+++++++++',
            \'        |VVVVVVV/+++++++++',
            \'        |VVVVV/+++++++++',
            \'        |VVV/+++++++++',
            \'        \V/   ++++++',
            \'                 ++',]


" ~~~ Vim Indent Guides ~~~
"~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:indent_guides_guide_size = 1
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2


" ~~~ Airline ~~~
"~~~~~~~~~~~~~~~~~`

"Fix the airline bar not showing special chars
"=============================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1




"----------------------------------------------------------------------------------------
" Auto-Commands
"----------------------------------------------------------------------------------------

" Automatically source the Vimrc file on save.
"=============================================
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source % | AirlineRefresh
augroup END

"----------------------------------------------------------------------------------------
" Functions
"----------------------------------------------------------------------------------------
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>



"----------------------------------------------------------------------------------------
" This is where i put my notes about latest bindings and stuff like that
"----------------------------------------------------------------------------------------

" NOTE: LEADER+y => Yank selection from visual mode to clipboard [visual]
" NOTE: LEADER+p => Paste from cliboard [normal]

" LEADER+e open the most recently used files.

" Use gg=G to reindent the whole buffer. NOTE: = can be used to indent visual
" blocks and the whole shebang. Really useful shit!

" Use :retab command to change a tab-indented buffer to space-indented

" NOTE: Surround Vim is very powerful! c+s+<change from this>+<change to this>
" ##### or for HTML use t for Tag, eg. c+s+t and write which tag to change
" ##### or d+s+t to delete tag, or any other verb

" NOTE: Use J to join the line underneath the cursor to the line the cursor's on.

" NOTE: Use Ctrl and h or l to move between buffers, it's better than leader
" because Ctrl can be held while pressing h or l for faster switching

" ---------------------
" NOTE: On using MARKS:
" set a MARK by pressing m and than any key in order to set the mark in a register.
" to make it a session wide mark use an UPPERCASE letter.
" to return to the set mark ROW use ' plus the mark register.
" to return to the set mark ROW and COLUMN use ` plus the mark register.

" --- VISUAL BLOCK MODE ---
" Use CTRL+V to enter Visual Block Mode and do magical things
" example: select a block of text and press I to enter visual block insert
" where everything that's written on the first line will be inserted on every
" next line of the block
