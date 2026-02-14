# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
pkgname=vicinae
pkgver=0.19.8
pkgrel=1
pkgdesc="A focused launcher for your desktop — native, fast, extensible"
arch=('x86_64' 'aarch64')
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
  'libxml2'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'npm'
  'rapidfuzz-cpp'
  'jq'
  'glaze'
  'curl'
)
provides=("vicinae")
conflicts=("vicinae")
source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
  "vicinae.hook"
)

sha256sums=('934d4e96186d86e32f8480dc2e8cb73a31a4e266b86c14b3dd24e8eb76c5ead9'
            '870f29cb68436deaaed2b87dff89bc753afdef8dcbfd1ec35c070bc39efe10a5')

prepare() {
  curl "https://api.github.com/repos/vicinaehq/vicinae/git/ref/tags/v${pkgver}" \
    --output "${pkgname}-v${pkgver}-meta.yml" \
    --silent \
    --follow
}

build() {
  SHA=$(jq .object.sha "${pkgname}-v${pkgver}-meta.yml" -r)

  cd $pkgname-$pkgver || exit
  cmake -G Ninja \
    -DVICINAE_GIT_TAG="v${pkgver}" \
    -DVICINAE_GIT_COMMIT_HASH="${SHA:0:7}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DVICINAE_PROVENANCE=aur \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build

  cmake --build build
}

package() {
  cd "$pkgname-$pkgver" || exit
  DESTDIR="$pkgdir" cmake --install build

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-git}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-git}.hook"
}
