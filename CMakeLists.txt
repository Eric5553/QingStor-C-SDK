CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT(libqingstor)

SET(CMAKE_VERBOSE_MAKEFILE ON CACHE STRING "Verbose build." FORCE)

IF(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    MESSAGE(FATAL_ERROR "cannot build the project in the source directory! Out-of-source build is enforced!")
ENDIF()

SET(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake" ${CMAKE_MODULE_PATH})

INCLUDE(Platform)
INCLUDE(Functions)
INCLUDE(Options)

FIND_PACKAGE(JsonC REQUIRED)
FIND_PACKAGE(Boost REQUIRED)
FIND_PACKAGE(Yaml REQUIRED)
FIND_PACKAGE(Curl REQUIRED)
FIND_PACKAGE(OpenSsl REQUIRED)

ADD_SUBDIRECTORY(mock)
ADD_SUBDIRECTORY(src)
ADD_SUBDIRECTORY(gtest)
ADD_SUBDIRECTORY(gmock)
ADD_SUBDIRECTORY(test)

ADD_CUSTOM_TARGET(style
	COMMAND astyle --style=attach --indent=spaces=4 --indent-preprocessor --break-blocks --pad-oper --pad-header --unpad-paren --delete-empty-lines --suffix=none --align-pointer=middle --lineend=linux --indent-col1-comments ${libqingstor_SOURCES}
	COMMAND astyle --style=attach --indent=spaces=4 --indent-preprocessor --break-blocks --pad-oper --pad-header --unpad-paren --delete-empty-lines --suffix=none --align-pointer=middle --lineend=linux --indent-col1-comments ${unit_SOURCES}
	COMMAND astyle --style=attach --indent=spaces=4 --indent-preprocessor --break-blocks --pad-oper --pad-header --unpad-paren --delete-empty-lines --suffix=none --align-pointer=middle --lineend=linux --indent-col1-comments ${function_SOURCES}
	COMMAND astyle --style=attach --indent=spaces=4 --indent-preprocessor --break-blocks --pad-oper --pad-header --unpad-paren --delete-empty-lines --suffix=none --align-pointer=middle --lineend=linux --indent-col1-comments ${secure_SOURCES}
	WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
	COMMENT "format code style..."
)

