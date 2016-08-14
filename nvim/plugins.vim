"dein Scripts-----------------------------
" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:


" Ctrl-P and NERDTree
" ---------------------
call dein#add('ctrlpvim/ctrlp.vim')             "Ctrl-P like in Sublime Text
call dein#add('scrooloose/nerdtree')            "NERDTree plugin


" Search and replace
" ---------------------
call dein#add('rking/ag.vim')                   "Front for the silver searcher, fast pattern matching through files anywhere
call dein#add('skwp/greplace.vim')              "Global search and replace


" Snippets
" ------------------------------------
call dein#add('SirVer/ultisnips')               "Ultisnips plugin for snippets


" Code completion
" ------------------------------------
call dein#add('Valloric/ycmd')                  "YouCompleteMe server
call dein#add('Valloric/YouCompleteMe')         "YouCompleteMe plugin for code completion
call dein#add('ervandew/supertab')              "Supertab


" Colorschemes
" ------------------------------------
call dein#add('mhartington/oceanic-next')


" Vim airline and bufferline
" ------------------------------------
call dein#add('vim-airline/vim-airline')        "Vim airline plugin


" Syntax Highlighting & Related shit
" ------------------------------------
call dein#add('jwalton512/vim-blade')           "Laravel Blade syntax
call dein#add('qbbr/vim-twig')                  "Twig syntax highlighting
call dein#add('othree/html5.vim')               "HTML5 syntax and goodies
call dein#add('hail2u/vim-css3-syntax')         "Better CSS3 support
call dein#add('stephpy/vim-yaml')               "Yaml syntax highlighting
call dein#add('tpope/vim-haml')                 "Haml, Sass and SCSS runtime files
call dein#add('othree/yajs.vim')                "Javascript syntax support
call dein#add('pangloss/vim-javascript')        "Javascript better indent
call dein#add('StanAngeloff/php.vim')           "Better PHP syntax
call dein#add('posva/vim-vue')                  "Vue components syntax
call dein#add('elixir-lang/vim-elixir')         "Elixir syntax
call dein#add('keith/tmux.vim')                 "tmux configuration file highlighting


" Code editing helpers
" ---------------------------------------
call dein#add('tpope/vim-surround')                 "Quoting/parenthesizing made simple
call dein#add('nathanaelkane/vim-indent-guides')    "Indent guides plugin
call dein#add('mattn/emmet-vim')                    "Emmet in Vim!
call dein#add('jiangmiao/auto-pairs')               "Auto close brackets and such
call dein#add('godlygeek/tabular')                  "Align items in column e.g align variables by = sign
call dein#add('tobyS/pdv')                          "PHP Documentation block generator
call dein#add('heavenshell/vim-jsdoc')              "Javascript Documentation block generator
call dein#add('tpope/vim-sleuth')                   "Heuristically set buffer options like indent and stuff
call dein#add('tpope/vim-eunuch')                   "helpers for UNIX


" Misc plugins
" ---------------------------------------
call dein#add('tobyS/vmustache')                    "Vim script templating language
call dein#add('tmux-plugins/vim-tmux-focus-events') "Fix FocusGained and FocusLost autocommand events in vim from tmux
call dein#add('duggiefresh/vim-easydir')            "Automatically create directory(if it doesn't exist) when creating a new file
call dein#add('danro/rename.vim')                   "Rename the current file in the vim buffer + retain relative path.
"call dein#add('unblevable/quick-scope')             "Which characters to target for f, F and family




" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
