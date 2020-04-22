if &compatible
    set nocompatible   " Be iMproved
endif
"" runtimepath
set runtimepath+=~/.vim
set runtimepath+=~/.fzf

"" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

"" Python paths
" python -m pip install --user neovim
let g:python_host_prog = $HOME . "/.anyenv/envs/pyenv/shims/python2"
let g:python3_host_prog = $HOME . "/.anyenv/envs/pyenv/shims/python"

"" Node paths
" yarn add neovim
" let g:node_host_prog = $HOME . '/.anyenv/envs/nodenv/shims/node_modules/neovim/bin/cli.js'

"" dein plugins manager settings.
" Required:
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    " if dein is not installed. clone from github repository.
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" plugins read and cache.
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    " Add or remove your plugins here like this:
    call dein#load_toml(s:toml_file)
    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"" Color scheme.
colorscheme dracula

"" editor settings.
set number           " Display line number.
set relativenumber   " Relative number display.
set termguicolors    " Use TrueColor.
set showbreak=↪      " Show line break.
set hidden           " no save tolerate on move buffers.
set updatetime=1000  " Poling time for auto commands.
set clipboard+=unnamedplus  " clipboard support.

" Search options.
set ignorecase       " Ignore charactor small/large.
set smartcase        " When include large charactor, not ignore case.
set wrapscan         " Enable loop search.
set incsearch        " Enable incremental search.
set inccommand=split " Show intaractive replacement view."

" Tabstops.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab        " Replace tab to space.
set shiftround       " Insert white space on multiple of the value of 'shiftwidth'.

"" global keymappings.
let mapleader = "\<Space>"

"" insert mode keymappings.
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
" Escape insert mode keymapping.
inoremap <silent> jj <ESC>
" In lang Japanese, 'っｊ' espace insert mode same bellow.
inoremap <silent> っｊ <ESC>

"" normal mode keymappings.
" Wrap lien up/down in normal mode.
nnoremap k gk
nnoremap j gj
" Wrap lien up/down in visual mode.
vnoremap k gk
vnoremap j gj
" Buffers move keymappings.
nnoremap <silent><F3> :bprevious<CR>
nnoremap <silent><F4> :bnext<CR>
nnoremap <silent><F9> :bdelete<CR>
" if you need many files open onece. rplace close command all from one.
"@ nnoremap :q :qa

"" functions.
" Auto save. Save modified status and not read only file and named buffer.
function s:AutoWriteIfPossible()
    if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
        write
    endif
endfunction
autocmd CursorHold * call s:AutoWriteIfPossible()  " Call auto save function.
