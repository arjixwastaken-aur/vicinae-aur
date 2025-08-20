# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae-bin
pkgver=v0.3.0
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
  'd0ede6366575a1a48fe2c89ef87e768db79f701227c92b130275dd30e9cf2e18'
  '4597dcdc30ef283f994c5a5fa65725f9bae7627afc1e12a2aa9bef24f8fa6eee'
  '9b3957bd45e7508dc2d4e16d3186fc679752c0554ad43755cf0044e4f6484dab'
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
