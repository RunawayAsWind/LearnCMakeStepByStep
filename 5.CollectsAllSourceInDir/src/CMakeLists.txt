# CMake minimum version
cmake_minimum_required (VERSION 2.6)

# Set the name of the project.
project (Demo)

message("\n")
message("-------------CMakeOut--------------")
message("\n")

include("${PROJECT_SOURCE_DIR}/CMakeHelp/PathHelp.cmake")


# Collects the names of all the source files in the specified directory and stores the list
message("\n")
message("----------------") 
message("Before add all sources: ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources: ${DIR_SRCS}") 
message("----------------") 
message("\n")

message("\n")
message("-------------CMakeOut--------------")
message("\n")

# Add an executable to the project using the specified source files.
add_executable (Demo ${DIR_SRCS})