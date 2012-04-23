" .vimrc

" Preamble ---------------------------------------------------------------- {{{

set nocompatible
filetype off   " required! 
" pathogen disabled
" call pathogen#infect('~/.vim/local/bundle/')
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" }}}

" Bundles ----------------------------------------------------------------- {{{

" (Help) Manage bundles {{{
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" }}}
" General {{{
" original repos on github
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-commentary'
    Bundle 'scrooloose/nerdtree'
    " Bundle 'scrooloose/nerdcommenter'
    " abolish.vim: easily search for, substitute,
    " and abbreviate multiple variants of a word
    Bundle 'tpope/vim-abolish'
    " speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
    Bundle 'tpope/vim-speeddating'
    Bundle 'korpz/Autoclose-vim'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'sjl/gundo.vim'
    " Perform all your vim insert mode completions with Tab
    Bundle 'ervandew/supertab'
    " Plugin to create and use a scratch Vim buffer 
    Bundle 'vim-scripts/scratch.vim'
    " Text outlining and task management for Vim based on Emacs' Org-Mode 
    Bundle 'jceb/vim-orgmode'
    " Maintains a history of previous yanks, changes and deletes 
    Bundle 'chrismetcalf/vim-yankring'
"
" }}}
" Development {{{
    " Git
    Bundle 'tpope/vim-fugitive'
    " Gist
    Bundle 'mattn/gist-vim'
    " A Vim plugin for resolving three-way merges.
    Bundle 'sjl/threesome.vim'
    " Source code browser with excellent support for Javascript
    Bundle 'taglist-plus'
    " Vim plugin that displays tags in a window, ordered by class etc.
    Bundle 'majutsushi/tagbar'
    " MakeGreen runs make and shows a red or green message bar
    " for success/failure. Speeds the red-green-refactor cycle!
    " Bundle 'sjl/vim-makegreen'
    " Syntax checking hacks for vim
    Bundle 'scrooloose/syntastic'

" }}}
" For Mac OS X only {{{
    " Plugin for Vim, which provides smart keyboard layout switching.
    if has('mac') || has ('macunix')
        Bundle 'porqz/KeyboardLayoutSwitcher'
    endif

" }}}
" For GUI only {{{
    if has('gui_running')
    endif

" }}}
" For Console only {{{
    if !has('gui_running')
    endif

" }}}
" Snippets {{{
    " Code snippets engine for Vim, with snippets library.
    " XPTemplate let you write codes in a smooth, quick and comfortable way.
    Bundle 'drmingdrmer/xptemplate'
    " snipMate.vim aims to be a concise vim script 
    " that implements some of TextMate's snippets features in Vim.
    " Bundle 'msanders/snipmate.vim'
    " The ultimate snippet solution for python enabled Vim.
    " Bundle 'UltiSnips'

" }}}
" Searching {{{
    Bundle 'mileszs/ack.vim'
    " Bundle 'wincent/Command-T'
    " Fuzzy file, buffer, mru and tag finder
    Bundle 'kien/ctrlp.vim'

" }}}
" Documentation {{{
"
    " Flexible viewer for any documentation source (help/man/perldoc/etc.)
    " for any file type inside Vim in easy to use, consistent,
    " smart and configurable way.
    " Bundle 'viewdoc'

" }}}
" File specific plugins {{{
" Coffee Script {{{
    " Bundle 'kchmck/vim-coffee-script'
" }}}
" CSS {{{
    " Vim runtime files for Haml, Sass, and Scss
    Bundle 'tpope/vim-haml'
    " Highlight colors in css files
    Bundle 'skammer/vim-css-color'
    " vim syntax for LESS (dynamic CSS)
    Bundle 'groenewege/vim-less'
    " Add CSS3 syntax support to vim's built-in `syntax/css.vim`
    Bundle 'hail2u/vim-css3-syntax'
" }}}
" JavaScript {{{
    " Vastly improved vim's javascript indentation.
    Bundle 'pangloss/vim-javascript'
" }}}
" HTML {{{
    Bundle 'othree/html5.vim'
    " like zen coding for vim
    Bundle 'sjl/vim-sparkup'
