# Maintainer: cilgin <cilgincc@outlook.com>

pkgname=vicinae
pkgver=v0.1.1
pkgrel=1
pkgdesc="Raycast like FOSS app on Linux"
arch=('x86_64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(nodejs qt6-base qt6-svg protobuf cmark-gfm layer-shell-qt libqalculate minizip qtkeychain-qt6)
provides=("vicinae=$pkgver")
conflicts=('vicinae-git')

source=(
  "${url}/releases/download/$pkgver/$pkgname-linux-$arch-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/vicinaehq/vicinae/refs/heads/main/extra/vicinae.service"
  "https://raw.githubusercontent.com/vicinaehq/vicinae/refs/heads/main/vicinae/icons/vicinae.svg"
)

sha256sums=(
  '157d0dd15b1634439c4d37820b38c661cc4bd2e52671c8540437d0e5d5c655fb'
  'SKIP'
  'SKIP'
)

package() {
  # Bin
  install -Dm755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Desktop entry
  install -Dm644 "$srcdir/share/applications/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Themes
  cp -r "$srcdir/share/$pkgname" "$pkgdir/usr/share/"
  if [ ! -d "$HOME/.config/vicinae/themes/" ]; then
    mkdir -p $HOME/.config/vicinae/themes
    ln -sf /usr/share/vicinae/themes/* $HOME/.config/vicinae/themes
  fi

  # Systemd Service
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  # SVG icon
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
