# CMake minimum version 
cmake_minimum_required (VERSION 2.6)

# How to change parent scope Variable by function
function(BadFunc1 A)
	message("BadFunc1: ${A}")
	unset(A)
	message("BadFunc1 unset: ${A}")
endfunction()

function(BadFunc2 A)
	message("BadFunc2: ${A}")
	unset(A PARENT_SCOPE)
	message("BadFunc2: ${A}")
endfunction()

function(BadFunc3 A)
	message("BadFunc3: ${A}")
	unset(${A})
	message("BadFunc3 unset: ${A}")
endfunction()

function(GoodFunc1 A)
	message("GoodFunc1: ${A}")
	unset(${A} PARENT_SCOPE)
	message("GoodFunc1: ${A}")
endfunction()

function(GoodFunc2 A)
	message("GoodFunc2: ${A}")
	set(${A} "CBA" PARENT_SCOPE)
	message("GoodFunc2: ${A}")
endfunction()

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

message("BadFunc2 \n")
set(TEST3 "ABC")
message("Before BadFunc2 unset: ${TEST3}")
BadFunc2(TEST3)
message("After BadFunc2 unset: ${TEST3}")
message("\n")

message("BadFunc3 \n")
set(TEST4 "ABC")
message("Before BadFunc3 unset: ${TEST4}")
BadFunc3(${TEST4})
message("After BadFunc3 unset: ${TEST4}")
message("\n")

message("GoodFunc1 \n")
set(TEST5 "ABC")
message("Before GoodFunc1 unset: ${TEST5}")
GoodFunc1(TEST5)
message("After GoodFunc1 unset: ${TEST5}")
message("\n")

message("GoodFunc2 \n")
set(TEST6 "ABC")
message("Before GoodFunc2 unset: ${TEST6}")
GoodFunc2(TEST6)
message("After GoodFunc2 unset: ${TEST6}")
message("\n")

message("\n")
message("-------------CMakeOut--------------")
message("\n")

# Add an executable to the project using the specified source files.
add_executable (Demo "./main.cpp")