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
conflicts=('vicinae')

source=(
  "${url}/releases/download/$pkgver/${pkgname%-bin}-linux-$arch-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/vicinaehq/vicinae/refs/tags/$pkgver/extra/vicinae.service"
  "https://raw.githubusercontent.com/vicinaehq/vicinae/refs/tags/$pkgver/vicinae/icons/vicinae.svg"
)

sha256sums=('d0ede6366575a1a48fe2c89ef87e768db79f701227c92b130275dd30e9cf2e18'
            'd9c598cf0070cb358df7937e4d2576f449d0cd39e01cc01ebc7772d032b59b7c'
            '9b3957bd45e7508dc2d4e16d3186fc679752c0554ad43755cf0044e4f6484dab')

package() {
  # Bin
  install -Dm755 "$srcdir/bin/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"

  # Desktop entry
  install -Dm644 "$srcdir/share/applications/${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

  # Themes
  cp -r "$srcdir/share/${pkgname%-bin}" "$pkgdir/usr/share/"

  # Systemd Service
  install -Dm644 "$srcdir/${pkgname%-bin}.service" "$pkgdir/usr/lib/systemd/user/${pkgname%-bin}.service"

  # SVG icon
  install -Dm644 "$srcdir/${pkgname%-bin}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
}
