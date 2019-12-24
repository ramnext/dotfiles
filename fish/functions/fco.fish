function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf --preview 'git show --color=always {}' | read -l result; and git checkout "$result"
end

