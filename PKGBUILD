# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae-git
pkgver=0.2.0.r3.g4ed9ced
pkgrel=2
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
source=("git+${url}.git" "vicinae.sh" "vicinae.service")
sha256sums=('SKIP'
            '8eb4851597cc0f95147eb8fd61a09bd0630715f0e4c104e83edcc7fe44fd336c'
            '111ee271bf48cdc1a384316a09bdf4d78a5ce0c34db1b28c6a9e81453c2d8b38')

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
  cmake -G Ninja -B build -DCMAKE_INSTALL_PREFIX=/opt/${pkgname}
  cmake --build build
}

package() {
  install -D -m644 vicinae.service -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m755 vicinae.sh "$pkgdir/usr/local/bin/vicinae"
  sed -i "s/PKGNAME/$pkgname/" "$pkgdir/usr/local/bin/vicinae"

  cd "${pkgname%-git}"
  DESTDIR="$pkgdir" cmake --install build

  if [[ -d "$pkgdir/opt/${pkgname}/share" ]]; then
    install -d "$pkgdir/usr"
    mv "$pkgdir/opt/${pkgname}/share" "$pkgdir/usr/"
  fi
}
