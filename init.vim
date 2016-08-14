set hidden                          " Switch between buffers without having to save first.

so ~/dotfiles/nvim/plugins.vim       " Source the plugins file.

set number                          " Activate line numbers.
set so=7                            " Set 7 lines to the cursor(above and bellow) - when moving vertically using j/k

set ruler                           " Always show current position

set cmdheight=1                     " Height of the command bar




"----------------------------------------------------------------------------------------
" Files/Backups/Undo
"----------------------------------------------------------------------------------------
" Turn backup off
set nobackup
set nowb
set noswapfile



"----------------------------------------------------------------------------------------
" Text Edit/Indent options
"----------------------------------------------------------------------------------------

" Don't move cursor to the start of the line when switching buffers
" =================================================================
se nostartofline

" Use spaces instead of tabs
"===========================
set expandtab

" 1 tab == 4 spaces
"==================
set shiftwidth=4
set tabstop=4

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



"----------------------------------------------------------------------------------------
" Gui specific settings
"----------------------------------------------------------------------------------------

"au GUIEnter * simalt ~x                    " Start gVim maximized.

set guiheadroom=0                           " Stop the ugly white line at the bottom from showing up after sourcing the .vimrc file 

set background=dark
colorscheme OceanicNext                     " Set colorscheme

set termguicolors                           " Set terminal colors to 256. 

set showmatch                       " Show matching brackets when text indicator is over them

set mat=2                           " How many tenths of a second to blink when matching brackets



"----------------------------------------------------------------------------------------
" Mappings/Bindings
"----------------------------------------------------------------------------------------

" Map the leader key to comma, default is \
let mapleader=','
let g:mapleader=','
nmap <Space> <Leader>

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
nnoremap <Leader>ev :e ~/.config/nvim/init.vim<cr>

"Edit vim plugins file
"=====================
nnoremap <Leader>ep :e ~/dotfiles/nvim/plugins.vim<cr>

"Edit tmux config file
"====================
nnoremap <Leader>et :e ~/dotfiles/.tmux.conf<cr>

" Previous and next buffers
"==========================
nnoremap <c-l> :bnext<cr>
nnoremap <c-h> :bprevious<cr>

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

" Map Esc to enter normal mode in terminal
" ========================================
tnoremap <Esc> <C-\><C-n>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
"==========================================================
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

"--- NERDTree ---
"----------------
"let NERDTreeHijackNetrw = 0
" Make NERDTree easier to toggle.
nmap <Leader>nt :NERDTreeToggle<cr>


"--- PHP Documentator for Vim ---
"--------------------------------
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"--- UltiSnips ---
"-----------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"--- YouCompleteMe ---
"---------------------

" Remove preview window after completion
"=======================================
let g:ycm_autoclose_preview_window_after_completion = 1

" make YCM compatible with UltiSnips (using supertab)
"====================================================
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'


"--- CtrlP ---
"-------------

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

"--- Emmet ---
"-------------

" Remap Emmet leader to Ctrl+E
"=============================
let g:user_emmet_leader_key='<c-E>'



"--- Vim Indent Guides ---
"-------------------------
let g:indent_guides_guide_size = 1
let g:indent_guides_space_guides = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2


"--- Airline ---
"---------------

"Fix the airline bar not showing special chars
"=============================================
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 0



"--- Vue syntax ---
"------------------
"Set .vue files to html files for better syntax highlighting and indentation
"===========================================================================
autocmd BufNewFile,BufRead *.vue set filetype=html


"----------------------------------------------------------------------------------------
" Auto-Commands
"----------------------------------------------------------------------------------------

" Automatically source the Vimrc file on save.
"=============================================
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source % | AirlineRefresh
augroup END
