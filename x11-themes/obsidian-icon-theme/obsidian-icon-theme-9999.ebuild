# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

GIT_PN="iconpack-obsidian"

inherit xdg

DESCRIPTION="Obsidian Icon Theme is intuitive Faenza-like icon theme"

HOMEPAGE="https://github.com/madmaxms/iconpack-obsidian"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/madmaxms/${GIT_PN}.git"
else
	SRC_URI="https://github.com/madmaxms/${GIT_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
	S="${WORKDIR}/${GIT_PN}-${PV}"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	x11-themes/adwaita-icon-theme
"

DEPEND="${RDEPEND}"

DOCS=( README.md )

src_install() {
	# Remove dead links to fix symbolic link does not exist QA.
	find . -xtype l -exec rm {} + || die
	# Install the icons
	insinto /usr/share/icons
	doins -r Obsidian*
}
