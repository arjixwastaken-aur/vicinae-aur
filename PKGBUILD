# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae-bin
pkgver=0.16.12
pkgrel=1
pkgdesc="Raycast like FOSS app on Linux"
arch=('x86_64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(nodejs qt6-base qt6-svg layer-shell-qt libqalculate qtkeychain-qt6 libxml2 minizip-ng)
provides=("vicinae")
conflicts=("vicinae")

source=(
  "${url}/releases/download/v$pkgver/${pkgname%-bin}-linux-$arch-v$pkgver.tar.gz"
  "vicinae.hook"
)

sha256sums=('168d6ecc4fde8284246ac04215e7c385f36acfb9b2dc6a312f87c8a84c13afcb'
  '3e946bcb7f3c2faa3568218987012db336be92acff805a373b6c10bdeaa9e7a8')

package() {
  # Bin
  install -Dm755 "$srcdir/bin/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"

  # Desktop entry
  install -Dm644 "$srcdir/share/applications/${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
  install -Dm644 "$srcdir/share/applications/${pkgname%-bin}-url-handler.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}-url-handler.desktop"

  # Themes
  cp -r "$srcdir/share/${pkgname%-bin}" "$pkgdir/usr/share/"

  # Systemd Service
  install -Dm644 "$srcdir/lib/systemd/user/${pkgname%-bin}.service" "$pkgdir/usr/lib/systemd/user/${pkgname%-bin}.service"

  # SVG icon
  install -Dm644 "$srcdir/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-bin}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-bin}.hook"
}
