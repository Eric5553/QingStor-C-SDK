# - Find OPENSSL
# Find the native OPENSSL includes and library
#
#  OPENSSL_INCLUDE_DIR  - where to find openssl/crypto.h, etc.
#  OPENSSL_LIBRARIES    - List of libraries when using OPENSSL.
#  OPENSSL_FOUND        - True if OPENSSL found.

IF (OPENSSL_INCLUDE_DIR AND OPENSSL_LIBRARIES)
  # Already in cache, be silent
  SET(OPENSSL_FIND_QUIETLY TRUE)
ENDIF (OPENSSL_INCLUDE_DIR AND OPENSSL_LIBRARIES)

FIND_PATH(OPENSSL_INCLUDE_DIR openssl/crypto.h)

SET(OPENSSL_NAMES crypto)
FIND_LIBRARY(OPENSSL_LIBRARIES NAMES ${OPENSSL_NAMES})

# handle the QUIETLY and REQUIRED arguments and set OPENSSL_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(crypto DEFAULT_MSG OPENSSL_LIBRARIES OPENSSL_INCLUDE_DIR)

MARK_AS_ADVANCED(OPENSSL_LIBRARIES OPENSSL_INCLUDE_DIR)
