set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax on
" colorscheme OceanicNext

" colorscheme gruvbox
" let g:gruvbox_contrast_dark='hard'

" colorscheme plastic
" colorscheme onedark

" let g:airline_theme='oceanicnext'
" let g:airline_theme='gruvbox'
" let g:airline_theme='onedark'


" From nicknisi's vimrc
" Colorscheme and final setup {{{
    " This call must happen after the plug#end() call to ensure
    " that the colorschemes have been loaded
    if filereadable(expand("~/.vimrc_background"))
        let base16colorspace=256
        source ~/.vimrc_background
    else
        let g:onedark_termcolors=16
        let g:onedark_terminal_italics=1
        colorscheme onedark
    endif
