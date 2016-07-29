"========================================================================
"Plugins

"Vundle
set nocompatible
filetype off

"Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/unite.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
Plugin 'wesQ3/vim-windowswap'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
call vundle#end()
filetype plugin indent on

"========================================================================
"Plugin Config

nnoremap <SPACE> <Nop>
let mapleader = " "

"Pane width (applies to drawers, e.g. Nerdtree, undo trees)
let paneWidth = 25
"Pane height (apples to horizontal drawers, such as unite and ctrlp)
let paneHeight = 12

"Nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeWinSize=paneWidth
nnoremap <leader>n :NERDTreeToggle<CR>

"Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
nnoremap <leader>t :Tagbar<CR>

"Unite
call unite#custom#profile('default', 'context', {
\   'start-insert' : 1,
\   'winheight' : paneHeight,
\ })
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <leader>uf :Unite file -start-insert<CR>
nnoremap <leader>ub :Unite buffer -start-insert<CR>

"Airline
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

"Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys = 'asdfjkl;ghewiovn'
nmap s <Plug>(easymotion-bd-w)

"========================================================================
"Other commands and shortcuts

"Split navigation.
nnoremap <leader>v :vsplit<CR><C-W><C-L>
nnoremap <leader>h :split<CR><C-W><C-J>

"<C-W><C-J>
nnoremap <C-J> :echo "Use Temp"
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Common shortcuts.
nnoremap ; :
inoremap jj <ESC>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>aq :qa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :e<SPACE>

"Dealing with the global register.
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"Paste from clipboard.
nnoremap <leader>ip :r !pbpaste<CR>

"Get off my lawn.
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"Quicker window movement.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"========================================================================
"Some general settings

set backspace=2
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite
set hlsearch
set nu
set encoding=utf-8
set fileencoding=utf-8
set cursorline
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent
set ignorecase
set visualbell

"Open new split panes to right and bottom, which feels more natural.
set splitbelow
set splitright

"Always use vertical diffs.
set diffopt+=vertical

"Display extra whitespace.
set list listchars=tab:»·,trail:·,nbsp:·

"Make it obvious where 80 characters is.
set textwidth=80
set colorcolumn=+1

"Colorscheme
syntax enable
set background=dark
colorscheme darkblue
let &t_Co=256

augroup vimrcEx
  autocmd!
  "When editing a file, always jump to the last known cursor position.
  "Don't do it for commit messages, when the position is invalid, or when
  "inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  "Allow stylesheets to autocomplete hyphenated words.
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

"Tab completion
"Will insert tab at beginning of line.
"Will use completion if not at beginning.
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

"Configure syntastic syntax checking to check on open as well as save.
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
