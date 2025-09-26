# Maintainer: Arjix <me@arjix.dev>
# Maintainer: cilgin <cilgincc@outlook.com>

pkgname=vicinae-git
pkgver=0.12.2.r9.gb2f9582
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
)
provides=("vicinae")
conflicts=("vicinae")
source=("git+${url}.git" "vicinae.hook")
sha256sums=('SKIP'
            '08dc48891499fd35fdaaac6e3c59b72a7173c46861b00db9d8adeaaa6767e24d')

pkgver() {
  cd "${pkgname%-git}" || exit
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}" || exit
  cmake -G Ninja -B build
  cmake --build build
}

package() {
  # Bin
  install -Dm755 "$srcdir/${pkgname%-git}/build/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm755 "$srcdir/${pkgname%-git}/build/wlr-clip/vicinae-wlr-clip" "$pkgdir/usr/bin/vicinae-wlr-clip"

  # Themes
  mkdir -p $pkgdir/usr/share/${pkgname%-git}
  cp -r "$srcdir/${pkgname%-git}/extra/themes/" "$pkgdir/usr/share/${pkgname%-git}/"

  # Desktop entry
  install -Dm644 "$srcdir/${pkgname%-git}/extra/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

  # Systemd Service
  install -Dm644 "$srcdir/${pkgname%-git}/extra/${pkgname%-git}.service" "$pkgdir/usr/lib/systemd/user/${pkgname%-git}.service"

  # SVG icon
  install -Dm644 "$srcdir/${pkgname%-git}/${pkgname%-git}/icons/${pkgname%-git}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"

  # Pacman hook
  install -Dm644 "$srcdir/${pkgname%-git}.hook" "$pkgdir/usr/share/libalpm/hooks/${pkgname%-git}.hook"

}
