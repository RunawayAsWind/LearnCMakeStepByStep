# CMake minimum version 
cmake_minimum_required (VERSION 3.1)

# Set the name of the project.
project (Demo)

message("\n")
message("-------------CMakeOut--------------")
message("\n")

include("CMakeHelp/PathHelp.cmake")

message("\n")
message("-------------CMakeOut--------------")
message("\n")

# Add an executable to the project using the specified source files.
add_executable (Demo main.cpp)