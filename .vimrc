" Term: " {{{
if &term =~ 'xterm' || $TERM =~ 'xterm-256color'
    if has('terminfo')
        set ttyfast
        set t_Co=256
        "光标的形状或颜色
        let &t_SI = "\<Esc>]12;lightgreen\x7"
        let &t_EI = "\<Esc>]12;RoyalBlue1\x7"
    endif
endif
" }}}

" General: "{{{

set nocompatible               " be iMproved

set history=256                " Number of things to remember in history.
set updatetime=1000
"set timeoutlen=250             " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed         " Yanks go on clipboard instead.
set pastetoggle=<F10>          " toggle between paste and normal: for 'safer' pasting from keyboard
set shiftround                 " round indent to multiple of 'shiftwidth'
set tags=./tags;$HOME          " walk directory tree upto $HOME looking for tags

set modeline
set modelines=5                " default numbers of lines to read for modeline instructions

set helplang=cn,en

set autowrite                  " Writes on make/shell commands
set autoread

set nobackup
set nowritebackup
set directory=/tmp//           " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set noswapfile                 "

set hidden                     " The current buffer can be put to the background without writing to disk

set hlsearch                   " highlight search
set smartcase                  " be case sensitive when input has a capital letter
set incsearch
set magic                      "除了 $ . * ^ 之外其他元字符都要加反斜杠
set ignorecase

set nobomb
set formatoptions+=mm
set fileformat=unix
set fileformats=unix,dos,mac
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,big5,cp936,chinese,euc-jp,euc-kr,latin1

let g:is_posix=1               " vim's default is archaic bourne shell, bring it up to the 90s
let mapleader=","
" "}}}

" Formatting: "{{{

set fo+=o                      " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment leader after an enter
set fo-=t                      " Do no auto-wrap text using textwidth (does not apply to comments)

set wrap
"set linebreak

set tabstop=4                  " tab size eql 2 spaces
set softtabstop=4
set shiftwidth=4               " default shift width for indents
set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab

set backspace=eol,start,indent
"set whichwrap+=[,],<,>,h,l

set autoindent
set cindent
"set smartindent
set indentkeys-=0#             " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

" "}}}

" Visual: "{{{

syntax on                      " enable syntax

if has('mouse')
    set mouse=a "enable mouse in GUI mode
    set mousehide                 " Hide mouse after chars typed
endif

set mouse=v

set number                    " line numbers Off
set showmatch                 " Show matching brackets.
set matchtime=2               " Bracket blinking.

set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set completeopt+=preview
set novisualbell              " No blinking
set noerrorbells              " No noise.
set t_vb=                     " disable any beeps or flashes on error

set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline

set virtualedit=onemore       "允许操作最后一个字符

set scrolloff=3               "光标在窗口上下边界时距离边界5行即开始滚屏
set sidescrolloff=7
set sidescroll=1
set wildmenu                  "命令行补全以增强模式运行

set textwidth=79

set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim
set titlelen=95

"set cursorline               "highlight current line
set fillchars=vert:\ ,stl:\ ,stlnc:\

"http://vim.wikia.com/wiki/All_folds_open_when_open_a_file
set foldenable                " Turn on folding
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax python setlocal foldmethod=indent
set foldlevelstart=20

set splitbelow
set splitright

set list                      " display unprintable characters f12 - switches
set listchars=tab:▸\
"set listchars+=eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<CR>

"set lines=40 columns=80
" "}}}

" KeyMappings: " {{{
"强制禁止自己使用上下左右键
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <leader><space> :noh<cr>

nnoremap <leader>ss :source ~/.vimrc<CR>
nnoremap <leader>ee :e ~/.vimrc<CR>

au FileType c,cpp nmap <buffer> <F5> :make<CR>

" Tabs
nnoremap <silent> <S-h> :tabprev<CR>
noremap <silent> <S-l> :tabnext<CR>

map <S-o> o<ESC>

" Make Control-direction switch between windows (like C-W h, etc)
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" generate HTML version current buffer using current color scheme
map <leader>2h :runtime! syntax/2html.vim<CR>
set pastetoggle=<F2>

cmap w!! w !sudo tee % > /dev/null
" " }}}

" AutoCommands: " {{{
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown wrap
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit noml list| norm 1G
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()
" open help in vertical split
"au BufWinEnter *.txt if &ft == 'help' | wincmd H | endif
" " }}}

" ScriptsAndBundles: " {{{
filetype off
runtime macros/matchit.vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'rodjek/vim-puppet.git'

" Language
Bundle 'vim-scripts/python.vim.git'
Bundle 'jimenezrick/vimerl.git'

" Colorscheme
Bundle 'noah/vim256-color.git'
Bundle 'atomd/snipmate.vim.git'

Bundle 'vim-scripts/taglist.vim.git'
"let Tlist_Ctags_Cmd="/usr/bin/ctags-exuberant"  "如果没有在PATH变量中设置
let Tlist_Show_One_File=1  "只显示一个文件的tag
"let Tlist_OnlyWindow=1
let Tlist_Use_Right_Window=1  "设置在右侧显示
let Tlist_Sort_Type='name'  "以tag名字进行排序，缺省是文件中出现的顺序
let Tlist_Exit_OnlyWindow=1  "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Show_Menu=1  "在gvim中，如果你想显示taglist菜单
"let Tlist_Max_Submenu_Items=10  "菜单条目数
"let Tlist_Max_Tag_length=20  "所显示tag名字的长度
let Tlist_Use_SingleClick=0
"let Tlist_Auto_Open=1  "设置自动打开taglist
"let Tlist_Close_On_Select=1  "选择了tag后自动关闭taglist窗口
let Tlist_File_Fold_Auto_Close=1  "显示多文件tag时只显示当前文件tag，其它文件tag折叠起来。
"let Tlist_GainFocus_On_ToggleOpen=1  "输入焦点在taglist窗口
"let Tlist_Process_File_Always=1  "taglist始终解析文件中的tag，不管taglist窗口有没有打开
"let Tlist_WinHeight=10
let Tlist_WinWidth=45
"let Tlist_Use_Horiz_Window=0 "设置水平显示
nnoremap <silent><leader>tt :TlistToggle<cr>

Bundle 'corntrace/bufexplorer.git'
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
"let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 10  " Split width
"let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber

Bundle 'ervandew/supertab.git'
Bundle 'vim-scripts/Mark--Karkat.git'
Bundle 'kevinw/pyflakes-vim.git'
let g:pyflakes_use_quickfix = 0
Bundle 'guns/xterm-color-table.vim'

Bundle 'scrooloose/nerdtree.git'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
noremap <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
noremap <silent> <leader>D :NERDTreeFind<CR>
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'
"autocmd vimenter * if !argc() | NERDTree | endif

filetype plugin indent on      " Automatically detect file types.

" }}}

" GUI: " {{{

if &term =~ '^\(xterm\|screen\|screen-256color\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

if has('gui_running')
    set guioptions=cMg " console dialogs, do not show menu and toolbar
    set guitablabel=%{GuiTabLabel()}
    set toolbar=icons
    set toolbariconsize=tiny
    " Toggle Menu and Toolbar
    map <silent> <F11> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
        \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
        \endif<CR>

    colorscheme molokai
    let g:pretty_statusline=1

elseif &t_Co >= 256
    colorscheme molokai
    " colorscheme wombat256p
    " colorscheme railscasts
else
   colorscheme evening
endif

set cursorline
if exists('+colorcolumn')
    set colorcolumn=80
    hi ColorColumn ctermbg=236  guibg=#363636
else
    augroup vimrc_autocmds
        autocmd BufEnter * highlight OverLength ctermbg=236 guibg=#363636
        autocmd BufEnter * match OverLength /\%81v/ "/\%81v.*/
    augroup END
endif

" }}}

"让vim记忆上次编辑的位置
autocmd BufReadPost *
            \ if line("'\"")>0&&line("'\"")<=line("$") |
            \   exe "normal g'\"" |
            \ endif
"让vim记忆上次编辑的位置

"powerline的设置
"let g:Powerline_symbols='fancy'
"set nocompatible
"set t_Co=256
"let g:Powerline_cache_enabled=1
"let g:Powerline_cache_file='~/.vim/bundle/powerline/Powerline.cache'
"set laststatus=2 "Always show the statusline

"Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
