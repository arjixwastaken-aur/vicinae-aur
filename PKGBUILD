# Maintainer: Arjix <me@arjix.dev>
# Maintainer: cilgin <cilgincc@outlook.com>

pkgname=vicinae-git
pkgver=0.3.0.r13.gcbc451c
pkgrel=1
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
  'sed'
  'cmake'
  'ninja'
  'nvm'
  'rapidfuzz-cpp'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvmrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "${pkgname%-git}"
  _ensure_local_nvm
  nvm install node
}

build() {
  cd "${pkgname%-git}"

  _ensure_local_nvm
  cmake -G Ninja -B build
  cmake --build build
}

package() {
  cd "${pkgname%-git}"

  # Desktop entry
  install -Dm644 "extra/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

  # Systemd Service
  install -Dm644 "extra/${pkgname%-git}.service" "$pkgdir/usr/lib/systemd/user/${pkgname%-git}.service"

  # SVG icon
  install -Dm644 "vicinae/icons/${pkgname%-git}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
  
  DESTDIR="$pkgdir" cmake --install build
}
