if not functions -q fisher
    echo "Installing fisher for the first time..." >&2
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

###
### keybindings setting
###
function fish_user_key_bindings

    for mode in insert default visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase

    bind -M insert -e \ce
    bind -M visual -e \ce
    bind -M default -e \ce
    bind -M insert -e \cf
    bind -M insert \ce accept-autosuggestion

    # change word move keybindings
    bind -M insert \cb backward-word
    bind -M insert \cf forward-word
    bind -M insert \ef forward-char
    bind -M insert \eb backward-char

    # Input new line escape
    bind -M insert \ei 'commandline -i \\\\\n'

    ### fzf ###
    set -q FZF_LEGACY_KEYBINDINGS
    or set -l FZF_LEGACY_KEYBINDINGS 1
    if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
        bind \ct '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ec '__fzf_cd'
        bind \eC '__fzf_cd --hidden'
        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \ct '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \eC '__fzf_cd --hidden'
        end
    else
        bind \cs '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \eo '__fzf_cd'
        bind \eO '__fzf_cd --hidden'
        bind \ct '__fzf_open --editor'
        if bind -M insert >/dev/null 2>/dev/null
            bind -M insert \cs '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \eo '__fzf_cd'
            bind -M insert \eO '__fzf_cd --hidden'
            bind -M insert \ct '__fzf_open --editor'
        end
    end
    if set -q FZF_COMPLETE
        bind \t '__fzf_complete'
    end
    ### fzf ###

    ### ghq ###
    bind \cg '__ghq_repository_search'
    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \cg '__ghq_repository_search'
    end

#@    # Bind for prco history to Ctrl+h
#@    bind \cs 'peco_select_history (commandline -b)'
#@    # Bind for prco Recent history to Ctrl+g
#@    bind \ch 'peco_recentd'
#@    # Bidn for ghq history to Ctrl+]
#@    bind \c] peco_select_ghq_repository # ghq用のリポジトリ候補表示
#@    # Bidn for gh-open history to Ctrl+o
#@    bind \co peco_open_gh_repository # gh-openの呼び出し
#@    if bind -M insert >/dev/null 2>/dev/null
#@        bind -M insert \cs 'peco_select_history (commandline -b)'
#@        bind -M insert \ch 'peco_recentd'
#@        bind -M insert \c] 'peco_select_ghq_repository' # ghq用のリポジトリ候補表示
#@        bind -M insert \co 'peco_open_gh_repository'    # gh-openの呼び出し
#@    end
end

###
### base path config
###
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
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

## byobu
##
set -gx VTE_CJK_WIDTH 1

## rust setting
##
set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
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
    set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

    ## coreutils
    ##
    set -g fish_user_paths "/usr/local/opt/coreutils/libexec/gnubin" $fish_user_paths

    ## sqlite
    ##
    set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
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
    status --is-interactive; and source (anyenv init -|psub)
case Linux
    ## go tools setting
    ##
    set -gx GOPATH "$HOME/go"
    set -g fish_user_paths "$GOPATH/bin" $fish_user_paths

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
