filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-vinegar'                  "Better file browsing
Plugin 'ctrlpvim/ctrlp.vim'                 "Ctrl-P like in Sublime Text
Plugin 'duggiefresh/vim-easydir'            "Automatically create directory(if it doesn't exist) when creating a new file
Plugin 'mhinz/vim-startify'                 "Better start screen

Plugin 'ervandew/supertab'                  "Tab completion


" Search and replace
" ---------------------
Plugin 'rking/ag.vim'                       "Front for the silver searcher, fast pattern matching through files anywhere
Plugin 'skwp/greplace.vim'                  "Global search and replace


" Vim airline and bufferline
" ---------------------------
Plugin 'vim-airline/vim-airline'            "Vim airline plugin


" Colorschemes
" -------------------------------
Plugin 'romainl/flattened'                  "Flattened colorscheme
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'

" Plugins for snippets
" ------------------------------------
Plugin 'SirVer/ultisnips'                   "Ultisnips plugin for snippets


" Syntax Highlighting & Related shit
" ------------------------------------
Plugin 'jwalton512/vim-blade'               "Laravel Blade syntax
Plugin 'qbbr/vim-twig'                      "Twig syntax highlighting
Plugin 'othree/html5.vim'                   "HTML5 syntax and goodies
Plugin 'hail2u/vim-css3-syntax'             "Better CSS3 support
Plugin 'stephpy/vim-yaml'                   "Yaml syntax highlighting
Plugin 'tpope/vim-haml'                     "Haml, Sass and SCSS runtime files
Plugin 'StanAngeloff/php.vim'               "Better PHP syntax
Plugin 'keith/tmux.vim'                     "tmux configuration file highlighting
Plugin 'pangloss/vim-javascript'            "Better javascript support
Plugin 'mxw/vim-jsx'                        "React JSX support



" Code editing helpers
" ---------------------------------------
Plugin 'tpope/vim-surround'                 "Quoting/parenthesizing made simple
Plugin 'nathanaelkane/vim-indent-guides'    "Indent guides plugin
Plugin 'mattn/emmet-vim'                    "Emmet in Vim!
Plugin 'jiangmiao/auto-pairs'               "Auto close brackets and such
Plugin 'godlygeek/tabular'                  "Align items in column e.g align variables by = sign
Plugin 'tobyS/pdv'                          "PHP Documentation block generator

" Misc plugins
" ---------------------------------------
Plugin 'tobyS/vmustache'                    "Vim script templating language



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
