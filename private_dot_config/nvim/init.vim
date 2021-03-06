set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set nocompatible
set updatetime=1000
set clipboard=unnamed
set shiftwidth=4 
set tabstop=4

" Auto apply changes when editing dotfiles with chezmoi
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'honza/vim-snippets'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_imaps_leader='²'

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

Plug '907th/vim-auto-save'
let g:auto_save=1
let g:auto_save_events=["InsertLeave", "CursorHold", "CursorHoldI"]

" Disable vim indent
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0

Plug 'joshdick/onedark.vim',{'name':'onedark'}

Plug 'itchyny/lightline.vim'
let s:hidden_all = 1
set noshowmode

" Initialize plugin system
call plug#end()

" Dracula
colorscheme onedark

" Spellcheck
setlocal spell
set spelllang=fr,en
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
set complete+=kspell

" Duplicate paragraph
vmap <C-p> y'>p

" Right and left arrow go to next/previous line
set whichwrap+=<,>,[,]

" Allow the cursor to go after the last character
set ve+=onemore 

" Auto break line after 90 chars
set tw=90

" Ctrl F to edit figures in Latex mode (see Gilles Castel blog)
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

