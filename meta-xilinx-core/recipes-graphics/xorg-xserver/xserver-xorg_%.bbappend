DEPENDS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'mali400', ' virtual/libgbm', '', d)}"
