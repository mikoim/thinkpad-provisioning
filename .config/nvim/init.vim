let g:python_host_prog = '/home/ek/miniconda3/envs/nvim-py2/bin/python'
let g:python3_host_prog = '/home/ek/miniconda3/envs/nvim-py3/bin/python3'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/ek/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/ek/.config/nvim/bundle')
  call dein#begin('/home/ek/.config/nvim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/home/ek/.config/nvim/bundle/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/deoplete.nvim')

  call dein#add('elixir-lang/vim-elixir')
  call dein#add('thinca/vim-ref')
  call dein#add('awetzel/elixir.nvim',{'build': 'sh -c ' . '''yes | ./install.sh'''})

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('joshdick/onedark.vim')
  call dein#add('vim-airline/vim-airline')

  call dein#add('ryanoasis/vim-devicons')

  call dein#add('neomake/neomake')

  call dein#add('Yggdroot/indentLine')

  call dein#add('kassio/neoterm')

  call dein#add('wakatime/vim-wakatime')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1

let g:indentLine_enabled = 1

set incsearch

" Fundamental settings
  set fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
  set fileformat=unix
  set fileformats=unix,dos,mac
  filetype on
  filetype plugin on
" Some useful settings
  set smartindent
  set expandtab         "tab to spaces
  set tabstop=2         "the width of a tab
  set shiftwidth=2      "the width for indent
  set ignorecase        "ignore the case when search texts
  set smartcase         "if searching text contains uppercase case will not be ignored
" Lookings
  set number           "line number
  set cursorline       "hilight the line of the cursor
  set nowrap           "no line wrapping

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme onedark
let g:onedark_terminal_italics=1
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

" Neomake
" When writing a buffer.
call neomake#configure#automake('w')
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing.
call neomake#configure#automake('rw', 1000)
