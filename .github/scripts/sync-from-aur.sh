#!/usr/bin/env bash
set -euo pipefail

PUSH=false
FORCE=false
for arg in "$@"; do
  case "$arg" in
    --push)  PUSH=true ;;
    --force) FORCE=true ;;
  esac
done

# AUR packages to sync — branch name must match AUR package name
PACKAGES=(
  vicinae
  vicinae-appimage-bin
  vicinae-bin
  vicinae-git
)

AUR_BASE="https://aur.archlinux.org"

for pkg in "${PACKAGES[@]}"; do
  echo "==> Syncing $pkg"

  remote="aur-$pkg"
  aur_url="$AUR_BASE/$pkg.git"

  if ! git remote get-url "$remote" &>/dev/null; then
    git remote add "$remote" "$aur_url"
  fi

  git fetch "$remote" master
  git fetch origin "$pkg" 2>/dev/null || true

  ahead=$(git rev-list --count "refs/remotes/$remote/master..refs/remotes/origin/$pkg" 2>/dev/null || echo 0)

  if [ "$ahead" -gt 0 ] && ! $FORCE; then
    echo "    [skip] origin/$pkg is $ahead commit(s) ahead of AUR — not pushing"
  elif $PUSH; then
    git push origin "refs/remotes/$remote/master:refs/heads/$pkg" --force-with-lease
  else
    echo "    [no-push] skipping push for $pkg (pass --push to enable)"
  fi

  echo "    done: $pkg"
done

echo "==> All packages synced."
