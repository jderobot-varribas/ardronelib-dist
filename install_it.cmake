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
install(FILES
	"${CMAKE_BINARY_DIR}/ardronelib.pc"
	"${CMAKE_BINARY_DIR}/ffmpeg-0.8.pc"
	DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/"
)

add_custom_command(TARGET uninstall
	WORKING_DIRECTORY "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig/"
	COMMAND ${CMAKE_COMMAND} -E remove ardronelib.pc ffmpeg-0.8.pc
)
