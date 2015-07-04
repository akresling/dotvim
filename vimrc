syntax on
set background=dark
let g:solarized_termtrans=1
set ruler
set cc=80
highlight ColorColumn ctermbg=lightgray guibg=lightgray
colorscheme gummybears

imap jj <Esc>
filetype off
set nocompatible

set ignorecase
set hlsearch
set incsearch
set encoding=utf8
set smarttab
set ai
set si
map <space> /
map <c-space> ?
nnoremap <CR> :nohlsearch<cr>

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"function to replace all occurences of word1 with word2
function! Repa(word1, word2)
    execute '%s/\<'.a:word1.'\>/'.a:word2.'/g'
endfun

set tabstop=4
set shiftwidth=4
filetype plugin on
set expandtab

set list
set listchars=tab:♪\ ,trail:∘
let mapleader = ","
let g:mapleader = ","

set laststatus=2
set t_Co=256
"
autocmd BufRead,BufNewFile *.tpl        set filetype=html

let g:Powerline_symbols = 'fancy'
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

"let g:Powerline_theme = 'solarized256'
"let g:Powerline_stl_path_style = 'full'

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_php_phpcs_args='--report=csv --standard=PSR2'
let g:syntastic_php_phpmd_post_args='~/ashley/ashley/common-new/build/phpmd.xml'

" basic rules are used for most of pinf, full rules used for api code
let g:syntastic_basic=['php', 'phpmd']
let g:syntastic_full=['php', 'phpmd', 'phpcs']

" default to basic rules
let g:syntastic_php_checkers=g:syntastic_basic
"
" in api, common-new folders, check all aspects
autocmd BufRead,BufNewFile ~/ashley/ashley/common-new/* let g:syntastic_php_checkers=g:syntastic_full
autocmd BufRead,BufNewFile ~/ashley/ashley/api/* let g:syntastic_php_checkers=g:syntastic_full

function! TogglePHPCS()
    if g:syntastic_php_checkers == g:syntastic_full
        let g:syntastic_php_checkers = g:syntastic_basic
        echo "PHPCS Disabled"
    else
        let g:syntastic_php_checkers = g:syntastic_full
        echo "PHPCS Enabled"
    endif
endfun

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

let g:Powerline_symbols_override = {
        \ 'BRANCH': [0x2213],
        \ 'LINE': 'L',
        \ }

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'ctrlp.vim'
Bundle 'ack.vim'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'fugitive.vim'
Bundle 'Syntastic'

filetype plugin indent on

