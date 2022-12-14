# The format of this file must be compatible with
# meta-xilinx/meta-xilinx-standalone/classes/xlnx-embeddedsw.bbclass

# Make it clear decoupling is 'experimental' in the version
ESW_VER = "experimental"

REPO = "git://github.com/Xilinx/embeddedsw-experimental-dt-support.git;protocol=https"

ESW_BRANCH[experimental] = "xilinx-v2021.1-sdt-experimental"
ESW_REV[experimental] = "329bf8fa54110034c8436d0b3b4aa40e8a56b02d"
LIC_FILES_CHKSUM[master] = '7c92de7a21a6613265035c28f4a92f48'
LIC_FILES_CHKSUM[xilinx-v2021.1-sdt-experimental] = '7c92de7a21a6613265035c28f4a92f48'

