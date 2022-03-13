# CMake minimum version
cmake_minimum_required (VERSION 2.6)

# How to change parent scope Variable by macro
macro(BadFunc1 A)
	message("BadFunc1: ${A}")
	unset(A)
	message("BadFunc1 unset: ${A}")
endmacro()

macro(GoodFunc1 A)
	message("GoodFunc1: ${A}")
	unset(${A})
	message("GoodFunc1 unset: ${A}")
endmacro()

macro(GoodFunc2 A)
	message("GoodFunc1: ${A}")
	set(${A} "CBA")
	message("GoodFunc1 unset: ${A}")
endmacro()


# Set the name of the project.
project (Demo)

message("\n")
message("-------------CMakeOut--------------")
message("\n")

include("${PROJECT_SOURCE_DIR}/CMakeHelp/PathHelp.cmake")

message("MainScope \n")
set(TEST1 "ABC")
message("Before unset: ${TEST1}")
unset(TEST1)
message("After unset: ${TEST1}")
message("\n")

message("BadFunc1 \n")
set(TEST2 "ABC")
message("Before BadFunc1 unset: ${TEST2}")
BadFunc1(TEST2)
message("After BadFunc1 unset: ${TEST2}")
message("\n")

message("GoodFunc1 \n")
set(TEST3 "ABC")
message("Before GoodFunc1 unset: ${TEST3}")
GoodFunc1(TEST3)
message("After GoodFunc1 unset: ${TEST3}")
message("\n")

message("GoodFunc2 \n")
set(TEST4 "ABC")
message("Before GoodFunc2 unset: ${TEST4}")
GoodFunc2(TEST4)
message("After GoodFunc2 unset: ${TEST4}")
message("\n")

message("\n")
message("-------------CMakeOut--------------")
message("\n")

# Add an executable to the project using the specified source files.
add_executable (Demo "./main.cpp")