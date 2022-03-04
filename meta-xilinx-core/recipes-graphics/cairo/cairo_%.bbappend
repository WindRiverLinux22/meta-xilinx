PACKAGECONFIG:mali400 = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
                         ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'egl glesv2', '', d)} \
                         trace"

# OpenGL comes from libmali
DEPENDS:append:mali400 = "${@bb.utils.contains('WRL_RECIPES:xilinx', 'libmali-xlnx', ' libmali-xlnx', ' mesa', d)}"

PACKAGE_ARCH:mali400 = "${SOC_VARIANT_ARCH}"
