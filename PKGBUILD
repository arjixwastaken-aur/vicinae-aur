# Maintainer: cilgin <cilgincc@outlook.com>
# Maintainer: Arjix <me@arjix.dev>

pkgname=vicinae
pkgver=0.14.4
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

sha256sums=('40369198b87b5636eb5e0005f655ff3319b0ff9a0a8b8ada2354b40122147d12'
            '2be3ac44efca626a235cc0a13cb5f9efa1e2ddbdcadc1d0b80a2df813c5f29e1'
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
  install -Dm755 "$srcdir/$pkgname-$pkgver/build/wlr-clip/vicinae-wlr-clip" "$pkgdir/usr/bin/vicinae-wlr-clip"

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
