function fwt -d "Fuzzy-find and move worktree directory"
    git rev-parse > /dev/null ^&1
    if test $status -ne 0
        echo 'fatal: Not a git repository.'
        exit
    end

    set selectedWorkTreeDir (git worktree list | fzf | awk '{print $1}')

    if test $selectedWorkTreeDir = ""
        exit
    end

    cd $selectedWorkTreeDir
end

