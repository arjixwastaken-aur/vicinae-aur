# Maintainer: Arjix <me@arjix.dev>
# Maintainer: cilgin <cilgincc@outlook.com>

pkgbase=vicinae
pkgname=${pkgbase}-git
pkgver=0.3.0.r11.g4f1ec77
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
provides=("${pkgbase}")
conflicts=("${pkgbase}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase}"
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
  cd "${pkgbase}"
  _ensure_local_nvm
  nvm install node

  sed -i 's/WantedBy=multi-user.target/WantedBy=graphical-session.target/' "extra/$pkgbase.service"
}

build() {
  cd "${pkgbase}"

  _ensure_local_nvm
  cmake -G Ninja -B build
  cmake --build build
}

package() {
  cd "${pkgbase}"

  # Desktop entry
  install -Dm644 "extra/$pkgbase.desktop" "$pkgdir/usr/share/applications/$pkgbase.desktop"

  # Systemd Service
  install -Dm644 "extra/$pkgbase.service" "$pkgdir/usr/lib/systemd/user/$pkgbase.service"

  # SVG icon
  install -Dm644 "vicinae/icons/$pkgbase.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgbase.svg"
  
  DESTDIR="$pkgdir" cmake --install build
}
