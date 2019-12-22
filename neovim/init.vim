scriptencoding utf-8

" To install nvim on ubuntu:
" sudo apt install software-properties-common
" sudo add-apt-repository ppa:neovim-ppa/unstable
" sudo apt update
" sudo apt install neovim
" sudo apt install python3-dev python3-pip python3-venv
" if you alternate neovim instead of vi or vim
" sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
" sudo update-alternatives --config vi
" sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
" sudo update-alternatives --config vim
" sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
" sudo update-alternatives --config editor
"
" Then when running neovim the first time, run follows.
" "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \"
"    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
" ":PlugInstall"

" Python paths
" pip3 install --user neovim

call plug#begin('~/.vim/plugged')
""" Add install plugins between begin and end.

"" Add color scheme.
Plug 'dracula/vim'

"" Show white space and remove them.
Plug 'ntpeters/vim-better-whitespace'

"" Show indent guide lines.
Plug 'nathanaelkane/vim-indent-guides'

"" Add file explorer.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"@ Plug 'justinmk/vim-dirvish'  " light weight file explorer for big project.

"" Show Tag list by tagbar.
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

"" Fazy search by fazy finder.
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Both options are optional. You don't have to install fzf in ~/.fzf
  " and you don't have to run the install script if you use fzf only in Vim.
Plug 'junegunn/fzf.vim'

call plug#end()

" Color schemes.
colorscheme dracula

"" vim-better-whitespace settings.
" Remove trailing white spaces on Save.
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm=0  " Not confirm.

"" vim-indent-guides settings.
let g:indent_guides_enable_on_vim_startup = 1  " default guides on.

"" nerdtree settings.
nmap <C-e> :NERDTreeToggle<CR>  " keybinding Ctrl-e

"" tagbar settings.
nmap <F8> :TagbarToggle<CR>     " keybinding F8

"" editor settings
set number  " display line number.
set termguicolors  " use TrueColor.

" Tabstops
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab        " replace tab to space.

