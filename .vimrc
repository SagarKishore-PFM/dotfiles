" Basic
set encoding=utf-8
set nocompatible        " get rid of Vi compatibility mode. SET FIRST!
syntax enable          	" enable syntax processing
set ruler               " Always show info along bottom.
set autoindent          " auto-indent
"" set t_Co=256            " enable 256-color mode.
set termguicolors		" Gruvbox said so

" showcase comments in italics
highlight Comment cterm=italic gui=italic

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

" Color Scheme
"" colorscheme badwolf     	" awesome colorscheme

" Spaces and Tabs
" For PEP8 Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    " \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    " \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" For JS, HTML, CSS
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Better Tabs
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

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
nnoremap <space> za


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
set showcmd                           " Show size of visual selection

" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Ctrl Space remapped to omni completion
" inoremap <C-Space> <C-x><C-o>
" inoremap <C-@> <C-Space>

" Lazy commands with ;
nnoremap : ;
nnoremap ; :

" clear search highlights with leader leader (,,)
nnoremap <F3> :set hlsearch!<CR>


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
Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']}

" Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" Rainbow Parens
Plug 'kien/rainbow_parentheses.vim'

" CSS colors inside vim
Plug 'ap/vim-css-color', {'for': 'css'}

" MD Syntax
Plug 'plasticboy/vim-markdown'

" Syntastic for syntax checks
Plug 'scrooloose/syntastic'

" Comments
Plug 'tpope/vim-commentary'

" Spacegray color theme https://github.com/ajh17/spacegray.vim
" Plug 'ajh17/spacegray.vim'

" Wakatime
Plug 'wakatime/vim-wakatime'

" Flake8
Plug 'nvie/vim-flake8', {'for': 'python'}

" DevIcons in Vim
Plug 'ryanoasis/vim-devicons'

" Better Comments
Plug 'jbgutierrez/vim-better-comments'

" Gundo - Better undos
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Ctags


"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
call plug#end()

" ? asdas
let g:airline_theme='gruvbox'

" NerdTree Toggle keymap
map <C-n> ;NERDTreeToggle<CR>	
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close NerdTree if it is the only window open

" Gundo Toggle keymap
nnoremap <F5> :UndotreeToggle<CR>

" Tagbar toggle shortcut to F8
nnoremap <F8> :TagbarToggle<CR>


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

" DevIcons config
" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

" adding to vim-airline's tabline
let g:webdevicons_enablea_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" DevIcon fix for nerdtree
" after a re-source, fix syntax matching issues (concealing brackets):
" if exists('g:loaded_webdevicons')
  " call webdevicons#refresh()
" endif


" Airline settings
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" path formatter
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"-------------------------------------------------------------------------------
" Neovim-specific configurations
"-------------------------------------------------------------------------------

" Navigate between vim buffers and tmux panels

let g:tmux_navigator_no_mappings=1
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>

tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<cr>
tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>

"Easy Tab select

tmap <leader>1 <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2 <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3 <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4 <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5 <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6 <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7 <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8 <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9 <C-\><C-n><Plug>AirlineSelectTab9

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" " Reloads vimrc after saving but keep cursor position
" if !exists(‘*ReloadVimrc’)
"    fun! ReloadVimrc()
"        let save_cursor = getcurpos()
"        source $MYVIMRC
"        call setpos(‘.’, save_cursor)
"    endfun
" endif
" autocmd! BufWritePost $MYVIMRC call ReloadVimrc()



" if has('nvim')
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" "  set termguicolors
" "  colorscheme NeoSolarized
" "  set background=dark

"   " Fix vim-tmux-navigator <C-h> https://git.io/viGRU
"   nmap <BS> <C-W>h

"   " Fix vim-tmux-navigator <C-h> https://git.io/vS5QH
"   nmap <BS> :<C-u>TmuxNavigateLeft<CR>
" endif




