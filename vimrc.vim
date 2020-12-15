colo slate
set langmenu=en_US
syntax on
"set guifont=Consolas:h12:cRUSSIAN:qDRAFT
"set guifont=Terminus:h12:cRUSSIAN:qDRAFT
set guifont=Liberation_Mono:h12:cRUSSIAN:qDRAFT

set number
set laststatus=2
set ruler
set modeline
winsize 150 40
winpos 70 70
set backspace=indent,eol,start
set magic
set warn
"set autoread

"search with case if needle with case
"set smartcase
"search while type search string ^G ^T to next prrev. enter to move to found
"set incsearch
filetype plugin indent on


set showcmd                     " Show me what I'm typing
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
"set ttyfast "?????

"set autoindent
"set smartindent
"set complete-=i
"set showmatch
"set smarttab

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Better split switching
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Center the screen
"nnoremap <space> zz

" Set 80 character line limit
"if exists('+colorcolumn')
"  set colorcolumn=80
"else


" Give more space for displaying messages.
"set cmdheight=2


" For all text files set 'textwidth' to 80 characters.
"autocmd FileType text setlocal textwidth=80 fo+=2t noexpandtab

"==========================================================

autocmd Filetype perl set tabstop=4 expandtab shiftwidth=4 shiftround matchpairs+=<:>
autocmd FileType perl setlocal equalprg=perltidy

"disable hightlight by # or *
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set listchars=eol:•,tab:>+,trail:~,extends:+,precedes:<,space:·
nnoremap <silent> <F3> :set list!<CR>

set pastetoggle=<F2>
" disable auto # add on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
set mouse=a



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

" nmap pl :!perl %<.pl<CR>
autocmd Filetype perl noremap <F5> :call CheckPerlSyntax()<CR>
autocmd Filetype perl noremap  <silent> <F6>    :cclose<CR>
autocmd Filetype perl noremap  <silent> <F7>    :cp<CR>
autocmd Filetype perl snoremap  <silent> <F8>    :cn<CR>
" noremap  <silent> <F5>    :copen<CR>





