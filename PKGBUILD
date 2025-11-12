# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae
pkgver=0.16.5
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
  'npm'
  'rapidfuzz-cpp'
  'jq'
)
provides=("vicinae")
source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
  "${pkgname}-v${pkgver}-meta.yml::https://api.github.com/repos/vicinaehq/vicinae/git/ref/tags/v${pkgver}"
  "vicinae.hook"
)

sha256sums=('5787369dc70b4e10402b9b6196c38c98706ea4f0971cf1a88d5dd8dcea540890'
            'e3e2b9b5cae1a36487393e1ca2642a25a9c424181e7f749ac37688fc6181b813'
            '870f29cb68436deaaed2b87dff89bc753afdef8dcbfd1ec35c070bc39efe10a5')

build() {
  SHA=$(jq .object.sha "${pkgname}-v${pkgver}-meta.yml" -r)

  cd $pkgname-$pkgver || exit
  cmake -G Ninja \
    -DVICINAE_GIT_TAG="v${pkgver}" \
    -DVICINAE_GIT_COMMIT_HASH="${SHA:0:7}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DVICINAE_PROVENANCE=aur \
    -B build

  cmake --build build
}

package() {
  # Bin
  install -Dm755 "$srcdir/$pkgname-$pkgver/build/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Themes
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -r "$srcdir/$pkgname-$pkgver/extra/themes/" "$pkgdir/usr/share/$pkgname/"

  # Desktop entry
  install -Dm644 "$srcdir/$pkgname-$pkgver/extra/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Systemd Service
  install -Dm644 "$srcdir/$pkgname-$pkgver/extra/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  # SVG icon
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname/icons/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname}.hook"
}
