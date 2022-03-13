cmake_minimum_required (VERSION 3.1)

project (Demo)

include("CMakeHelp/PathHelp.cmake")
FolderTraRCS_GetCode(allcode ${PROJECT_SOURCE_DIR})
SrcCodeGroup(${PROJECT_SOURCE_DIR})

add_executable (Demo ${allcode})