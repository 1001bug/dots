

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
autocmd FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = "\"


" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Automatically save before :next, :make etc.
set autowrite

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" GUI Lang
" let $LANG='en' 
set langmenu=en

"win and nix var
set guifont=Liberation\ Mono\ 12,Liberation_Mono:h12:cRUSSIAN:qDRAFT

set number
set modeline
set warn
set showcmd

set completeopt=menuone,noinsert,noselect,preview

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,.git\*

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent


" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

"qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe, qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe, qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe qwe 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123 123
"asdadsasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd, asdasdasd,asd asdasd,ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss ssssssssssssssssssssssssssssssssssssssssssssss sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
"    colorscheme slate
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set t_Co=256

    winsize 150 40
    winpos 70 70


if has('mouse')
  set mouse=a
endif

endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


"Auto indent
set autoindent

"Smart indent
set smartindent

"Wrap lines
set wrap 


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>






""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype perl noremap <F5> :call CheckPerlSyntax()<CR>
autocmd Filetype perl noremap  <silent> <F6>    :cclose<CR>
autocmd Filetype perl noremap  <silent> <F7>    :cp<CR>
autocmd Filetype perl snoremap  <silent> <F8>    :cn<CR>







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype perl set tabstop=4 expandtab shiftwidth=4 shiftround matchpairs+=<:>
autocmd FileType perl setlocal equalprg=perltidy
set listchars=eol:],tab:>+,trail:~,extends:+,precedes:<,space:_
nnoremap <silent> <F3> :set list!<CR>

set pastetoggle=<F2>

" disable auto # add on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o



func! CheckPerlSyntax()
    let map = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=perl
"    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" from gvim def for perl compiller errorformat=%-G%.%#had compilation errors.,%-G%.%#syntax OK,%m at %f line %l.,%+A%.%# at %f line %l\,%.%#,%+C%.%#

    set errorformat=
	\%-G%.%#had\ compilation\ errors.,
	\%-G%.%#syntax\ OK,
	\%m\ at\ %f\ line\ %l.,
	\%+A%.%#\ at\ %f\ line\ %l\\,%.%#,
	\%+C%.%#'


    silent make %
    copen
    let &makeprg     = map
    let &errorformat = ef
endfunc

