# Maintainer: Arjix <me@arjix.dev>
# Maintainer: cilgin <cilgincc@outlook.com>

pkgname=vicinae-git
pkgver=0.15.1.r1.g8cc6e59
pkgrel=3
pkgdesc="A focused launcher for your desktop — native, fast, extensible"
arch=('x86_64')
url="https://github.com/vicinaehq/vicinae"
license=('GPL3')
depends=(
  'nodejs'
  'qt6-base'
  'qt6-svg'
  'protobuf'
  'cmark-gfm'
  'layer-shell-qt'
  'libqalculate'
  'minizip'
  'qtkeychain-qt6'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'npm'
  'rapidfuzz-cpp'
)
provides=("vicinae")
conflicts=("vicinae")
source=("git+${url}.git" "vicinae.hook")
sha256sums=('SKIP'
            'e9697f260d8d848090d0585fd7d29b8a7344964a8d1dfaa0409df260500de864')

pkgver() {
  cd "${pkgname%-git}" || exit
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}" || exit
  cmake -G Ninja -B build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${pkgname%-git}"
  DESTDIR="$pkgdir" cmake --install build

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-git}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-git}.hook"
}
