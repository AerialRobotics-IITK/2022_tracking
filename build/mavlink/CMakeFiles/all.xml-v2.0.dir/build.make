# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/harshit/2022_tracking/src/mavlink

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/harshit/2022_tracking/build/mavlink

# Utility rule file for all.xml-v2.0.

# Include any custom commands dependencies for this target.
include CMakeFiles/all.xml-v2.0.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/all.xml-v2.0.dir/progress.make

CMakeFiles/all.xml-v2.0: all-v2.0-cxx-stamp

all-v2.0-cxx-stamp: /home/harshit/2022_tracking/src/mavlink/message_definitions/v1.0/all.xml
all-v2.0-cxx-stamp: /home/harshit/2022_tracking/src/mavlink/message_definitions/v1.0/common.xml
all-v2.0-cxx-stamp: /home/harshit/2022_tracking/src/mavlink/pymavlink/tools/mavgen.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/harshit/2022_tracking/build/mavlink/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating all-v2.0-cxx-stamp"
	/usr/bin/env PYTHONPATH="/home/harshit/2022_tracking/src/mavlink:/home/harshit/catkin_ws/devel/lib/python3/dist-packages:/opt/ros/noetic/lib/python3/dist-packages" /usr/bin/python3.8 /home/harshit/2022_tracking/src/mavlink/pymavlink/tools/mavgen.py --lang=C++11 --wire-protocol=2.0 --output=include/v2.0 /home/harshit/2022_tracking/src/mavlink/message_definitions/v1.0/all.xml
	touch all-v2.0-cxx-stamp

all.xml-v2.0: CMakeFiles/all.xml-v2.0
all.xml-v2.0: all-v2.0-cxx-stamp
all.xml-v2.0: CMakeFiles/all.xml-v2.0.dir/build.make
.PHONY : all.xml-v2.0

# Rule to build all files generated by this target.
CMakeFiles/all.xml-v2.0.dir/build: all.xml-v2.0
.PHONY : CMakeFiles/all.xml-v2.0.dir/build

CMakeFiles/all.xml-v2.0.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/all.xml-v2.0.dir/cmake_clean.cmake
.PHONY : CMakeFiles/all.xml-v2.0.dir/clean

CMakeFiles/all.xml-v2.0.dir/depend:
	cd /home/harshit/2022_tracking/build/mavlink && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/harshit/2022_tracking/src/mavlink /home/harshit/2022_tracking/src/mavlink /home/harshit/2022_tracking/build/mavlink /home/harshit/2022_tracking/build/mavlink /home/harshit/2022_tracking/build/mavlink/CMakeFiles/all.xml-v2.0.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/all.xml-v2.0.dir/depend

