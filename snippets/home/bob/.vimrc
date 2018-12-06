" Stand by this platitude:
" Don't put any lines in your vimrc that you don't understand.

" Environment {{{

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required

" }}}

" Bundles config {{{

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tpope/vim-unimpaired'
Plugin 'momota/cisco.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}

" General {{{

syntax on                " Syntax highlighting

scriptencoding utf-8
" Кодировка терминала, должна совпадать с той,
" которая используется для вывода в терминал
set termencoding=utf-8
" возможные кодировки файлов и последовательность определения.
set fileencodings=utf8,cp1251

" Отключить создание файлов бекапа и свопа
set nobackup
set nowritebackup
set noswapfile

set history=1000          " Store a ton of history (default is 20)
set hidden                " Allow buffer switching without saving

" }}}

" Vim UI {{{

" Non-GUI (terminal) colors
set t_Co=256                " Enable 256 colors to stop the CSApprox
            " warning and make xterm vim shine

" Какие же вы все убогие, красноглазые! Одна радость в жизни - разукрашивать
" допотопное говно в разные цвета.

colorscheme PaperColor

"Switch between Solarized Light/Dark in vim Automagically
let hour = strftime("%H")
if 6 <= hour && hour < 21
  set background=light
else
  set background=dark
endif
" for manual toggle between dark and light background use [vim-unimpaired] keymap:
" [cob]

set showmode                    " Display the current mode
set cursorline                  " Highlight current line

set number                      " Line numbers on
"set relativenumber              "Prefer relative line numbering?
set showmatch                   " Show matching brackets/parenthesis
set hlsearch                    " Highlight search terms
set incsearch                   " Find as you type search
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches,
                                " then longest common part, then all.
" Folding
set foldenable                  " Enable folding
set foldlevelstart=10           " Open most folds by default
                                " Setting it to 99 would guarantee
                                " folds are always open.
set foldmethod=indent           " Fold based on indent level
set foldnestmax=10              " 10 nested fold max

" Show tabs and trailing characters.
set list
"set listchars=tab:»·,trail:•,extends:#,nbsp:.,eol:¬
set listchars=tab:»·,trail:•,extends:#,nbsp:.

" }}}

" Formatting {{{

set nowrap          " Do not wrap long lines
set autoindent      " Indent at the same level of the previous line
filetype indent on  " load filetype-specific indent files

set shiftwidth=4    " Use indents of 4 spaces
set tabstop=4       " Number of visual spaces per TAB
set softtabstop=4   " Number of spaces in tab when editing
set expandtab       " Tabs are spaces, not tabs

set nojoinspaces    " Prevents inserting two spaces
                    " after punctuation on a join (J)
set splitright      " Puts new vsplit windows to the right of the current
set splitbelow      " Puts new split windows to the bottom of the current

" }}}

" Key (re)Mappings {{{
" nmap, vmap, imap описывают поведение комбинации клавишь в нормальном,
" визуальном и режиме вставки

" The default leader is '\', but many people prefer ','
" as it's in a standard location.
let mapleader = ','
" Ever notice a slight lag after typing the leader key + command? This lowers
" the timeout.
"set timeoutlen=500

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
nnoremap <space> za

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
iab hellomylove Hello, my love! It's getting cold on this island. I'm sad alone, I'm so sad on my own. The truth is - we were much too young... Now I'm looking for you, or anyone like you. We said goodbye with the smile on our faces... Now you're alone, you're so sad on your own. The truth is - we run out of time. Now you're looking for me, or anyone like me.

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Get to home dir easier
" <leader>hm is easier to type than :cd ~
nmap <leader>hm :cd ~/ <CR>

" Bind Ctrl+<movement> keys to move around the windows,
" instead of using Ctrl+w + <movement>:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Reformat paragraphs and list.
nnoremap <leader>r gq}

" Delete trailing white space and Dos-returns and to expand tabs to spaces.
nnoremap <leader>t :set et<CR>:retab!<CR>:%s/[\r \t]\+$//<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" To save, ctrl-s.
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

" edit vimrc/bashrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>es :vsp ~/.bashrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Shortcuts for moving between tabs.
" Alt-j to move to the tab to the left
noremap <A-j> gT
" Alt-k to move to the tab to the right
noremap <A-k> gt

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %T")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %T")<CR>

" }}}

" Plugins {{{

" vim-airline {{{

let g:airline_powerline_fonts = 1
set laststatus=2

" }}}

" vim-airline-themes {{{

let g:airline_theme='papercolor'

" }}}

" Jedi-VIM {{{

" If you are a person who likes to use VIM-buffers not tabs,
" you might want to put that in your .vimrc:
let g:jedi#use_tabs_not_buffers = 0
" If you are a person who likes to use VIM-splits,
" you might want to put this in your .vimrc:
let g:jedi#use_splits_not_buffers = "left"

" }}}

" }}} End Plugins

" Backup {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" }}}

" Custom Functions {{{

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Special Configs
au BufNewFile,BufRead *.conf            set filetype=cisco
au BufNewFile,BufRead *.cfg             set filetype=cisco

" }}}


" Special comments in a file that can declare certain
" Vim settings to be used only for that file:
" vim:foldmethod=marker:foldlevel=0
