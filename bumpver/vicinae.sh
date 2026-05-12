#!/usr/bin/env bash
set -euo pipefail

GITHUB_REPO="vicinaehq/vicinae"

LATEST=$(curl -sf "https://api.github.com/repos/${GITHUB_REPO}/releases/latest" \
    | jq -r '.tag_name | ltrimstr("v")')
CURRENT=$(grep '^pkgver=' PKGBUILD | cut -d= -f2)

if [[ "$LATEST" == "$CURRENT" ]]; then
    echo "up-to-date: $CURRENT"
    exit 0
fi

echo "bumping $CURRENT -> $LATEST"

sed -i \
    -e "s/^pkgver=.*/pkgver=${LATEST}/" \
    -e "s/^pkgrel=.*/pkgrel=1/" \
    PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

git add PKGBUILD .SRCINFO
git commit -m "chore: bump to v${LATEST}"
git push origin HEAD
