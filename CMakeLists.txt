#  Copyright (C) 2015 JDE Developers Team
#  Authors:
#    Victor Arribas <v.arribas.urjc@gmail.com>

cmake_minimum_required(VERSION 2.8)

project(ardronelib)


## Build ARDrone SDK here
set (ARDRONE_SDK_FLAVOR "autonomy-gps" CACHE STRING "ARDrone SDK flavor.
Available options:
 * official-patched - stripped vanilla SDK 2.0.1 with makefile patches to allow build
 * autonomy-lastest - possible fixes and features (like multiple robots with same driver)
 * autonomy-gps - experimental GPS support")

if (${ARDRONE_SDK_FLAVOR} STREQUAL "official-patched")
    set(GIT_TAG bdacd1cbd3fbc54263d29e6e2067265e5941d10e)
elseif (${ARDRONE_SDK_FLAVOR} STREQUAL "autonomy-lastest")
    set(GIT_TAG master)
elseif (${ARDRONE_SDK_FLAVOR} STREQUAL "autonomy-gps")
    set(GIT_TAG gps)
endif()

message("ardronelib version: ${ARDRONE_SDK_FLAVOR}")
set(ARDRONE_SDK_NAME "ardronelib" )
set(ARDRONE_SDK_SOURCE_DIR ${CMAKE_BINARY_DIR}/src/${ARDRONE_SDK_NAME}/ARDroneLib)
set(ARDRONE_SDK_LIBRARY_DIR ${CMAKE_BINARY_DIR}/lib/ardrone)

include(ExternalProject)
ExternalProject_Add(${ARDRONE_SDK_NAME}
	GIT_REPOSITORY git://github.com/AutonomyLab/ardronelib.git
	GIT_TAG ${GIT_TAG}
	PREFIX ${CMAKE_BINARY_DIR}
	CONFIGURE_COMMAND echo "No configure"
	BUILD_COMMAND make NO_EXAMPLES=yes QUIET_BUILD=yes
	INSTALL_COMMAND make install INSTALL_PREFIX=${ARDRONE_SDK_LIBRARY_DIR}
	BUILD_IN_SOURCE 1
)
ExternalProject_Get_Property(ardronelib SOURCE_DIR)
set(ARDRONE_SDK_MISCELANEOUS_DIR ${SOURCE_DIR})


include(install_it.cmake)
include(cpack_it.cmake)
