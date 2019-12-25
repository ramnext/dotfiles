function fwt -d "Fuzzy-find and move worktree directory"
  git rev-parse > /dev/null ^&1
  if test $status -ne 0
    echo 'fatal: Not a git repository.'
    return
  end

  set -l selectedWorkTreeDir
  git worktree list | fzf | awk '{print $1}' | read select

  [ -n "$select" ]; and cd "$select"
  commandline -f repaint
end

