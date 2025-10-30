# Maintainer: Arjix <me@arjix.dev>
# Maintainer: cilgin <cilgincc@outlook.com>

pkgname=vicinae-appimage-bin
pkgver=0.15.7
pkgrel=3
pkgdesc="Raycast like FOSS app on Linux"
arch=('x86_64')
url="https://github.com/vicinaehq/vicinae"
options=('!debug' '!strip')
license=('GPL3')
depends=( fuse )
makedepends=(jq wget)
provides=("vicinae")
conflicts=("vicinae")

source=("github-release.json::https://api.github.com/repos/vicinaehq/vicinae/releases/latest")
sha256sums=('SKIP')

pkgver() {
	jq -r '.tag_name | ltrimstr("v")' github-release.json
}

prepare() {
    local asset download_url digest
    asset=$(jq -r '.assets[] | select(.name | endswith(".AppImage"))' github-release.json)

    download_url=$(echo "$asset" | jq -r '.browser_download_url')
    digest=$(echo "$asset" | jq -r '.digest | split(":")[1]')

    wget -q "$download_url" -O vicinae.Appimage
    echo "${digest} vicinae.Appimage" | sha256sum -c || {
		echo "[ERR]: The downloaded file is corrupt."
    	exit 1
    }

    chmod +x vicinae.Appimage
    ./vicinae.Appimage --appimage-extract

}

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/squashfs-root" "${pkgdir}/opt/vicinae"
  ln -s "/opt/vicinae/AppRun" "${pkgdir}/usr/bin/vicinae"

  install -Dm644 "${srcdir}/squashfs-root/vicinae.desktop" "${pkgdir}/usr/share/applications/vicinae.desktop"
  install -Dm644 "${srcdir}/squashfs-root/vicinae.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/vicinae.png"
  install -Dm644 "${srcdir}/squashfs-root/usr/lib/systemd/user/vicinae.service" "${pkgdir}/usr/lib/systemd/user/vicinae.service"
  cp -a "${srcdir}/squashfs-root/usr/share/" "${pkgdir}/usr/share/"
}
