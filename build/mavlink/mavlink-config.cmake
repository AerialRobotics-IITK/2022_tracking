# Force case-sensitive search
string(COMPARE EQUAL "mavlink" "${CMAKE_FIND_PACKAGE_NAME}" case_sensitive_match)
if (NOT case_sensitive_match)
  if (NOT ${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
    message(AUTHOR_WARNING "got '${CMAKE_FIND_PACKAGE_NAME}', use case-sensitive find_package(mavlink) instead")
  endif()
  set(${CMAKE_FIND_PACKAGE_NAME}_FOUND false)
  return()
endif()

if (mavlink_CONFIG_INCLUDED)
  return()
endif()
set(mavlink_CONFIG_INCLUDED TRUE)

get_filename_component(include "${mavlink_DIR}/../../../include" ABSOLUTE)
set(mavlink_INCLUDE_DIRS ${include})
set(mavlink_DIALECTS ASLUAV;AVSSUAS;all;ardupilotmega;common;development;icarous;matrixpilot;paparazzi;standard;storm32;uAvionix;ualberta)
set(mavlink2_DIALECTS ASLUAV;AVSSUAS;all;ardupilotmega;common;development;icarous;matrixpilot;paparazzi;standard;storm32;uAvionix;ualberta)

foreach(lib )
  set(onelib "${lib}-NOTFOUND")
  find_library(onelib ${lib}
      PATHS "/home/harshit/2022_tracking/devel/lib"
    NO_DEFAULT_PATH
    )
  if(NOT onelib)
    message(FATAL_ERROR "Library '${lib}' in package mavlink is not installed properly")
  endif()
  list(APPEND mavlink_LIBRARIES ${onelib})
endforeach()

foreach(dep )
  if(NOT ${dep}_FOUND)
    find_package(${dep})
  endif()
  list(APPEND mavlink_INCLUDE_DIRS ${${dep}_INCLUDE_DIRS})
  list(APPEND mavlink_LIBRARIES ${${dep}_LIBRARIES})
endforeach()
