" Basic
set encoding=utf-8
set nocompatible        " get rid of Vi compatibility mode. SET FIRST!
syntax enable          	" enable syntax processing
set ruler               " Always show info along bottom.
set autoindent          " auto-indent
"" set t_Co=256            " enable 256-color mode.
set termguicolors		" Gruvbox said so

colorscheme gruvbox

" Color Scheme
"" colorscheme badwolf     	" awesome colorscheme

" Spaces and Tabs
" For PEP8 Python
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" For JS, HTML, CSS
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Bad Whitespace
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UI

set number              " show line numbers
set relativenumber      " Show relative line numbers
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" Searching

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
"" nnoremap <space> za


set foldmethod=indent   " fold based on indent level


" Movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Leader Shortcuts

let mapleader=","       " leader is comma

" Map CAPS LOCK to ESCAPE on entering vim and remove mapping on leaving vim
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set showcmd                           " Show size of visual selection

" showcase comments in italics
highlight Comment cterm=italic gui=italic

" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Ctrl Space remapped to omni completion
" inoremap <C-Space> <C-x><C-o>
" inoremap <C-@> <C-Space>

" NerdTree Toggle keymap
map <C-n> :NERDTreeToggle<CR>	
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close NerdTree if it is the only window open


" Vim-plug section
call plug#begin('~/.config/nvim/plugged')
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------

" Tim Pope's sensible plug-in 
Plug 'tpope/vim-sensible'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Airline the bar at the bottom
Plug 'vim-airline/vim-airline'

" Airline-themes
Plug 'vim-airline/vim-airline-themes'

" Surround Vim
Plug 'tpope/vim-surround'

" You Complete Me - Note - See this for Python https://github.com/ycm-core/YouCompleteMe#python-semantic-completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Fugitive the git plugin that makes it look like vscode
Plug 'tpope/vim-fugitive'

" Indent Guides - Adds visuals for indents
Plug 'nathanaelkane/vim-indent-guides'

" Git gutter - shows + and - in the gutter like vscode
Plug 'airblade/vim-gitgutter'

" Color theme - Gruvbox https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Tagbar
Plug 'majutsushi/tagbar'

" Rainbow Parens
Plug 'kien/rainbow_parentheses.vim'

" CSS colors inside vim
Plug 'ap/vim-css-color'

" MD Syntax
Plug 'plasticboy/vim-markdown'

" Syntastic for syntax checks
Plug 'scrooloose/syntastic'

" Comments
Plug 'tpope/vim-commentary'

" Spacegray color theme https://github.com/ajh17/spacegray.vim
Plug 'ajh17/spacegray.vim'

" Wakatime
Plug 'wakatime/vim-wakatime'

" Flake8
Plug 'nvie/vim-flake8'

"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
call plug#end()

let g:airline_theme='gruvbox'

" Rainbow Parens customizations
" Always On
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" YCM Settings
let g:ycm_min_num_of_chars_for_completion = 1    " Suggest after 1 char


" jump to defn remapped to ,jd
nnoremap <leader>jd :YcmCompleter GoTo<CR>       

" NerdTree Ignore *.pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Airline settings
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" path formatter
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"-------------------------------------------------------------------------------
" Neovim-specific configurations
"-------------------------------------------------------------------------------

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  set termguicolors
"  colorscheme NeoSolarized
"  set background=dark

  " Fix vim-tmux-navigator <C-h> https://git.io/viGRU
  nmap <BS> <C-W>h

  " Fix vim-tmux-navigator <C-h> https://git.io/vS5QH
  nmap <BS> :<C-u>TmuxNavigateLeft<CR>
endif
