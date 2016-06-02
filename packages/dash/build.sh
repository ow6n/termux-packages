TERMUX_PKG_HOMEPAGE=http://gondor.apana.org.au/~herbert/dash/
TERMUX_PKG_DESCRIPTION="Small POSIX-compliant implementation of /bin/sh"
TERMUX_PKG_ESSENTIAL=yes
TERMUX_PKG_VERSION=0.5.8
TERMUX_PKG_BUILD_REVISION=3
TERMUX_PKG_SRCURL=http://ftp.osuosl.org/pub/blfs/svn/d/dash-${TERMUX_PKG_VERSION}.tar.gz
# Official site, down as of 2016-06-02:
# TERMUX_PKG_SRCURL=http://gondor.apana.org.au/~herbert/dash/files/dash-${TERMUX_PKG_VERSION}.tar.gz

termux_step_post_make_install () {
	# Symlink sh -> dash
	rm -f $TERMUX_PREFIX/bin/sh $TERMUX_PREFIX/share/man/man1/sh.1
	cd $TERMUX_PREFIX/bin
	ln -s dash sh
	cd $TERMUX_PREFIX/share/man/man1
	ln -s dash.1 sh.1
}
