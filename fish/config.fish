if not functions -q fisher
    echo "Installing fisher for the first time..." >&2
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

###
### base path config
###
status is-login; and set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -gx LD_LIBRARY_PATH "/usr/local/lib"

## bobthefish settings
##
#set -g theme_color_scheme dracula
#set -g theme_nerd_fonts yes
#@set -g theme_display_date no
#@set -g theme_date_format "+%m/%d %H:%M:%S"
#set -g theme_newline_cursor yes

## EDITOR
##
set -gx EDITOR vi

## fzf settings
##
status is-login; and set -g fish_user_paths "$HOME/.fzf/bin" $fish_user_paths
set -x FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_DEFAULT_OPTS '--reverse --height 40%'
set -x FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_OPEN_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_OPEN_OPTS '--preview "bat --color=always --style=header,grid --line-range :100 {}"'
set -x FZF_PREVIEW_DIR_CMD ls
set -x FZF_PREVIEW_FILE_CMD 'bat --color=always --style=header,grid --line-range :100 {}'
set -x FZF_TMUX_HEIGHT '40%'

## byobu
##
set -gx VTE_CJK_WIDTH 1

## rust setting
##
status is-login; and set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
starship init fish | source

## grc setting
##
if test -s "/etc/grc.fish"
    source /etc/grc.fish
end

## ghq setting
if test ! -d "$HOME/repos"
    mkdir -p $HOME/repos
end
set -x GHQ_ROOT $HOME/repos

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#@eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

###
### setting by OS
###
switch (uname)
case Darwin
    ## openssl
    ##
    status is-login; and set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

    ## coreutils
    ##
    status is-login; and set -g fish_user_paths "/usr/local/opt/coreutils/libexec/gnubin" $fish_user_paths

    ## sqlite
    ##
    status is-login; and set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
    ## sqlite for COMPILE
    ##
    set -gx LDFLAGS "-L/usr/local/opt/readline/lib"
    set -gx CPPFLAGS "-I/usr/local/opt/readline/include"
    set -gx PKG_CONFIG_PATH "/usr/local/opt/readline/lib/pkgconfig"

    ## byobu
    ##
    set -gx BYOBU_PREFIX "/usr/local"

    ## anyenv
    ##
    status is-login; and set -x fish_user_paths $HOME/.anyenv/bin $fish_user_paths
    status --is-interactive; and source (anyenv init -|psub)

    ## browser setting
    alias safari="open -a Safari"
    alias firefox="open -a Firefox"
case Linux
    ## go tools setting
    ##
    set -x -U GOPATH $HOME/go
    status is-login; and set -g fish_user_paths "$GOPATH/bin" $fish_user_paths

    ## python setting
    ##
    alias python3="python3.7"
    alias python3-venv="python3.7-venv"
case '*'
end

###
### alias define
###

## for git
alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gca="git commit -a -m"
alias gcm="git commit -m"
alias gbd="git branch -D"
alias gp="git push"
alias gb="git branch"
alias gcob="git checkout -b"
alias gco="git checkout"
alias gba="git branch -a"
alias glog="git log --graph --date=iso --pretty='[%ad]%C(auto) %h%d %Cgreen%an%Creset : %s'"
alias gll="git log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"

## for exa
alias l="exa -lgF --group-directories-first --icons"
alias ls='exa --group-directories-first --icons'
alias l1="exa -1gF --icons"
alias la="exa -lgFa --group-directories-first --icons"
alias lr="exa -lgFr --group-directories-first --icons"
alias lt="exa -T --icons"
alias lT="exa -lT --icons"
alias ld="exa -lgFa --only-dirs --icons"

## for lazydocker
alias lzd="lazydocker"
