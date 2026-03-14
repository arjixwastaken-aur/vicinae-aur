# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
# shellcheck disable=SC2128
pkgname=vicinae-bin
pkgver=0.20.6
pkgrel=1
pkgdesc="Raycast like FOSS app on Linux"
arch=('x86_64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(
  nodejs
  qt6-base
  qt6-declarative
  qt6-svg
  layer-shell-qt
  libqalculate
  qtkeychain-qt6
  libxml2
  minizip
  syntax-highlighting
)
provides=("vicinae")
conflicts=("vicinae")

noextract=("vicinae-${arch}-v${pkgver}-${pkgrel}.tgz")
source=(
  "vicinae-${arch}-v${pkgver}-${pkgrel}.tgz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${arch}-v${pkgver}.tar.gz"
  "vicinae.hook"
)

sha256sums=('aae66a7be45a8654ef8fc9611311d556a8434ab9c2cb66c0f39c370d142f32a0'
            '3e946bcb7f3c2faa3568218987012db336be92acff805a373b6c10bdeaa9e7a8')

prepare() {
  mkdir -p vicinae
  tar -xzf "vicinae-${arch}-v${pkgver}-${pkgrel}.tgz" -C vicinae
}

package() {
  install -d "$pkgdir/usr"
  for item in ./vicinae/*; do
    cp -a "$item" "$pkgdir/usr/"
  done

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-bin}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-bin}.hook"
}
