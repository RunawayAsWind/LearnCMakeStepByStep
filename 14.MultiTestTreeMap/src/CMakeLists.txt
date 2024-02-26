cmake_minimum_required (VERSION 3.1)

project (ProjName)
set(CMAKE_CXX_STANDARD 17)
include("CMakeHelp/PathHelp.cmake")

#获取库相关的代码，存在libcode列表中
set(libdir "${PROJECT_SOURCE_DIR}/LibName")
FolderTraRCS_GetCode(libcode ${libdir})
AddTarget(LIB NAME "LibName" FOLDER "Lib" LIB_INCLUDE_DIR ${libdir} CODERES ${libcode})

SrcCodeGroupRCS(${libdir} "LibName")
AddTarget(CUREXE NAME "Demo" FOLDER "Demo" CODERES ${libcode} LIBRES LibName)

# 添加子目录
AddSubDirRCS("${PROJECT_SOURCE_DIR_FATHER}/test" "${PROJECT_BINARY_DIR_FATHER}")
