# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/qwit/qwit-1.1_beta.ebuild,v 1.1 2010/07/15 13:40:54 hwoarang Exp $

EAPI=5

inherit qt4-r2 subversion

MY_P=${P/_/-}-src

DESCRIPTION="Qt4 cross-platform client for Twitter"
HOMEPAGE="http://code.google.com/p/qwit/"
ESVN_REPO_URI="http://qwit.googlecode.com/svn/trunk/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
"
RDEPEND="${DEPEND}
	dev-libs/qoauth
"

S=${WORKDIR}/${MY_P}

DOCS=(AUTHORS)

src_configure() {
	eqmake4 PREFIX=/usr
}
