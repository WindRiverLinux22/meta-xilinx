PACKAGECONFIG:mali400 = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
                         egl glesv2 trace"

# OpenGL comes from libmali
DEPENDS:append:mali400 = " libmali-xlnx"

PACKAGE_ARCH:mali400 = "${SOC_VARIANT_ARCH}"
