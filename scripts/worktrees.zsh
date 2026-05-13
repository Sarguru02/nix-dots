#! /usr/bin/env sh

wls() {
  local current="${${$(git rev-parse --show-toplevel)}:t}"

  git worktree list --porcelain |
    awk -v cur="$current" '
      /^worktree / {
        name=$2
        sub(".*/","",name)
        if (name == cur) print "* " name
        else print "  " name
      }
    '
}

cw() {
  local root name

  root="$(git rev-parse --path-format=absolute --git-common-dir)" || return
  root="${root:h}"
  name="$1"

  if [[ -z "$name" ]]; then
    echo "usage: cw <worktree-name>"
    return 1
  fi

  if [[ "$name" == "${root:t}" ]]; then
    cd "$root"
  else
    cd "$root/.worktrees/$name"
  fi
}

wrm() {
  local root name wt_path

  root="$(git rev-parse --show-toplevel)" || return
  name="$1"

  [[ -z "$name" ]] && {
    echo "usage: wrm <worktree-name>"
    return 1
  }

  # prevent deleting main repo
  if [[ "$name" == "${root:t}" ]]; then
    echo "cannot remove main worktree"
    return 1
  fi

  wt_path="$root/.worktrees/$name"

  [[ ! -d "$wt_path" ]] && {
    echo "worktree not found: $name"
    return 1
  }

  git worktree remove "$wt_path"
}

mkwt() {
  local root branch wt_path

  branch="$1"
  [[ -z "$branch" ]] && { echo "usage: mkwt <branch>"; return 1 }

  root="$(git rev-parse --path-format=absolute --git-common-dir)" || return
  root="${root:h}"

  # ensure branch exists
  git show-ref --verify --quiet "refs/heads/$branch" || {
    echo "branch does not exist: $branch"
    return 1
  }


  adjectives=(alpha beta gamma red blue green swift calm lunar cosmic)
  nouns=(falcon eagle river forest matrix vector beacon spark)

  mkdir -p "$root/.worktrees"


  adj=${adjectives[$((RANDOM % ${#adjectives[@]} + 1))]}
  noun=${nouns[$((RANDOM % ${#nouns[@]} + 1))]}

  name="${adj}-${noun}"
  wt_path="$root/.worktrees/$name"


  git worktree add "$wt_path" "$branch"

  echo $name
}
