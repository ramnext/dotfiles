function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  rg '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
end

