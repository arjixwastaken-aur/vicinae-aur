# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae-bin
pkgver=0.15.7
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
  "vicinae.hook"
)

sha256sums=('481ee85d45f27f567c25cd15eb624aa60c9785acc0fb6641938fc36843d15a39'
            '3e946bcb7f3c2faa3568218987012db336be92acff805a373b6c10bdeaa9e7a8')

package() {
  install -dm755 "$pkgdir/usr"
  cp -rp \
  	  "$srcdir/bin" \
  	  "$srcdir/share" \
  	  "$srcdir/lib" \
  	"$pkgdir/usr"
  
  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-bin}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-bin}.hook"
}
