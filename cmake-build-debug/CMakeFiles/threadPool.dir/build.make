# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/avi/Desktop/clion-2019.2.5/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/avi/Desktop/clion-2019.2.5/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/avi/CLionProjects/threadPool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/avi/CLionProjects/threadPool/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/threadPool.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/threadPool.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/threadPool.dir/flags.make

CMakeFiles/threadPool.dir/threadPool.c.o: CMakeFiles/threadPool.dir/flags.make
CMakeFiles/threadPool.dir/threadPool.c.o: ../threadPool.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/avi/CLionProjects/threadPool/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/threadPool.dir/threadPool.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/threadPool.dir/threadPool.c.o   -c /home/avi/CLionProjects/threadPool/threadPool.c

CMakeFiles/threadPool.dir/threadPool.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/threadPool.dir/threadPool.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/avi/CLionProjects/threadPool/threadPool.c > CMakeFiles/threadPool.dir/threadPool.c.i

CMakeFiles/threadPool.dir/threadPool.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/threadPool.dir/threadPool.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/avi/CLionProjects/threadPool/threadPool.c -o CMakeFiles/threadPool.dir/threadPool.c.s

CMakeFiles/threadPool.dir/osqueue.c.o: CMakeFiles/threadPool.dir/flags.make
CMakeFiles/threadPool.dir/osqueue.c.o: ../osqueue.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/avi/CLionProjects/threadPool/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/threadPool.dir/osqueue.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/threadPool.dir/osqueue.c.o   -c /home/avi/CLionProjects/threadPool/osqueue.c

CMakeFiles/threadPool.dir/osqueue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/threadPool.dir/osqueue.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/avi/CLionProjects/threadPool/osqueue.c > CMakeFiles/threadPool.dir/osqueue.c.i

CMakeFiles/threadPool.dir/osqueue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/threadPool.dir/osqueue.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/avi/CLionProjects/threadPool/osqueue.c -o CMakeFiles/threadPool.dir/osqueue.c.s

CMakeFiles/threadPool.dir/test.c.o: CMakeFiles/threadPool.dir/flags.make
CMakeFiles/threadPool.dir/test.c.o: ../test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/avi/CLionProjects/threadPool/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/threadPool.dir/test.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/threadPool.dir/test.c.o   -c /home/avi/CLionProjects/threadPool/test.c

CMakeFiles/threadPool.dir/test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/threadPool.dir/test.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/avi/CLionProjects/threadPool/test.c > CMakeFiles/threadPool.dir/test.c.i

CMakeFiles/threadPool.dir/test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/threadPool.dir/test.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/avi/CLionProjects/threadPool/test.c -o CMakeFiles/threadPool.dir/test.c.s

# Object files for target threadPool
threadPool_OBJECTS = \
"CMakeFiles/threadPool.dir/threadPool.c.o" \
"CMakeFiles/threadPool.dir/osqueue.c.o" \
"CMakeFiles/threadPool.dir/test.c.o"

# External object files for target threadPool
threadPool_EXTERNAL_OBJECTS =

threadPool: CMakeFiles/threadPool.dir/threadPool.c.o
threadPool: CMakeFiles/threadPool.dir/osqueue.c.o
threadPool: CMakeFiles/threadPool.dir/test.c.o
threadPool: CMakeFiles/threadPool.dir/build.make
threadPool: CMakeFiles/threadPool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/avi/CLionProjects/threadPool/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable threadPool"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/threadPool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/threadPool.dir/build: threadPool

.PHONY : CMakeFiles/threadPool.dir/build

CMakeFiles/threadPool.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/threadPool.dir/cmake_clean.cmake
.PHONY : CMakeFiles/threadPool.dir/clean

CMakeFiles/threadPool.dir/depend:
	cd /home/avi/CLionProjects/threadPool/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/avi/CLionProjects/threadPool /home/avi/CLionProjects/threadPool /home/avi/CLionProjects/threadPool/cmake-build-debug /home/avi/CLionProjects/threadPool/cmake-build-debug /home/avi/CLionProjects/threadPool/cmake-build-debug/CMakeFiles/threadPool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/threadPool.dir/depend
