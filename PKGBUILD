# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae-bin
pkgver=0.19.6
pkgrel=1
pkgdesc="Raycast like FOSS app on Linux"
arch=('x86_64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(nodejs qt6-base qt6-svg layer-shell-qt libqalculate qtkeychain-qt6 libxml2 minizip)
provides=("vicinae")
conflicts=("vicinae")

noextract=("vicinae.tgz")
source=(
  "vicinae.tgz::${url}/releases/download/v$pkgver/${pkgname%-bin}-linux-$arch-v$pkgver.tar.gz"
  "vicinae.hook"
)

sha256sums=('791deded2aef249752275bc407fe110c73221f00cad956ae4ed5c9ed55290a8e'
            '3e946bcb7f3c2faa3568218987012db336be92acff805a373b6c10bdeaa9e7a8')

prepare() {
  mkdir -p vicinae
  tar -xzf vicinae.tgz -C vicinae
}

package() {
  install -d "$pkgdir/usr"
  for item in ./vicinae/*; do
    cp -a "$item" "$pkgdir/usr/"
  done

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-bin}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-bin}.hook"
}

