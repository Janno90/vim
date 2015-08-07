" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'xolox/vim-misc'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'rking/ag.vim'
NeoBundle 'kien/ctrlp.vim'
"NeoBundle :sjl/gundo.vim'
NeoBundle 'mfukar/robotframework-vim'
"NeoBundle :majutsushi/tagbar'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'vim-scripts/vim-coffee-script'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'lunaru/vim-less'
NeoBundle 'tpope/vim-rails'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'vim-ruby/vim-ruby'
"NeoBundle :kshenoy/vim-signature'
NeoBundle 'slim-template/vim-slim'
"NeoBundle :tpope/vim-dispatch'
"NeoBundle :xolox/vim-easytags'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'scrooloose/syntastic'
"NeoBundle :tpope/vim-repeat'
"NeoBundle :chrisbra/csv.vim'
NeoBundle 'jgdavey/tslime.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'octol/vim-cpp-enhanced-highlight'

"NeoBundle 'tpope/vim-surround'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'rdnetto/YCM-Generator'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tomasr/molokai'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" General
set autoindent
set ts=2          "tabsize
set shiftwidth=2  "indentation width
set expandtab     "tabs as spaces
set showmatch
set ignorecase    "ignore case on search
set smartcase     "activate case if has uppercase letter
set hlsearch      "highlight search results
set incsearch
"set vb
"set ruler
"set scrolloff=2
"set laststatus=2
set list listchars=tab:-·,trail:· "Tab and trail show characters
"set nofoldenable
set wildmenu
set wildmode=list:longest,full
set laststatus=2

set lazyredraw
set scrolljump=5
set nocursorline
set nocursorcolumn

set backspace=indent,eol,start
set history=1000                  "undo history size

"set showcmd
"set showmode
"set autoread
"set smartindent
"set smarttab
set relativenumber               "Enable relative line numbers
set number                       "Show current line as normal line number
"set mouse=a

"set nowrap "Don't wrap lines
set linebreak "Wrap lines at convenient points

" Scrolling settings
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

"vim undo
set undofile
set undodir=~/.vim/undodir//

set backupdir=~/.vim/backupdir//
set directory=~/.vim/swapfiles//

" Colorscheme
set t_ut=
set background=dark
syntax enable
colorscheme molokai
set enc=utf-8
set term=screen-256color
let $TERM='screen-256color'

" Modifies matching tag colors
hi MatchParen ctermbg=0
hi MatchParen ctermfg=Red

"highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"shortcut F9 to syntax check
"autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

"shortcut f8 for tagbar
nmap <F8> :TagbarToggle<CR>

" now set it up to change the status line based on mode
"if version >= 700
"  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
"  au InsertLeave * hi StatusLine ctermbg=0 ctermfg=12
"endif

" Bind space as leader key
noremap <Space> <NOP>
let mapleader = " "

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"Leader + j or k to swap lines
:map <leader>j :m .+1<CR>==
:map <leader>k :m .-2<CR>==

" switch tabs with ö and ä
:map ö :tabp <Enter>
:map ä :tabn <Enter>

" " Normal mode
" switch lines
" nnoremap <DOWN> :m .+1<CR>==
" nnoremap <UP> :m .-2<CR>==

" Ö and Ä to switch lines
:map Ö :m .+1<CR>==
:map Ä :m .-2<CR>==

" hide search highlight
" noremap <C-l> :nohlsearch<CR>

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" disable Shift-K, because its annoys me
nnoremap K <NOP>

" also in insert mode
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" resize current buffer by +/- 5
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-down> :resize +5<cr>
nnoremap <C-up> :resize -5<cr>
nnoremap <C-right> :vertical resize +5<cr>

" Remove trailing whitespace with F4
:nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Added some commands because missclicking often
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Bind leader g to goto tag
noremap <leader>g <C-]>
noremap <leader>f g]

" Use tslime when running tests
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" ctrlp reload directory when changing working directory
" let g:ctrlp_working_path_mode = 0

" Map leader b to search from buffer
map <Leader>b :CtrlPBuffer<cr>

" Allow more search results for ctrlp
let g:ctrlp_match_window = 'results:30'

" Bind leader + p to open ctag search with ctrlp
" nnoremap <leader>p :CtrlPTag<cr>

" Gundo
" nnoremap <F5> :GundoToggle<CR>

" Ultisnips shortcuts
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"

" Tags
"set tags=tags;/
"let g:easytags_dynamic_files = 1
"let g:easytags_events = ['BufWritePost']
"let g:easytags_auto_highlight = 0
"let g:easytags_async = 1

" YankRing shortcuts
let g:yankring_replace_n_pkey = '<C-n>'
nnoremap <silent> <F3> :YRShow<CR>

" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
