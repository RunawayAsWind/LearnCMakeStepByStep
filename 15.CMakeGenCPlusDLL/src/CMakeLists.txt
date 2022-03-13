cmake_minimum_required (VERSION 3.1)

project (Game_Proj)
set(CMAKE_CXX_STANDARD 17)
include("CMakeHelp/PathHelp.cmake")

FolderTra_GetDir(depslibdirlist "${PROJECT_SOURCE_DIR_FATHER}/deps")
message("\n")
message("---------Deps Lib:---------")
foreach(libpath ${depslibdirlist})
	get_filename_component(libname ${libpath} NAME)
	list(APPEND depslibnames ${libname})
	message("${libname}")
endforeach()
message("\n")

#依赖库
AddSubDirRCS("${PROJECT_SOURCE_DIR_FATHER}/deps" "${PROJECT_BINARY_DIR_FATHER}")

#获取库相关的代码，存在libcode列表中
set(libname "Game")
set(libdir "${CMAKE_CURRENT_LIST_DIR}")
set(libincludedir "${CMAKE_CURRENT_LIST_DIR}/Include")

FolderTraRCS_GetCode(libcode ${libdir})
AddTarget(LIB NAME ${libname} FOLDER "Lib" LIB_INCLUDE_DIRS ${libincludedir} CODERES ${libcode} LIBRES ${depslibnames})

SrcCodeGroupRCS(${libdir} "/")
AddTarget(CUREXE NAME "Demo" FOLDER "Demo" CODERES ${libcode} LIBRES ${libname})

# 添加子目录
AddSubDirRCS("${PROJECT_SOURCE_DIR_FATHER}/test" "${PROJECT_BINARY_DIR_FATHER}")
