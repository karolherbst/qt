# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils

DESCRIPTION="Openbox window manager configuration tool"
HOMEPAGE="http://lxqt.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://git.lxde.org/git/lxde/${PN}.git"
else
	SRC_URI="http://dev.gentoo.org/~jauhien/distfiles/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"
IUSE="qt4 +qt5"
REQUIRED_USE="^^ ( qt4 qt5 )"

RDEPEND="dev-libs/glib:2
	dev-libs/libxml2
	media-libs/fontconfig
	media-libs/freetype
	x11-wm/openbox:3
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXft
	x11-libs/pango
	qt4? ( dev-qt/qtcore:4
		dev-qt/qtgui:4 )
	qt5? ( dev-qt/linguist-tools:5
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtx11extras:5 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		$( cmake-utils_use_use qt5 QT5 )
	)
	cmake-utils_src_configure
}
