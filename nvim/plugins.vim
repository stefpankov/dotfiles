call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Add or remove your plugins here:


" Ctrl-P and NERDTree
" ---------------------
Plug 'ctrlpvim/ctrlp.vim'                               "Ctrl-P like in Sublime Text
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "NERDTree plugin


" Search and replace
" ---------------------
Plug 'rking/ag.vim'                   "Front for the silver searcher, fast pattern matching through files anywhere
Plug 'skwp/greplace.vim'              "Global search and replace


" Snippets
" ------------------------------------
Plug 'SirVer/ultisnips'               "Ultisnips plugin for snippets


" Code completion
" ------------------------------------
Plug 'Valloric/ycmd'                                    "YouCompleteMe server
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } "YouCompleteMe plugin for code completion
Plug 'ervandew/supertab'                                "Supertab


" Colorschemes
" ------------------------------------
Plug 'mhartington/oceanic-next'


" Vim airline and bufferline
" ------------------------------------
Plug 'vim-airline/vim-airline'        "Vim airline plugin


" Syntax Highlighting & Related shit
" ------------------------------------
Plug 'jwalton512/vim-blade'                                 "Laravel Blade syntax
Plug 'qbbr/vim-twig'                                        "Twig syntax highlighting
Plug 'othree/html5.vim'                                     "HTML5 syntax and goodies
Plug 'hail2u/vim-css3-syntax'                               "Better CSS3 support
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }                  "Yaml syntax highlighting
Plug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }  "Haml, Sass and SCSS runtime files
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }     "Javascript better indent
Plug 'StanAngeloff/php.vim', { 'for': ['php', 'phtml'] }    "Better PHP syntax
Plug 'posva/vim-vue', { 'for': 'vue' }                      "Vue components syntax
Plug 'elixir-lang/vim-elixir', { 'for': 'exs' }             "Elixir syntax
Plug 'keith/tmux.vim'                                       "tmux configuration file highlighting


" Code editing helpers
" ---------------------------------------
Plug 'tpope/vim-surround'                 "Quoting/parenthesizing made simple
Plug 'nathanaelkane/vim-indent-guides'    "Indent guides plugin
Plug 'mattn/emmet-vim'                    "Emmet in Vim!
Plug 'jiangmiao/auto-pairs'               "Auto close brackets and such
Plug 'godlygeek/tabular'                  "Align items in column e.g align variables by = sign
Plug 'tobyS/pdv', { 'for': 'php' }        "PHP Documentation block generator
Plug 'heavenshell/vim-jsdoc'              "Javascript Documentation block generator
Plug 'tpope/vim-sleuth'                   "Heuristically set buffer options like indent and stuff
Plug 'tpope/vim-eunuch'                   "helpers for UNIX


" Misc plugins
" ---------------------------------------
Plug 'tobyS/vmustache'                    "Vim script templating language
Plug 'tmux-plugins/vim-tmux-focus-events' "Fix FocusGained and FocusLost autocommand events in vim from tmux
Plug 'duggiefresh/vim-easydir'            "Automatically create directory(if it doesn't exist) when creating a new file
Plug 'danro/rename.vim'                   "Rename the current file in the vim buffer + retain relative path.




" Add plugins to &runtimepath
call plug#end()

" Required:
filetype plugin indent on