" }}}
" Python {{{
    " Bundle 'sjl/python-mode'
" }}}
" Shell {{{
    " Bash
    Bundle 'vim-scripts/bash-support.vim'
" }}}
" Text {{{
    Bundle 'tpope/vim-markdown'
" }}}
"
" }}}
" Visualize {{{
" colorschemes
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'molokai'
" statusline
    Bundle 'Lokaltog/vim-powerline'
"   Bundle 'scrooloose/vim-statline'
" }}}

" }}}
filetype plugin indent on   " required! 

" Basic options ----------------------------------------------------------- {{{
set encoding=utf-8
set modelines=0
set autoindent
set showcmd
set noshowmode
set laststatus=2
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set norelativenumber
set history=1000
set undofile
set undoreload=10000
" set cpoptions+=J
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/zsh
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿,vert:│
" set ttimeout
" set notimeout
set autowrite
set shiftround
set autoread
set title
set linebreak
set dictionary=/usr/share/dict/words
" default keywordprg="man -s", but I'm prefere :help
" set keywordprg=

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*"

" Save when losing focus
au FocusLost * :wa

" Resize splits when the window is resized
au VimResized * :wincmd =

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}
" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" }}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" Tabs, spaces, wrapping {{{

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1

" }}}
" Backups {{{

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.

" }}}
" Leader {{{

let mapleader = ";"
let maplocalleader = ","

" }}}
" Color scheme {{{

syntax on
set background=dark
" colorscheme molokai
colorscheme solarized

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" }}}
" Abbreviations ----------------------------------------------------------- {{{

" function! EatChar(pat)
"     let c = nr2char(getchar(0))
"     return (c =~ a:pat) ? '' : c
" endfunction

" function! MakeSpacelessIabbrev(from, to)
"     execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
" endfunction

" call MakeSpacelessIabbrev('sl/',  'http://stevelosh.com/')
" call MakeSpacelessIabbrev('bb/',  'http://bitbucket.org/')
" call MakeSpacelessIabbrev('bbs/', 'http://bitbucket.org/sjl/')
" call MakeSpacelessIabbrev('gh/',  'http://github.com/')
" call MakeSpacelessIabbrev('ghs/', 'http://github.com/sjl/')

" iabbrev ldis ಠ_ಠ
" iabbrev lsad ಥ_ಥ
" iabbrev lhap ಥ‿ಥ

iabbrev al@ alex@alexlov.com
iabbrev vrcf `~/.vimrc` file

" }}}
" Searching and movement -------------------------------------------------- {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

runtime macros/matchit.vim
map <tab> %

" Made D behave
nnoremap D d$

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on * and #
nnoremap * *<c-o>
nnoremap # #<c-o>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Window resizing
" nnoremap <c-left> 5<c-w>>
" nnoremap <c-right> 5<c-w><

" Easier to type, and I never use the default behavior.
" noremap H ^
" noremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
" nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Directional Keys {{{

" It's 2011.
noremap j gj
noremap k gk

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <C-tab> <C-w>w
noremap <C-S-tab> <C-w>W
noremap <leader>h <C-w>s
noremap <leader>v <C-w>v

" }}}
" Highlight word {{{

" nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
" nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
" nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
" nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" }}}
" " Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

" }}}
" Folding ----------------------------------------------------------------- {{{

set foldlevelstart=0
" set foldcrlumn=3

" Make the current location sane.
nnoremap <c-cr> zvzt

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ;z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let level = repeat("-", v:foldlevel)
    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 3 - v:foldlevel
    return '+' . level . line . '… ' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    " return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Destroy infuriating keys ------------------------------------------------ {{{

" Fuck you, help key.
" noremap  <F1> :set invfullscreen<CR>
" inoremap <F1> <ESC>:set invfullscreen<CR>a

" Fuck you too, manual key.
" nnoremap K <nop>

" Stop it, hash key.
" inoremap # X<BS>#

" }}}
" Various filetype-specific stuff ----------------------------------------- {{{

" C {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
augroup END

" }}}
" Clojure {{{

" let g:slimv_leader = '\'
" let g:slimv_keybindings = 2

