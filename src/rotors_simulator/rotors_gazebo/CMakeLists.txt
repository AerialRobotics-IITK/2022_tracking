cmake_minimum_required(VERSION 2.8.3)
project(rotors_gazebo)

add_definitions(-std=c++11)

#--------------------------#
# Generation of SDF models #
#--------------------------#

# We need Gazebo version >= 3.0.0 to generate iris.sdf file
# (gz sdf ... command needs to be available)
find_package(gazebo REQUIRED)
find_package(PythonInterp REQUIRED)

if(${gazebo_VERSION_MAJOR} GREATER 2)
    message(STATUS "Building iris.sdf.")
    
    set(enable_mavlink_interface "true")
    set(enable_ground_truth "false")
    set(enable_logging "false")
    set(enable_camera "false")
    set(enable_wind "false")
    set(rotors_description_dir "${CMAKE_CURRENT_SOURCE_DIR}/models/rotors_description")
    set(scripts_dir "${CMAKE_CURRENT_SOURCE_DIR}/scripts")
    
    # Creates shell commands to generate .sdf file
    add_custom_command(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/models/iris/iris.sdf
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      COMMAND rm -f ${CMAKE_CURRENT_SOURCE_DIR}/models/iris/iris.sdf
      COMMAND ${PYTHON_EXECUTABLE} ${scripts_dir}/xacro.py -o  ${rotors_description_dir}/urdf/iris_base.urdf  ${rotors_description_dir}/urdf/iris_base.xacro enable_mavlink_interface:=${enable_mavlink_interface} enable_ground_truth:=${enable_ground_truth} enable_wind:=${enable_wind} enable_logging:=${enable_logging} rotors_description_dir:=${rotors_description_dir}
      COMMAND gz sdf -p  ${rotors_description_dir}/urdf/iris_base.urdf >> ${CMAKE_CURRENT_SOURCE_DIR}/models/iris/iris.sdf
      COMMAND rm -f ${rotors_description_dir}/urdf/iris_base.urdf
      DEPENDS ${rotors_description_dir}/urdf/iris.xacro
      DEPENDS ${rotors_description_dir}/urdf/iris_base.xacro
      DEPENDS ${rotors_description_dir}/urdf/component_snippets.xacro
      )
    add_custom_target(sdf ALL DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/models/iris/iris.sdf)
else()
  message(STATUS "Gazebo version is less than 3, cannot generate iris.sdf (gz tool not available).")
endif()

if(NO_ROS)
  message(STATUS "NO_ROS = true, not building waypoint publisher or hovering example, returning now.")
  return()
endif()

# generate_messages(
#   DEPENDENCIES
#   sensor_msgs std_msgs
# )

find_package(catkin REQUIRED COMPONENTS gazebo_msgs geometry_msgs mav_msgs roscpp sensor_msgs cv_bridge image_transport std_msgs message_generation)

catkin_package(
  CATKIN_DEPENDS
    gazebo_msgs
    geometry_msgs
    mav_msgs
    roscpp
    sensor_msgs
    cv_bridge
    message_runtime
)



include_directories(include ${catkin_INCLUDE_DIRS})
include_directories(include ${OpenCV_INCLUDE_DIRS})
#add_executable(webcam_pub src/webcam_pub.cpp)
#target_link_libraries(webcam_pub ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
# add_dependencies(webcam_pub_cpp ${catkin_EXPORTED_TARGETS})
# add_executable(webcam_pub src/webcam_pub.cpp)
# target_link_libraries(webcam_pub ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
#add_dependencies(webcam_pub_cpp ${catkin_EXPORTED_TARGETS})
add_executable(webcam_pub src/webcam_pub.cpp)
target_link_libraries(webcam_pub ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
# add_executable(track src/track.cpp)
# target_link_libraries(track ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
# add_dependencies(track ${catkin_EXPORTED_TARGETS})  



# add_library(tracker_lib
  # ${PROJECT_NAME}
  # src/${PROJECT_NAME}/tracker_node.cpp
  # src/trackerKCF.cpp
  #src/tracker_node.cpp
# )
# add_executable(tracker_combined src/tracker.cpp)

# add_executable(trackerKCF src/trackerKCF.cpp)
# add_executable(tracker_node src/tracker_node.cpp)

add_executable(waypoint_publisher src/waypoint_publisher.cpp)
target_link_libraries(waypoint_publisher ${catkin_LIBRARIES})
add_dependencies(waypoint_publisher ${catkin_EXPORTED_TARGETS})

add_executable(waypoint_publisher_file src/waypoint_publisher_file.cpp)
target_link_libraries(waypoint_publisher_file ${catkin_LIBRARIES})
add_dependencies(waypoint_publisher_file ${catkin_EXPORTED_TARGETS})

add_executable(hovering_example src/hovering_example.cpp)
target_link_libraries(hovering_example ${catkin_LIBRARIES})
add_dependencies(hovering_example ${catkin_EXPORTED_TARGETS})


add_executable(colour_based_detection src/colour_based_detection.cpp)
target_link_libraries(colour_based_detection ${catkin_LIBRARIES})
add_dependencies(colour_based_detection ${catkin_EXPORTED_TARGETS})

foreach(dir launch models resource worlds)
   install(DIRECTORY ${dir}/
      DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)

install(TARGETS waypoint_publisher waypoint_publisher_file hovering_example
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
