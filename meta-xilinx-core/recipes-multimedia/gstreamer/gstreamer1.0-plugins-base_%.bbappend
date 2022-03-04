# OpenGL comes from libmali on ev/eg, when egl is enabled
DEPENDS_MALI_XLNX = "${@bb.utils.contains('PACKAGECONFIG', 'egl', ' libmali-xlnx', '', d)}"
DEPENDS:append:mali400 = "${@bb.utils.contains('WRL_RECIPES:xilinx', 'libmali-xlnx', ' ${DEPENDS_MALI_XLNX}', ' mesa', d)}"

PACKAGE_ARCH:mali400 = "${@bb.utils.contains('PACKAGECONFIG', 'egl', '${SOC_VARIANT_ARCH}', '${TUNE_PKGARCH}', d)}"
