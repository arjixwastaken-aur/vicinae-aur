# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae-bin
pkgver=0.14.3
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
  "vicinae.hook"
)

sha256sums=('b42bd29742ed7d8ff3e6c63b9f312f7daf68ca3b17b4cec4b717a4cb76753e88'
            'ad9c4ab5a52b13c9c9d1ae705ed72730d333a3c4e528d49bea983f221f89aa42'
            '9b3957bd45e7508dc2d4e16d3186fc679752c0554ad43755cf0044e4f6484dab'
            '3e946bcb7f3c2faa3568218987012db336be92acff805a373b6c10bdeaa9e7a8')

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

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-bin}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-bin}.hook"
}