" augroup ft_clojure
"     au!

"     au FileType clojure call TurnOnClojureFolding()
"     au FileType clojure compiler clojure
"     au FileType clojure setlocal report=100000

"     au BufWinEnter            SLIMV.REPL setlocal winfixwidth nolist
"     au BufNewFile,BufReadPost SLIMV.REPL setlocal nowrap foldlevel=99
"     au BufNewFile,BufReadPost SLIMV.REPL nnoremap <buffer> A GA
"     au BufNewFile,BufReadPost SLIMV.REPL nnoremap <buffer> <localleader>R :emenu REPL.<Tab>

"     " Fix the eval mappings.
"     au FileType clojure nnoremap <buffer> <localleader>ef :<c-u>call SlimvEvalExp()<cr>
"     au FileType clojure nnoremap <buffer> <localleader>ee :<c-u>call SlimvEvalDefun()<cr>

"     " And the inspect mapping.
"     au FileType clojure nmap <buffer> \i \di

"     " Indent top-level form.
"     au FileType clojure nmap <buffer> <localleader>= v((((((((((((=%
" augroup END

" }}}
" Clojurescript {{{

" augroup ft_clojurescript
"     au!

"     au BufNewFile,BufRead *.cljs set filetype=clojurescript
"     au FileType clojurescript call TurnOnClojureFolding()

"     " Send current toplevel form to dtach.
"     au FileType clojurescript nnoremap <buffer> \ee mz:call SelectToplevelForm()<cr>:call SendToDtach(1)<cr>`z
" augroup END

" }}}
" Confluence {{{

augroup ft_c
    au!

    au BufRead,BufNewFile *.confluencewiki setlocal filetype=confluencewiki

    " Wiki pages should be soft-wrapped.
    au FileType confluencewiki setlocal wrap linebreak nolist
augroup END

" }}}
" Cram {{{

let cram_fold=1

augroup ft_cram
    au!

    au BufNewFile,BufRead *.t set filetype=cram
    au Syntax cram setlocal foldlevel=1
augroup END


