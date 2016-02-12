#  Copyright (C) 2015 JDE Developers Team
#  Authors:
#    Victor Arribas <v.arribas.urjc@gmail.com>

cmake_minimum_required(VERSION 2.6)


project(ardronelib-dev)

SET (CPACK_PACKAGE_VERSION_MAJOR 1)
SET (CPACK_PACKAGE_VERSION_MINOR 0)
SET (CPACK_PACKAGE_VERSION_PATCH 1)

SET (CPACK_PACKAGE_CONTACT "Victor Arribas <v.arribas.urjc@gmail.com>")
SET (CPACK_PACKAGE_DESCRIPTION_SUMMARY
"Community version of ArDrone SDK 2.0.1 by Parrot
 You can obtain a copy of source code from: https://github.com/AutonomyLab/ardronelib/
 .
 Embedded dependencies:
   * FFMPEG 0.8 - http://ffmpeg.org/
   * iniparser 3.0b - http://ndevilla.free.fr/iniparser/
")

SET(CPACK_DEBIAN_PACKAGE_DEPENDS "daemontools, libsdl1.2-dev, libgtk2.0-dev, libxml2-dev, libudev-dev")

SET (CPACK_DEBIAN_PACKAGE_PRIORITY "extra")
SET (CPACK_DEBIAN_PACKAGE_SECTION "devel")


SET (CPACK_GENERATOR "DEB")
SET (CPACK_DEBIAN_PACKAGE_SHLIBDEPS OFF)
SET (CPACK_SET_DESTDIR ON)
SET (CPACK_PACKAGING_INSTALL_PREFIX "/usr/local")


include (CPack Documentation)
