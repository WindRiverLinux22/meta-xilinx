PACKAGECONFIG:mali400 = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
                         ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'egl glesv2', '', d)} \
                         trace"

# OpenGL comes from libmali
DEPENDS:append:mali400 = " libmali-xlnx"

PACKAGE_ARCH:mali400 = "${SOC_VARIANT_ARCH}"
