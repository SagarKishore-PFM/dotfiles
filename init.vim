" My vimrc. I use neovim but most of these configs should work with vim as well barring the async plugins
" NOTE: 
" Color schemes now set in neovim's init.vim

" Basic 

set nocompatible        " get rid of Vi compatibility mode. SET FIRST!
syntax on               " enable syntax processing set ruler
set encoding=utf-8      " UTF-8 support
set autoindent          " auto-indent
set t_Co=256            " enable 256-color mode.
set termguicolors       " Better colors
set autoread            " Auto reload changed files
set wildmenu            " Tab autocomplete in command mode
set tags=tags           " Use tags
set nowrap              " Don't wrap long lines
set showcmd             " Show commands typed in the bottom bar
set background=dark
set history=1000        " change history to 1000
set shell=$SHELL
set cmdheight=1         " Command bar height
set title               " Set terminal title
set showmatch
set clipboard=unnamed   " Better copy pasting across system`
set cursorline          " Highlight the line the cursor points to
" Spaces and Tabs

set smarttab            " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4           " the visible width of tabs
set softtabstop=4       " edit as if the tabs are 4 characters wide
set shiftwidth=4        " number of spaces to use for indent and unindent
set shiftround          " round indent to a multiple of 'shiftwidth'

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

" Toggle Inivisble characters
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set showbreak=↪
set list

" UI

set number              " show line numbers
set relativenumber      " Show relative line numbers
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set inccommand=nosplit

" Searching

set incsearch           " search as characters are entered
set hlsearch            " highlight matches


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

