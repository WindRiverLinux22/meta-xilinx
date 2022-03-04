# OpenGL comes from libmali on ev/eg, when egl is enabled
DEPENDS_MALI_XLNX = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' libmali-xlnx', '', d)}"
DEPENDS_MESA_XLNX = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl vulkan', 'mesa', '', d)}"
DEPENDS:append:mali400 = "${@bb.utils.contains('WRL_RECIPES:xilinx', 'libmali-xlnx', ' ${DEPENDS_MALI_XLNX}', ' ${DEPENDS_MESA_XLNX}', d)}"

PACKAGE_ARCH:mali400 = "${@bb.utils.contains('PACKAGECONFIG', 'egl', '${SOC_VARIANT_ARCH}', '${TUNE_PKGARCH}', d)}"
