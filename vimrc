" Basic
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
set tabstop=4       		" number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing

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
