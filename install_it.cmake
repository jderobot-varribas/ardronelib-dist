#  Copyright (C) 2015 JDE Developers Team
#  Authors:
#    Victor Arribas <v.arribas.urjc@gmail.com>


## ardronelib
# Install
install(DIRECTORY ${ARDRONE_SDK_LIBRARY_DIR}/
	DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/jderobot/ardrone
)

install(DIRECTORY ${ARDRONE_SDK_SOURCE_DIR}/
	DESTINATION ${CMAKE_INSTALL_PREFIX}/include/jderobot/ardrone
	FILES_MATCHING
		PATTERN "*.h"
		PATTERN README
		PATTERN LICENSE
		PATTERN "Build" EXCLUDE
		REGEX "FFMPEG/ffmpeg" EXCLUDE
)


install(FILES
	"${ARDRONE_SDK_SOURCE_DIR}/../LICENSE"
	"${ARDRONE_SDK_SOURCE_DIR}/../README.md"
	DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jderobot/ardrone"
)
install(FILES
	"${ARDRONE_SDK_SOURCE_DIR}/FFMPEG/ffmpeg/VERSION"
	"${ARDRONE_SDK_SOURCE_DIR}/FFMPEG/ffmpeg/LICENSE"
	"${ARDRONE_SDK_SOURCE_DIR}/FFMPEG/ffmpeg/README"
#	"${ARDRONE_SDK_SOURCE_DIR}/FFMPEG/ffmpeg/COPYING*"
	DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jderobot/ardrone/FFMPEG"
)

# Uninstall
add_custom_target(uninstall
	COMMAND ${CMAKE_COMMAND} -E remove_directory "${CMAKE_INSTALL_PREFIX}/lib/jderobot/ardrone"
	COMMAND ${CMAKE_COMMAND} -E remove_directory "${CMAKE_INSTALL_PREFIX}/include/jderobot/ardrone"
)


## pkg-config
# Config
set(prefix ${CMAKE_INSTALL_PREFIX})
set(libdir ${prefix}/lib/jderobot/ardrone)

set(includedir ${prefix}/include/jderobot/ardrone/FFMPEG/Includes)
configure_file(ffmpeg-0.8.pc.in ffmpeg-0.8.pc)

set(VERSION ${ARDRONE_SDK_FLAVOR})
set(includedir
        ${prefix}/include/jderobot/ardrone/
        ${prefix}/include/jderobot/ardrone/Soft/Common
        ${prefix}/include/jderobot/ardrone/Soft/Lib
        ${prefix}/include/jderobot/ardrone/VP_SDK
        ${prefix}/include/jderobot/ardrone/VP_SDK/VP_Os/linux
        ${prefix}/include/jderobot/ardrone/VP_SDK/VP_Api
)
configure_file(ardronelib.pc.in ardronelib.pc)


# Install
install(FILES
	"${CMAKE_BINARY_DIR}/ardronelib.pc"
	"${CMAKE_BINARY_DIR}/ffmpeg-0.8.pc"
	DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/"
)

add_custom_command(TARGET uninstall
	WORKING_DIRECTORY "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/"
	COMMAND ${CMAKE_COMMAND} -E remove ardronelib.pc ffmpeg-0.8.pc
)
