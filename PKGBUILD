# Maintainer: cilgin <cilgincc@outlook.com>

pkgname=vicinae
pkgver=v0.2.0
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
  '562c9fbd5847ecffc5613b44e9f581686920674f3e7e068867fd658ec0a9169c'
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

  # Systemd Service
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  # SVG icon
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
