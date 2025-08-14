# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae-git
pkgver=0.0.4.r0.g23d5993
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
  'cmake'
  'ninja'
  'nvm'
  'rapidfuzz-cpp'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=vicinae.install
source=("git+${url}.git" "vicinae.desktop" "vicinae.service")
sha256sums=('SKIP'
            '184c7c1d887168e34c15e9d9a629e07690f98bc529cd1633ed6546b07afb8fe5'
            '9cfb0fd05ecbe907131e43bed5df53309eaae0e5e7466cd9c80d939980ea8be0')

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
  install -D -m644 vicinae.service -t "${pkgdir}/usr/lib/systemd/system"

  cd "${pkgname%-git}"
  DESTDIR="$pkgdir" cmake --install build
}
