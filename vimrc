set nocp
set cursorline
set cursorcolumn
set colorcolumn=80

set showmatch

let g:SuperTabDefaultCompletionType = "context"

call pathogen#infect()
"
set encoding=utf-8
autocmd! bufwritepost .vimrc source %
set mouse=a
set noshowmode

let mapleader = ","

" Permet de quitter l'insert mode avec JK
inoremap jk <esc>

" F8 affiche les tags en pretty fancy uber kawai :3
nmap <F8> :TagbarToggle<CR>

" Permet la navigation entre tabs ,m ,n
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" Meilleur déplacement entre les buffers
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Quitte rapidement
map <Leader>e <esc>:quit<CR>
map <Leader>E <esc>:qa!<CR>

" Formatte les §
vmap Q qq
nmap Q gqap

" Recherche non sensible a la casse
set hlsearch
set incsearch
set ignorecase
set smartcase

"Enleve highlighting C^N
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"TAB stop
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" PAS de backup
set nobackup
set nowritebackup
set noswapfile

"" PARTIE THEME
""Surligne les espaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

set t_Co=16
set background=dark " dark | light "
colorscheme solarized

"syntax enable
syn on
syntax on
"filetype off
filetype plugin indent on

"" Omnicomplete vim, autocompletio
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction


inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
let g:SuperTabDefaultCompletionType = "context"


""NerdTree au demarrage, et curseur à droite
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"" NERDtree à chaque nouvel onglet
"autocmd BufEnter * wincmd p
"let g:solarized_termcolors=256

call togglebg#map("<F5>")
"irline
""""""""""""""""""""""""""""""
"let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
"let g:airline_enable_syntastic  = 1


let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"" PARTIE SYNTAXE

augroup filetypedetect
	au BufNewFile,BufRead .tmux.conf*, tmux.conf* set filetype=tmux
augroup END


" Multiple cursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Map start key separately from next key
let g:multi_cursor_start_key='<C-c>'


"jflex et cup

augroup filetype
	au BufRead,BufNewFile *.cup set filetype=cup
augroup END
au Syntax cup so ~/.vim/syntax/cup.vim

augroup filetype
    au BufRead,BufNewFile *.flex,*.jflex set filetype=jflex
augroup END
au Syntax jflex    so ~/.vim/syntax/jflex.vim


