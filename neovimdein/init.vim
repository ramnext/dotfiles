if &compatible
    set nocompatible   " Be iMproved
endif
"" runtimepath
set runtimepath+=~/.vim

"" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

"" dein plugins manager settings.
" Required:
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
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


"" editor settings.
set number           " display line number.
set relativenumber   " relative number display.
set termguicolors    " use TrueColor.
set showbreak=↪  " Show line break.
set hidden " no save tolerate on move buffers.
set updatetime=1000  " poling time for auto commands.

" Tabstops.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab        " replace tab to space.

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
nnoremap <silent><F3> :bprevious<CR>
nnoremap <silent><F4> :bnext<CR>
nnoremap <silent><F9> :bdelete<CR>

"" functions.
" Auto save. Save modified status and not read only file and named buffer.
function s:AutoWriteIfPossible()
    if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
        write
    endif
endfunction
autocmd CursorHold * call s:AutoWriteIfPossible()  " Call auto save function.