" }}}
" CSS and LessCSS and SASS ans SCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css,sass,scss setlocal foldmethod=marker
    au Filetype less,css,sass,scss setlocal foldmarker={,}
    au Filetype less,css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css,sass,scss setlocal iskeyword+=-

    " Use <localleader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css,*.sass,*.scss nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css,*.scss inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" Django {{{

augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR

    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
augroup END

" }}}
" Firefox {{{

augroup ft_firefox
    au!
    au BufRead,BufNewFile ~/Library/Caches/*.html setlocal buftype=nofile
augroup END

" }}}
" Fish {{{

augroup ft_fish
    au!

    au BufNewFile,BufRead *.fish setlocal filetype=fish
augroup END

" }}}
" Haskell {{{

augroup ft_haskell
    au!
    au BufEnter *.hs compiler ghc
augroup END

" }}}
" HTML and HTMLDjango {{{

augroup ft_html
    au!

    " au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au FileType html,jinja,htmldjango setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf

    " Use <localleader>t to fold the current templatetag.
    au FileType html,jinja,htmldjango nmap <buffer> <localleader>t viikojozf

    " Use Shift-Return to turn this:
    "     <tag>|</tag>
    "
    " into this:
    "     <tag>
    "         |
    "     </tag>
    au FileType html,jinja,htmldjango nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

    " Smarter pasting
    au FileType html,jinja,htmldjango nnoremap <buffer> p :<C-U>YRPaste 'p'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> P :<C-U>YRPaste 'P'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> π :<C-U>YRPaste 'p'<CR>
    au FileType html,jinja,htmldjango nnoremap <buffer> ∏ :<C-U>YRPaste 'P'<CR>

    " Indent tag
    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>= Vat=

    " Django tags
    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>

    " Django variables
    au FileType jinja,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
augroup END

" }}}
" Java {{{

augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" Lisp {{{

augroup ft_lisp
    au!
    au FileType lisp call TurnOnLispFolding()
augroup END

" }}}
" Mail {{{

augroup ft_mail
    au!

    au Filetype mail setlocal spell
augroup END

" }}}
" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

" }}}
" Nginx {{{

augroup ft_nginx
    au!

    au BufRead,BufNewFile /etc/nginx/conf/*                      set ft=nginx
    au BufRead,BufNewFile /etc/nginx/sites-available/*           set ft=nginx
    au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/* set ft=nginx
    au BufRead,BufNewFile vhost.nginx                            set ft=nginx

    au FileType nginx setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" OrgMode {{{

augroup ft_org
    au!

    au Filetype org nmap <buffer> Q vahjgq
    au Filetype org setlocal nolist
augroup END

" }}}
" Pentadactyl {{{

augroup ft_pentadactyl
    au!
    au BufNewFile,BufRead .pentadactylrc set filetype=pentadactyl
    au BufNewFile,BufRead ~/Library/Caches/TemporaryItems/pentadactyl-*.tmp set nolist wrap linebreak columns=100 colorcolumn=0
augroup END

" }}}
" Puppet {{{

augroup ft_puppet
    au!

    au Filetype puppet setlocal foldmethod=marker
    au Filetype puppet setlocal foldmarker={,}
augroup END

" }}}
" Python {{{

augroup ft_python
    au!

    " au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    " au FileType python compiler nose
    " au FileType man nnoremap <buffer> <cr> :q<cr>

    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    " Jesus, Python.  Five characters of punctuation for a damn string?
    au FileType python inoremap <buffer> <d-'> _(u'')<left><left>
augroup END

" }}}
" QuickFix {{{

augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap
augroup END

" }}}
" ReStructuredText {{{

augroup ft_rest
    au!

    au Filetype rst nnoremap <buffer> <localleader>1 yypVr=
    au Filetype rst nnoremap <buffer> <localleader>2 yypVr-
    au Filetype rst nnoremap <buffer> <localleader>3 yypVr~
    au Filetype rst nnoremap <buffer> <localleader>4 yypVr`
augroup END

" }}}
" Ruby {{{

augroup ft_ruby
    au!
    au Filetype ruby setlocal foldmethod=syntax
augroup END

" }}}
" Scheme {{{

" augroup ft_scheme
"     au!

"     " Send current toplevel form to dtach.
"     au FileType scheme nnoremap <buffer> \ee mz:call SelectToplevelForm()<cr>:call SendToDtach(1)<cr>`z
" augroup END

" }}}
" Vagrant {{{

augroup ft_vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set ft=ruby
augroup END

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}


" }}}
" Quick editing ----------------------------------------------------------- {{{

nnoremap <leader>ev <C-w>v<C-w>j:e $MYVIMRC<cr>
"nnoremap <leader>es <C-w>v<C-w>j:e ~/.vim/snippets/<cr>
"nnoremap <leader>eo <C-w>v<C-w>j:e ~/Dropbox/Org<cr>4j
"nnoremap <leader>eh <C-w>v<C-w>j:e ~/.hgrc<cr>
"nnoremap <leader>ep <C-w>v<C-w>j:e ~/.pentadactylrc<cr>
"nnoremap <leader>em <C-w>v<C-w>j:e ~/.mutt/muttrc<cr>
"nnoremap <leader>ez <C-w>v<C-w>j:e ~/lib/dotfiles/zsh<cr>4j
"nnoremap <leader>ek <C-w>v<C-w>j:e ~/lib/dotfiles/keymando/keymandorc.rb<cr>

" }}}
" Shell ------------------------------------------------------------------- {{{

function! s:ExecuteInShell(command) " {{{
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'AnsiEsc'
    echo 'Shell command ' . command . ' executed.'
endfunction " }}}
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
nnoremap <leader>! :Shell 

" }}}
" Convenience mappings ---------------------------------------------------- {{{

" Clean trailing whitespace
nnoremap <leader>ts :%s/\s\+$//<cr>:let @/=''<cr>

" Change case
nnoremap <C-u> g~iw
inoremap <C-u> <esc>g~iwea

" Substitute
nnoremap <leader>f :%s//<left>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-h> <left>
cnoremap <c-l> <right>

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Easier linewise reselection
nnoremap <leader>V V`]

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc><right>mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" HTML tag closing
" inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" I'm too lazy for Shift-;
nnoremap ;; :

" Cmdheight switching
nnoremap <leader>1 :set cmdheight=1<cr>
nnoremap <leader>2 :set cmdheight=2<cr>

" Source
" vnoremap <leader>S y:execute @@<cr>
" nnoremap <leader>S ^vg_y:execute @@<cr>

" Replaste
" nnoremap <D-p> "_ddPV`]=

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Calculator
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>=

" Better Completion
set completeopt=longest,menuone,preview

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" saving and quiting
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wall<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>Q :qall!<CR>
nnoremap <leader>s :wq<CR>
nnoremap <leader>S :wqall<CR>

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" I suck at typing.
" nnoremap <localleader>= ==
" vnoremap - =

" Easy filetype switching {{{
nnoremap _md :set ft=markdown<CR>
nnoremap _hd :set ft=htmldjango<CR>
nnoremap _jt :set ft=htmljinja<CR>
nnoremap _cw :set ft=confluencewiki<CR>
nnoremap _pd :set ft=python.django<CR>
nnoremap _d  :set ft=diff<CR>
" }}}

" Toggle paste
set pastetoggle=<F8>

" Quickreturn
inoremap <c-cr> <esc>A<cr>
inoremap <s-cr> <esc>A:<cr>

" Toggle [I]nvisible Characters
nnoremap <leader>I :set list!<cr>

" Indent Guides {{{

" let g:indentguides_state = 0
" function! IndentGuides() " {{{
"     if g:indentguides_state
"         let g:indentguides_state = 0
"         2match None
"     else
"         let g:indentguides_state = 1
"         execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
"     endif
" endfunction " }}}
" nnoremap <leader>i :call IndentGuides()<cr>

" }}}
" Block Colors {{{

" let g:blockcolor_state = 0
" function! BlockColor() " {{{
"     if g:blockcolor_state
"         let g:blockcolor_state = 0
"         call matchdelete(77880)
"         call matchdelete(77881)
"         call matchdelete(77882)
"         call matchdelete(77883)
"     else
"         let g:blockcolor_state = 1
"         call matchadd("BlockColor1", '^ \{4}.*', 1, 77880)
"         call matchadd("BlockColor2", '^ \{8}.*', 2, 77881)
"         call matchadd("BlockColor3", '^ \{12}.*', 3, 77882)
"         call matchadd("BlockColor4", '^ \{16}.*', 4, 77883)
"     endif
" endfunction " }}}
" nnoremap <leader>B :call BlockColor()<cr>

" }}}
" Insert Mode Completion {{{

inoremap <c-l> <c-x><c-l>
inoremap <c-f> <c-x><c-f>

" }}}

" }}}
" CTags ------------------------------------------------------------------- {{{

" For some reason ctags refuses to ignore Python variables, so I'll just hack
" the tags file with sed and strip them out myself.
"
" Sigh.
nnoremap <leader><cr> :silent !ctags -R . && sed -i .bak -E -e '/^[^	]+	[^	]+.py	.+v$/d' tags<cr>

" }}}
" Plugins ----------------------------------------------------------------- {{{

" Ack {{{

map <leader>a :Ack! 

" }}}
" Autoclose {{{

nmap <Leader>x <Plug>ToggleAutoCloseMappings

" }}}
" Commentary {{{

nmap <leader>c <Plug>CommentaryLine
xmap <leader>c <Plug>Commentary
" au FileType htmldjango setlocal commentstring={#\ %s\ #}

" }}}
" Ctrl-P {{{

let g:ctrlp_dont_split = 'NERD_tree'
let g:ctrlp_jump_to_buffer = 0
" let g:ctrlp_map = '<leader>,'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']
let g:ctrlp_cache_dir = $HOME.'.vim/tmp/ctrlp'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multi = '1t'
let g:ctrlp_arg_map = 1

let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }

let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "deploy/|lib/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/" . 
    \ ")'"

let my_ctrlp_user_command = "" . 
    \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps

" let my_ctrlp_git_command = "" . 
"     \ "cd %s && git ls-files | " .
"     \ ctrlp_filter_greps

" let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]
let g:ctrlp_user_command = ['.git/', my_ctrlp_user_command]

nnoremap <leader>. :CtrlPTag<cr>

" }}}
" Fugitive {{{

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
" nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
" nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END
" "Hub" 
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>

" }}}
" Gist {{{
let g:gist_cookie_dir = '~/.vim/private/gist/cookies'
let g:gist_private = 1
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
" }}}
" Gundo {{{

nnoremap <leader>u :GundoToggle<CR>
" let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
let g:gundo_tree_statusline = "Gundo"
let g:gundo_preview_statusline = "Gundo Preview"

" }}}
" HTML5 {{{

" let g:event_handler_attributes_complete = 0
" let g:rdfa_attributes_complete = 0
" let g:microdata_attributes_complete = 0
" let g:atia_attributes_complete = 0

" }}}
" Makegreen {{{

" nnoremap \| :call MakeGreen('')<cr>

" }}}
" NERD Tree {{{

noremap  <d-i> :NERDTreeToggle<cr>
inoremap <d-i> <esc>:NERDTreeToggle<cr>

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$',
\                    'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py',
\                    '.*-fixtures-.*.json', '.*\.o$', 'db.db', 'tags.bak']
let NERDTreeBookmarksFile = $HOME.'/.vim/tmp/NERDTreeBookmarks'

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" }}}
" OrgMode {{{

let g:org_plugins = ['ShowHide', '|', 'Navigator', 'EditStructure', '|', 'Todo', 'Date', 'Misc']

let g:org_todo_keywords = ['TODO', '|', 'DONE']

let g:org_debug = 0

" }}}
" Powerline {{{

let g:Powerline_symbols = 'fancy'

" }}}
" Python-Mode {{{

" let g:pymode_doc = 1
" let g:pymode_doc_key = '<localleader>ds'
" let g:pydoc = 'pydoc'
" let g:pymode_syntax = 0
" let g:pymode_syntax_all = 0
" let g:pymode_run = 0
" let g:pymode_lint = 0
" let g:pymode_breakpoint = 0
" let g:pymode_utils_whitespaces = 0
" let g:pymode_virtualenv = 0

" let g:pymode_options_indent = 0
" let g:pymode_options_fold = 0
" let g:pymode_options_other = 0

" let g:pymode_rope = 1
" let g:pymode_rope_global_prefix = "<localleader>R"
" let g:pymode_rope_local_prefix = "<localleader>r"
" let g:pymode_rope_auto_project = 1
" let g:pymode_rope_enable_autoimport = 0
" let g:pymode_rope_autoimport_generate = 1
" let g:pymode_rope_autoimport_underlineds = 0
" let g:pymode_rope_codeassist_maxfixes = 10
" let g:pymode_rope_sorted_completions = 1
" let g:pymode_rope_extended_complete = 1
" let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
" let g:pymode_rope_confirm_saving = 1
" let g:pymode_rope_vim_completion = 1
" let g:pymode_rope_guess_project = 1
" let g:pymode_rope_goto_def_newwin = 0
" let g:pymode_rope_always_show_complete_menu = 0

" }}}
" Scratch {{{

command! ScratchToggle call ScratchToggle()

function! ScratchToggle() " {{{
  if exists("w:is_scratch_window")
    unlet w:is_scratch_window
    exec "q"
  else
    exec "normal! :Sscratch\<cr>\<C-W>J:resize 13\<cr>"
    let w:is_scratch_window = 1
  endif
endfunction " }}}

nnoremap <silent> <leader><tab> :ScratchToggle<cr>

" }}}
" Sparkup {{{

let g:sparkupNextMapping = '<c-s>'
let g:sparkupExecuteMapping = '<c-d>'

"}}}
" Supertab {{{

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1

"}}}
" Syntastic {{{

let g:syntastic_enable_signs = 1
" let g:syntastic_disabled_filetypes = ['html']
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
" let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'

" }}}
" Threesome {{{

let g:threesome_leader = "-"

let g:threesome_initial_mode = "grid"

let g:threesome_initial_layout_grid = 1
let g:threesome_initial_layout_loupe = 0
let g:threesome_initial_layout_compare = 0
let g:threesome_initial_layout_path = 0

let g:threesome_initial_diff_grid = 1
let g:threesome_initial_diff_loupe = 0
let g:threesome_initial_diff_compare = 0
let g:threesome_initial_diff_path = 0

let g:threesome_initial_scrollbind_grid = 0
let g:threesome_initial_scrollbind_loupe = 0
let g:threesome_initial_scrollbind_compare = 0
let g:threesome_initial_scrollbind_path = 0

let g:threesome_wrap = "nowrap"

" }}}
" ViewDoc {{{
let g:viewdoc_open = 'rightbelow vnew'
" let g:viewdoc_only=1
" au VimEnter * let g:ViewDoc_DEFAULT = function('g:ViewDoc_help')

" }}}
" XPTemplate {{{
" Set personal snippet folder location:
let g:xptemplate_snippet_folders=['$HOME/.vim/local/xptemplate']
" Turn off automatic closing of quotes and braces:
let g:xptemplate_brace_complete = 0
" Suppertab support
" avoid key conflict
let g:SuperTabMappingForward = '<Plug>supertabKey'
" if nothing matched in xpt, try supertab
let g:xptemplate_fallback = '<Plug>supertabKey'
" xpt uses <Tab> as trigger key
let g:xptemplate_key = '<Tab>'
" Open the pop-up menu:
let g:xptemplate_key_pum_only = '<Leader><Tab>'
" Clear current placeholder and jump to the next:
imap <C-d> <Tab>
let g:xptemplate_nav_cancel = '<C-d>'
" Move to the next placeholder in a snippet:
let g:xptemplate_nav_next = '<Tab>'
" Move cursor back to last placeholder:
let g:xptemplate_goback = '<C-g>'
" " use <tab>/<S-tab> to navigate through pum. Optional
let g:xptemplate_pum_tab_nav = 1
" " xpt triggers only when you typed whole name of a snippet. Optional
" let g:xptemplate_minimal_prefix = 'full'
let g:xptemplate_vars = "author=Alex Lov&email=alex@alexlov.com"
" }}}
" YankRing {{{

nnoremap <D-y> :YRShow<CR>
function! YRRunAfterMaps()
    nnoremap Y :<C-U>YRYankCount 'Y'<CR>
    " omap <expr> L YRMapsExpression("", "$")
    " omap <expr> H YRMapsExpression("", "^")
endfunction


" }}}

" }}}
" Text objects ------------------------------------------------------------ {{{
"
" Next and Last {{{

" Motion for "next/last object". For example, "din(" would go to the next "()"
" pair and delete its contents.

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" }}}
"
" }}}
" Environments (GUI/Console) ---------------------------------------------- {{{
if has('gui_running')
    set guifont=Menlo\ for\ Powerline:h12

    " Remove all the UI cruft
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Different cursors for different modes.
    " set guicursor=n-c:block-Cursor-blinkon0
    " set guicursor+=v:block-vCursor-blinkon0
    " set guicursor+=i-ci:ver20-iCursor
    " Disable blinking cursor in all modes
    set guicursor+=a:blinkon0

    if has("gui_macvim")
        " Full screen means FULL screen
        set fuoptions=maxvert,maxhorz

        " Use the normal HIG movements, except for M-Up/Down
        let macvim_skip_cmd_opt_movement = 1
        no   <D-Left>       <Home>
        no!  <D-Left>       <Home>
        no   <M-Left>       <C-Left>
        no!  <M-Left>       <C-Left>

        no   <D-Right>      <End>
        no!  <D-Right>      <End>
        no   <M-Right>      <C-Right>
        no!  <M-Right>      <C-Right>

        no   <D-Up>         <C-Home>
        ino  <D-Up>         <C-Home>
        imap <M-Up>         <C-o>{

        no   <D-Down>       <C-End>
        ino  <D-Down>       <C-End>
        imap <M-Down>       <C-o>}

        imap <M-BS>         <C-w>
        inoremap <D-BS>     <esc>my0c`y
    else
        " Non-MacVim GUI, like Gvim
    end
else
    " Console Vim
endif

" }}}
