set hidden                          " Switch between buffers without having to save first.

so ~/dotfiles/nvim/plugins.vim       " Source the plugins file.

set number relativenumber                          " Activate line numbers.
set so=7                            " Set 7 lines to the cursor(above and bellow) - when moving vertically using j/k

set ruler                           " Always show current position

set cmdheight=1                     " Height of the command bar

set cursorcolumn
set cursorline



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

" Live, incremental commands (example when doing a search and replace)
"=====================================================================
set inccommand=split



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

"set guiheadroom=0                          " Stop the ugly white line at the bottom from showing up after sourcing the .vimrc file 

set background=dark " or light if you prefer the light version
colo seoul256

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

" Delete current buffer
"======================
nnoremap <Leader>q :bp<cr>:bd #<cr>

" Map leader+space to disable the search highlight.
"==================================================
nnoremap <Leader><space> :nohlsearch<cr>


" Abbreviation that expands to the directory of buffer, useful for things like
" wanting to edit/create a file in the current buffer's directory
"=============================================================================
cabbr <expr> %% expand('%:h')


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

" Delete trailing white space on save
"===========================================================================
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()


"----------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------

"--- NERDTree ---
"----------------
" let NERDTreeHijackNetrw = 0
" Make NERDTree easier to toggle.
nmap <Leader>nt :NERDTreeToggle<cr>


"--- PHP Documentator for Vim ---
"--------------------------------
let g:pdv_template_dir = $HOME ."/.config/nvim/plugged/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>


"--- UltiSnips ---
"-----------------
let g:UltiSnipsExpandTrigger="<leader>us"
let g:UltiSnipsJumpForwardTrigger="<leader>us"
let g:UltiSnipsJumpBackwardTrigger="<leader>ub"


"--- Composer ---
"----------------
autocmd User Composer nmap <buffer> <Leader>gf <Plug>(composer-find)
autocmd User Composer nmap <buffer> <Leader>gu <Plug>(composer-use)


"--- Nvim Completion Framework - NCM ---
"---------------------------------------
autocmd FileType php LanguageClientStart

" Use Tab completion with NCM.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"--- ALE - Linting engine ---
"----------------------------
let g:ale_linters = {
\   'javascript': ['standard'],
\}

let g:ale_fixers = {
\   'javascript': ['standard'],
\}


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

" The Silver Searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


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


"--- Javascript syntax ---
"-------------------------

" Set syntax highlighting for jsDoc comments.
let g:javascript_plugin_jsdoc = 1

"--- Vue syntax ---
"------------------

" Set .vue files to html files for better syntax highlighting and indentation
autocmd BufNewFile,BufRead *.vue set filetype=html

" Fix broken syntax highlighting.
autocmd FileType vue syntax sync fromstart


"----------------------------------------------------------------------------------------
" Auto-Commands
"----------------------------------------------------------------------------------------

" Automatically source the Vimrc file on save.
"=============================================
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source %
augroup END


"----------------------------------------------------------------------------------------
" Statusline
"----------------------------------------------------------------------------------------

let g:currentmode={
    \ 'n'  : 'Normal ',
    \ 'no' : 'N-Operator Pending ',
    \ 'v'  : 'Visual ',
    \ 'V'  : 'V-Line ',
    \ '^V' : 'V-Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S-Line ',
    \ '^S' : 'S-Block ',
    \ 'i'  : 'Insert ',
    \ 'R'  : 'Replace ',
    \ 'Rv' : 'V-Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V-Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=006'
  endif

  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{g:currentmode[mode()]}            " Current mode
set statusline+=%8*\ [buffer:%n]                         " buffernr
set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ \ %l/\%L\ %3c\              " Rownumber/total (%)

hi User1 ctermfg=007
hi User2 ctermfg=008
hi User3 ctermfg=008
hi User4 ctermfg=008
hi User5 ctermfg=008
hi User7 ctermfg=008
hi User8 ctermfg=008
hi User9 ctermfg=007
