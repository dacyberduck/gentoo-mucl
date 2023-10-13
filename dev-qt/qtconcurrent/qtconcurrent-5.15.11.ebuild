# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} != *9999* ]]; then
	QT5_KDEPATCHSET_REV=1
	KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~loong ~ppc ~ppc64 ~riscv ~sparc ~x86"
fi

QT5_MODULE="qtbase"
inherit qt5-build flag-o-matic

DESCRIPTION="Multi-threading concurrence support library for the Qt5 framework"

IUSE=""

DEPEND="=dev-qt/qtcore-${QT5_PV}*:5="
RDEPEND="${DEPEND}"

QT5_TARGET_SUBDIRS=(
	src/concurrent
)

pkg_setup() {
		default
		append-ldflags -Wl,--undefined-version #clang-musl-overlay custom env
}