" Switch to mark{a-zA-Z} key changed from ` to s
nnoremap s `

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map CAPS LOCK to ESCAPE on entering vim and remove mapping on leaving vim
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Lazy commands with ;
nnoremap : ;
nnoremap ; :

" clear search highlights with F3
nnoremap <F3> :set hlsearch!<CR>

" Leader Shortcuts
let mapleader=","       " leader is comma

" enable . command in visual mode
vnoremap . :normal .<cr>

" Move line using Alt-j, Alt-k (from nicknisi's vimrc)
nnoremap <A-j> :m .+1<cr>==
nnoremap <A-k> :m .-2<cr>==
inoremap <A-j> <Esc>:m .+1<cr>==gi
inoremap <A-k> <Esc>:m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv

" Toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" Vim-plug section
call plug#begin('~/.config/nvim/plugged')
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------

" Tim Pope's sensible plug-in 
Plug 'tpope/vim-sensible'


" NERDTree {{{
	" NERD tree will be loaded on the first invocation of NERDTreeToggle command
	Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}

	" Git features
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" NerdTree Syntax highlight 
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	" NerdTree Toggle keymap
	map <C-n> ;NERDTreeToggle<CR>	
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close NerdTree if it is the only window open

	" NerdTree Ignore *.pyc files
	let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
	" let g:WebDevIconsOS = 'Darwin'
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
	let g:DevIconsEnableFoldersOpenClose = 1
	let g:DevIconsEnableFolderExtensionPatternMatching = 1

	augroup nerdtree
		autocmd!
		autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
	augroup END

	let NERDTreeShowHidden=1
	let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
	let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
" }}}


" Airline the bar at the bottom {{{
	Plug 'vim-airline/vim-airline'
	" Airline settings
	" Automatically displays all buffers when there's only one tab open.
	let g:airline#extensions#tabline#enabled = 1

	" path formatter
	let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" }}}


" Airline-themes
Plug 'vim-airline/vim-airline-themes'

" Surround Vim
Plug 'tpope/vim-surround'


" You Complete Me {{{
	" Note - See this for Python https://github.com/ycm-core/YouCompleteMe#python-semantic-completion

	Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

	" YCM Settings
	let g:ycm_min_num_of_chars_for_completion = 1    " Suggest after 1 char
	let g:ycm_error_symbol = '!'
	let g:ycm_warning_symbol = '?'
	let g:ycm_autoclose_preview_window_after_completion = 1 " close p preview after completion
	let g:ycm_autoclose_preview_window_after_insertion = 1 " close preview after insertion
	" let g:ycm_min_num_of_chars_for_completion = 99 " Force Identifier completion to not popup and instead use Semantic
	let g:ycm_collect_identifiers_from_tags_files = 0
	let g:ycm_extra_conf_globlist = ['~/Projects/*']
	let g:ycm_key_list_stop_completion = ['<ENTER>']
	" let g:ycm_key_invoke_completion = '<S-Space>'
	" jump to defn remapped to ,jd
	nnoremap <leader>jd :YcmCompleter GoTo<CR>       
" }}}


" Fugitive the git plugin that makes it look like vscode
Plug 'tpope/vim-fugitive'

" Indent Guides - Adds visuals for indents
Plug 'nathanaelkane/vim-indent-guides'

" Git gutter - shows + and - in the gutter like vscode
Plug 'airblade/vim-gitgutter'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']}


" Tagbar {{{
	Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

	" Tagbar toggle shortcut to F8
	nnoremap <F8> :TagbarToggle<CR>
" }}}


" Rainbow Parens {{{
	" Plug 'kien/rainbow_parentheses.vim'

	" Rainbow Parens customizations
	" Always On
	" au VimEnter * RainbowParenthesesToggle
	" au Syntax * RainbowParenthesesLoadRound
	" au Syntax * RainbowParenthesesLoadSquare
	" au Syntax * RainbowParenthesesLoadBraces
" }}}

" CSS colors inside vim
Plug 'ap/vim-css-color', {'for': 'css'}

" MD Syntax
Plug 'plasticboy/vim-markdown'

" Syntastic for syntax checks {{{
" Plug 'scrooloose/syntastic', {'for': 'css'}

" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" }}}


" Async syntax check for neovim
Plug 'neomake/neomake'

" Syntax highlight pack
Plug 'sheerun/vim-polyglot'

" Comments
Plug 'tpope/vim-commentary'

" Wakatime
Plug 'wakatime/vim-wakatime'

" Flake8
Plug 'nvie/vim-flake8', {'for': 'python'}


" DevIcons in Vim {{{
	Plug 'ryanoasis/vim-devicons'

	" DevIcons config
	" Can be enabled or disabled
	let g:webdevicons_enable_nerdtree = 1

	" whether or not to show the nerdtree brackets around flags
	let g:webdevicons_conceal_nerdtree_brackets = 1

	" adding to vim-airline's tabline
	let g:webdevicons_enablea_airline_tabline = 1

	" adding to vim-airline's statusline
	let g:webdevicons_enable_airline_statusline = 1

	" pad glyphs with spaces
	let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
	" DevIcon fix for nerdtree
	" after a re-source, fix syntax matching issues (concealing brackets):
	if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
	endif
" }}}


" Better Comments
Plug 'jbgutierrez/vim-better-comments'

" Gundo - Better undos {{{
	Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

	" Gundo Toggle keymap
	nnoremap <F5> :UndotreeToggle<CR>
" }}}

" Ctags
Plug 'universal-ctags/ctags'

" Startify
Plug 'mhinz/vim-startify'


" Gutentags (Better tags) {{{
	Plug 'ludovicchabant/vim-gutentags'

	" Gutentags config
	set statusline+=%{gutentags#statusline()}
" }}}


" Highligh yanks
Plug 'machakann/vim-highlightedyank'

" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Tmux focus
Plug 'tmux-plugins/vim-tmux-focus-events'


" Better pasting
Plug 'sickill/vim-pasta'

" Color Schemes {{{
	Plug 'rafi/awesome-vim-colorschemes'

	Plug 'joshdick/onedark.vim'

	Plug 'flrnprz/plastic.vim'

	Plug 'chriskempson/base16-vim'

	Plug 'ajh17/spacegray.vim'

	Plug 'morhetz/gruvbox'

	Plug 'sainnhe/gruvbox-material'
" }}}
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
call plug#end()

" Neomake settings
" {{{
    " neomake is async => it doesn't block the editor
    " It's a syntastic alternative. Syntastic was slow for me on python files.
    " $ sudo pip2/pip3 install flake8 -U
    " $ sudo pip2/pip3 install vulture -U
    let g:neomake_python_enabled_makers = ['flake8']
    " E501 is line length of 80 characters
    let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501'], }
 
    " run neomake on the current file on every write:
    autocmd! BufWritePost * Neomake
	" }}}
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" colorscheme
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
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
