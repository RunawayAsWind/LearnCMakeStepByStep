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
target_include_directories(Demo PUBLIC "${CMAKE_CURRENT_LIST_DIR}/test1")#这行代码使得可以Demo中的cpp可以直接通过#include <test1.h> 来代替原来的 #include "./test1/test1.h" 
add_subdirectory("./test1")
target_link_libraries(Demo Test1)
get_target_property(propval Demo INCLUDE_DIRECTORIES)
message("\n")
message("${propval}")
message("\n")

message("\n")
message("-------------CMakeOut--------------")
message("\n")

#Summarize：target_include_directories can't construct directory in IDE，construct IDE directory need to use source_group


