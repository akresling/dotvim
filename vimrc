set ruler
set cc=80
highlight ColorColumn ctermbg=lightgray guibg=lightgray
colorscheme janah
set background=dark
set t_Co=256
set antialias
set guifont=Monaco:h14

hi ColorColumn ctermbg=8

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_autosave = 1

" https://sanctum.geek.nz/arabesque/vim-anti-patterns/
" Lets practice not using the arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

imap jj <Esc>
filetype off
syntax on
set nocompatible
set backspace=2
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

let mapleader = ","
let g:mapleader = ","

map <Leader>gb <Esc>:Gblame<CR>
map <Leader>vs <Esc>:vsplit<CR>
map <Leader>hs <Esc>:split<CR>
map <Leader>gg 0v$<Left>y:!git diff HEAD ^master -- <c-r>"<cr>

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
set listchars=trail:∘
"set listchars=tab:♪
set laststatus=2
"
autocmd BufRead,BufNewFile *.tpl        set filetype=html

let g:Powerline_symbols = 'fancy'
let g:ctrlp_user_command=['.git/', 'cd %s && git ls-files . -co --exclude-standard | grep -v node_modules']

"let g:Powerline_theme = 'solarized256'
"let g:Powerline_stl_path_style = 'full'

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

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <Leader>rn <Esc>:call NumberToggle()<cr>

let g:Powerline_symbols_override = {
        \ 'BRANCH': [0x2213],
        \ 'LINE': 'L',
        \ }

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'ctrlp.vim'
Plugin 'ack.vim'
Plugin 'git://github.com/Lokaltog/vim-powerline.git'
Plugin 'fugitive.vim'
Plugin 'bufexplorer.zip'
Plugin 'VimClojure'
Plugin 'fatih/vim-go'
Plugin 'git://github.com/tpope/vim-fireplace.git'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()

filetype plugin indent on
au BufNewFile,BufRead *.ex,*.exs set filetype=elixir
au BufNewFile,BufRead *.clj set filetype=clojure
au FileType go set nolist

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"      \| exe "normal! g'\"" | endif
"endif
