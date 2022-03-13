# CMake minimum version 
cmake_minimum_required (VERSION 2.6)

# Set the name of the project.
project (Demo)

message("\n")
message("-------------CMakeOut--------------")
message("\n")

# Load and run CMake code from a file or module.
include("${PROJECT_SOURCE_DIR}/CMakeHelp/PathHelp.cmake")

message("Demo_BINARY_DIR: ${Demo_BINARY_DIR}")
message("PROJECT_BINARY_DIR,: ${PROJECT_BINARY_DIR}")
message("CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")
message("CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
message("\n")

message("Demo_SOURCE_DIR: ${Demo_SOURCE_DIR}")
message("PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
message("CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")
message("CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
message("\n")

message("EXECUTABLE_OUTPUT_PATH: ${EXECUTABLE_OUTPUT_PATH}")
message("LIBRARY_OUTPUT_PATH: ${LIBRARY_OUTPUT_PATH}")
message("\n")

message("\n")
message("-------------CMakeOut--------------")
message("\n")

# Add an executable to the project using the specified source files.
add_executable (Demo "./main.cpp")