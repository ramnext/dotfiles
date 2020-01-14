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

"" Python paths
" pip3 install --user neovim
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = $HOME . "/.anyenv/envs/pyenv/shims/python"

call plug#begin('~/.vim/plugged')
""" Add install plugins between begin and end.

"" Color scheme.
"" Add color scheme.
"" https://github.com/rafi/awesome-vim-colorschemes
Plug 'dracula/vim'

"" Vim airline.
"" Lean & mean status/tabline for vim that's light as air.
"" https://github.com/vim-airline/vim-airline
"@ Whoa! Everything got slow all of a sudden...
"@ Plug 'vim-airline/vim-airline'
"@ Plug 'vim-airline/vim-airline-themes'

"" lightline vim.
"" A light and configurable statusline/tabline plugin for Vim.
"" https://github.com/itchyny/lightline.vim.
Plug 'itchyny/lightline.vim'

"" lightline ale.
"" This plugin provides ALE indicator for the lightline vim plugin.
"" https://github.com/maximbaz/lightline-ale
Plug 'maximbaz/lightline-ale'

"" vim-better-whitespace.
"" Show white space and remove them.
"" https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'

"" vim-indent-guides.
"" Show indent guide lines.
"" https://github.com/nathanaelkane/vim-indent-guides
Plug 'nathanaelkane/vim-indent-guides'

"" NERDTree.
"" Add file explorer.
"" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"@ Plug 'justinmk/vim-dirvish'  " light weight file explorer for big project.

"" tagbar.
"" Show Tag list by tagbar.
"" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

"" Fazy search by fazy finder.
"" https://github.com/junegunn/fzf
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Both options are optional. You don't have to install fzf in ~/.fzf
  " and you don't have to run the install script if you use fzf only in Vim.
Plug 'junegunn/fzf.vim'

"" vim-polyglot.
"" A collection of language packs for Vim.
"" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

"" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors) in NeoVim 0.2.0+
"" and Vim 8 while you edit your text files, and acts as a Vim Language Server Protocol client.
"" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

"" Ultisnip.
"" UltiSnips is the ultimate solution for snippets in Vim. It has many features, speed being one of them.
"" https://github.com/SirVer/ultisnips
Plug 'SirVer/ultisnips'

"" snipMate & UltiSnip Snippets.
"" Use in combination with 'ultisnips'.
"" https://github.com/honza/vim-snippets
Plug 'honza/vim-snippets'

"" Conquer of Completion
"" Coc is an intellisense engine for Vim/Neovim.
"" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Terminal emulator.
"" Use the same terminal for everything.
"" https://github.com/kassio/neoterm
Plug 'kassio/neoterm'

"" Vim Commentary.
"" Comment in/out utility.
"" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

"" Unudo tree
"" Visualizes undo history and makes it easier to browse and switch between different undo branches.
"" https://github.com/mbbill/undotree
Plug 'mbbill/undotree'

"" Vim-easymotion.
"" EasyMotion provides a much simpler way to use some motions in vim.
"" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

"" Sorround vim.
"" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more.
"" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

"" vim-repeat.
"" Repeat plugin map.
"" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

"" Auto Pairs
"" Insert or delete brackets, parens, quotes in pair.
"" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

"" fugitive vim.
"" fugitive.vim may very well be the best Git wrapper of all time.
"" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

"" vim-gitgutter
"" A Vim plugin which shows a git diff in the 'gutter' (sign column).
"" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

"" Rooter
"" Rooter changes the working directory to the project root when you open a file or directory.
"" https://github.com/airblade/vim-rooter
Plug 'airblade/vim-rooter'

"" vim match-up
"" match-up is a drop-in replacement for the vim plugin matchit.vim.
"" https://github.com/andymass/vim-matchup
Plug 'andymass/vim-matchup'

"" Emmet-vim
"" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
"" https://github.com/mattn/emmet-vim
Plug 'mattn/emmet-vim'

"" vim-expand-region
"" vim-expand-region is a Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
"" https://github.com/terryma/vim-expand-region
Plug 'terryma/vim-expand-region'

call plug#end()

"" [Colors] Command display left side. default option override.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
"" Color schemes.
colorscheme dracula
"" vim-airline-themes
"@ let g:airline#extensions#tabline#enabled = 1
"@ let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"@ let g:airline_powerline_fonts = 1
"" lightline settings.
let g:lightline = {'colorscheme': 'dracula'}
let g:lightline.component_expand = {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ }
let g:lightline.component_type = {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ }
let g:lightline.active = {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified'],
  \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
  \   ]
  \ }

"" vim-better-whitespace settings.
" Remove trailing white spaces on Save.
let g:strip_whitespace_on_save = 0
let g:strip_whitespace_confirm = 0  " Not confirm.

"" vim-indent-guides settings.
let g:indent_guides_enable_on_vim_startup = 1  " default guides on.

"" nerdtree settings.
" keybinding Ctrl-e: NERDTree open/close toggle.
nmap <C-e> :NERDTreeToggle<CR>

"" tagbar settings.
" keybinding F8: Tag lists open/close toggle.
nmap <F8> :TagbarToggle<CR>

"" fzf settings.
" keybinding C-p: Search past open file lists.
nmap <C-p> :History<CR>
"@ let g:fzf_layout = { 'down': '~40%' }      " fzf layout position and height. down(default) / up / left / right.
let g:fzf_layout = { 'window': '-tabnew' }  " Only neovim, fzf display new window or tab. enew / -tabnew.
let g:fzf_buffers_jump = 1                  " [Buffers] Jump to the existing window if possible.
let g:fzf_tags_command = 'ctags -R'         " [Tags] Command to generate tags file.
let g:fzf_commands_expect = 'alt-enter,ctrl-x'  " [Commands] --expect expression for directly executing the command.
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Files] Command with preview file.
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" [Ag + ?] Command with preview file.
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" [Rg + ?] Command with preview file.
" !!!Pendding: Rg default Command duplicate.
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"" vim-polyglot settings.
"@ let g:polyglot_disabled = ['csv']  " Disable install special formatter setting. Set extension with separate comma(,).

"" ale settings.
let g:ale_set_highlights = 0  " Disable warning or error highlighting.
let g:ale_linters = {'python': ['flake8']}  " Select linter assosiated with language.
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'  " Show linter messages
" Select Formatter assosiated with language.
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'python': ['black'],
  \ }
let g:ale_fix_on_save = 1     " Format on save.
" Select previous linter message keybining.
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" Select next linter message keybinding.
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"" ultisnips settings.
" Trigger display snippets <Ctrl>-j from <TAB>.
let g:UltiSnipsExpandTrigger = '<c-j>'

"" Conquer of Completion settings.
" Select of complementary candidate <TAB> or <Shift>-<TAB> from <Ctrl>-n or <Ctrl>-p.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Disition of completions replace <CR> form <Ctrl>-y.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Define Jump
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')  " Highlight symbol under cursor on CursorHold

"" neoterm settings.
let g:neoterm_default_mod = 'belowright'   " display position.
let g:neoterm_size = 10                    " show lines.
let g:neoterm_autoscroll = 1               " auto scroll.
" Move terminal form editor.
tnoremap <silent> <C-w> <C-\><C-n><C-w>
" Current line run on REPL.
nnoremap <silent> <C-n> :TREPLSendLine<CR>j0
" Selected line by visual mode run on REPL.
vnoremap <silent> <C-n> V:TREPLSendSelection<CR>'>j0

"" undotree settings.
let g:undotree_WindowLayout = 2
" Toggle undo hisotry view.
nmap <F5> :UndotreeToggle<CR>

"" vim-easymotion settings.
nmap s <Plug>(easymotion-overwin-f2)

"" vim-expand-region settings.
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"" emmet-vim settings.
" remap the default <C-Y> leader.
"@let g:user_emmet_leader_key="<C-y>"

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
