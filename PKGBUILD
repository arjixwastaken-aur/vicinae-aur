# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Raycast like FOSS app on Linux"
arch=('x86_64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(nodejs qt6-base qt6-svg layer-shell-qt libqalculate qtkeychain-qt6)
provides=("vicinae")
conflicts=("vicinae")

source=(
  "${url}/releases/download/v$pkgver/${pkgname%-bin}-linux-$arch-v$pkgver.tar.gz"
  "https://raw.githubusercontent.com/vicinaehq/vicinae/refs/tags/v$pkgver/extra/vicinae.service"
  "https://raw.githubusercontent.com/vicinaehq/vicinae/refs/tags/v$pkgver/vicinae/icons/vicinae.svg"
)

sha256sums=('38339bd16dd43b623e5e071876b356ff184ee607f036eef5dee88d94e3caab29'
            'ad9c4ab5a52b13c9c9d1ae705ed72730d333a3c4e528d49bea983f221f89aa42'
            '9b3957bd45e7508dc2d4e16d3186fc679752c0554ad43755cf0044e4f6484dab')

package() {
  # Bin
  install -Dm755 "$srcdir/bin/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm755 "$srcdir/bin/vicinae-wlr-clip" "$pkgdir/usr/bin/vicinae-wlr-clip"

  # Desktop entry
  install -Dm644 "$srcdir/share/applications/${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

  # Themes
  cp -r "$srcdir/share/${pkgname%-bin}" "$pkgdir/usr/share/"

  # Systemd Service
  install -Dm644 "$srcdir/${pkgname%-bin}.service" "$pkgdir/usr/lib/systemd/user/${pkgname%-bin}.service"

  # SVG icon
  install -Dm644 "$srcdir/${pkgname%-bin}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
}
