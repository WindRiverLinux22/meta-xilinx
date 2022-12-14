# We WANT to default to this version when available
DEFAULT_PREFERENCE = "100"

# Reset this
SRC_URI = "${EMBEDDEDSW_SRCURI}"

inherit esw

# Not compatible with Zynq
COMPATIBLE_MACHINE:zynq = "none"

ESW_COMPONENT_SRC = "/lib/sw_apps/undefined/src"
ESW_COMPONENT_SRC:zynq = "/lib/sw_apps/zynq_fsbl/src"
ESW_COMPONENT_SRC:zynqmp = "/lib/sw_apps/zynqmp_fsbl/src"

DEPENDS += "xilstandalone xiltimer xilffs xilsecure xilpm"

python() {
    psu_init_path = d.getVar('PSU_INIT_PATH')
    if not psu_init_path:
        psu_init_path = os.path.dirname(d.getVar('SYSTEM_DTFILE'))

    psu_init_c = os.path.join(psu_init_path, 'psu_init.c')
    psu_init_h = os.path.join(psu_init_path, 'psu_init.h')

    if os.path.exists(psu_init_c):
        d.appendVar('SRC_URI', ' file://%s' % psu_init_c)
    else:
        bb.warn("Unable to find %s, using default version" % psu_init_c)
    if os.path.exists(psu_init_h):
        d.appendVar('SRC_URI', ' file://%s' % psu_init_h)
    else:
        bb.warn("Unable to find %s, using default version" % psu_init_h)
}

do_install() {
    :
}

addtask deploy before do_build after do_package

ESW_COMPONENT = "undefined"
ESW_COMPONENT:zynq = "zynq_fsbl.elf"
ESW_COMPONENT:zynqmp = "zynqmp_fsbl.elf"

CFLAGS:append:aarch64 = " -DARMA53_64"
CFLAGS:append:armv7r = " -DARMR5"
