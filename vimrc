set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Custom plugins
Plugin 'git@github.com:xolox/vim-misc.git'
Plugin 'git@github.com:scrooloose/nerdtree.git'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
Plugin 'git@github.com:rking/ag.vim.git'
Plugin 'git@github.com:kien/ctrlp.vim.git'
"Plugin 'git@github.com:sjl/gundo.vim.git'
Plugin 'git@github.com:mfukar/robotframework-vim.git'
"Plugin 'git@github.com:majutsushi/tagbar.git'
Plugin 'git@github.com:bling/vim-airline.git'
Plugin 'git@github.com:tpope/vim-bundler.git'
Plugin 'git@github.com:vim-scripts/vim-coffee-script.git'
Plugin 'git@github.com:Lokaltog/vim-easymotion.git'
Plugin 'git@github.com:tpope/vim-fugitive.git'
Plugin 'git@github.com:airblade/vim-gitgutter.git'
Plugin 'git@github.com:lunaru/vim-less.git'
Plugin 'git@github.com:tpope/vim-rails.git'
Plugin 'git@github.com:thoughtbot/vim-rspec.git'
Plugin 'git@github.com:vim-ruby/vim-ruby.git'
"Plugin 'git@github.com:kshenoy/vim-signature.git'
Plugin 'git@github.com:slim-template/vim-slim.git'
"Plugin 'git@github.com:tpope/vim-dispatch.git'
"Plugin 'git@github.com:xolox/vim-easytags.git'
Plugin 'git@github.com:vim-scripts/YankRing.vim.git'
Plugin 'git@github.com:scrooloose/syntastic.git'
Plugin 'git@github.com:tpope/vim-repeat.git'
"Plugin 'git@github.com:chrisbra/csv.vim.git'
Plugin 'git@github.com:jgdavey/tslime.vim.git'
Plugin 'git@github.com:christoomey/vim-tmux-navigator.git'
Plugin 'git@github.com:octol/vim-cpp-enhanced-highlight.git'

"Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'rdnetto/YCM-Generator'
Plugin 'honza/vim-snippets'

call vundle#end()

filetype plugin on
filetype plugin indent on
syntax on

"augroup rubypath
"  autocmd!
"  autocmd FileType ruby setlocal suffixesadd+=.rb
"augroup END


" Gneral
set autoindent
set ts=2          "tabsize
set shiftwidth=2  "indentation width
set expandtab     "tabs as spaces
set showmatch
set ignorecase    "ignore case on search
set hlsearch      "highlight search results
set smartcase
set incsearch
set vb
set ruler
set scrolloff=2
set laststatus=2
set list listchars=tab:-·,trail:· "Tab and trail show characters
set nofoldenable
set wildmenu
set wildmode=list:longest,full

set backspace=indent,eol,start
set history=1000                  "undo history size
set showcmd
set showmode
set autoread
set smartindent
set smarttab
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
set undodir=~/.vim/undodir

" Colorscheme
set t_Co=256
colorscheme molokai

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
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

"shortcut f8 for tagbar
nmap <F8> :TagbarToggle<CR>

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=0 ctermfg=12
endif

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

" Use tslime when running tests
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" ctrlp reload directory when changing working directory
let g:ctrlp_working_path_mode = 0

" Tmux background bug fix
if &term =~ '256color'
  set t_ut=
endif

" Map leader b to search from buffer
map <Leader>b :CtrlPBuffer<cr>

" Allow more search results for ctrlp
let g:ctrlp_match_window = 'results:30'

" Bind leader + p to open ctag search with ctrlp
nnoremap <leader>p :CtrlPTag<cr>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Ultisnips shortcuts
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"

" Tags
set tags=tags;/
let g:easytags_dynamic_files = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_auto_highlight = 0
let g:easytags_async = 1

" YankRing shortcuts
let g:yankring_replace_n_pkey = '<C-n>'
nnoremap <silent> <F3> :YRShow<CR>

" Gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

source ~/.vim/scripts/closetag.vim
