# CMake minimum version
cmake_minimum_required (VERSION 2.6)

# Set the name of the project.
project (Demo)

message("\n")
message("-------------CMakeOut--------------")
message("\n")

include("${PROJECT_SOURCE_DIR}/CMakeHelp/PathHelp.cmake")

message("\n")
message("----------------") 
message("Before add all sources: ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources: ${DIR_SRCS}") 
unset(DIR_SRCS)
message("After unset: ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources: ${DIR_SRCS}") 
message("----------------") 
message("\n")

add_executable (Demo "${DIR_SRCS}")
add_subdirectory("./test1")
target_link_libraries(Demo Test1)

message("\n")
message("-------------CMakeOut--------------")
message("\n")

# Summarize：Different Lib can use same file name



