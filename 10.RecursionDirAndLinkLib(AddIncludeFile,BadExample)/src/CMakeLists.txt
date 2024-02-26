cmake_minimum_required (VERSION 2.6)

project (Demo)

message("\n")
message("-------------CMakeOut--------------")
message("\n")

include("${PROJECT_SOURCE_DIR}/CMakeHelp/PathHelp.cmake")


# Collects the names of all the source files in the specified directory and stores the list
message("\n")
message("test CMakeLists Start")
message("----------------") 
message("Before add all sources: ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)	#add into list,not override
message("Adter add all sources: ${DIR_SRCS}") 
message("----------------") 
message("\n")

# Set is override
message("\n")
message("----------------") 
message("before Set: ${AAA}") 
set(AAA "sb")				
message("after Set: ${AAA}") 
message("----------------") 
message("\n")

# List append is add
message("\n")
message("----------------") 
message("before List: ${BBB}") 
list(APPEND BBB ${AAA})				
message("after List: ${BBB}") 
message("----------------") 
message("\n")
 

# Father Scope variable "DIR_SRCS" can be used in subdirectory's CMakeLists.txt,I want to collect source file in sub subdirectory's CMakeLists.txt,and add them in to "DIR_SRCS"
add_subdirectory("./test1")


# However,after add_subdirectory,this scope's variable not change,because not use PARENT_SCOPE
message("\n")
message("----------------") 
message("last aux: ${DIR_SRCS}") 
message("----------------") 
message("\n")

message("\n")
message("----------------") 
message("last List: ${BBB}") 
message("----------------") 
message("test CMakeLists End")
message("\n")

message("\n")
message("-------------CMakeOut--------------")
message("\n")

add_executable (Demo "${DIR_SRCS}")

#Summarize：Father Scope variables can be used in subdirectory's CMakeLists.txt,but need to PARENT_SCOPE to change them value
#If we want to recursion directory and collect source file.Use camke's "GLOB" code instead of APPEND in subdirectory's CMakeLists.txt



