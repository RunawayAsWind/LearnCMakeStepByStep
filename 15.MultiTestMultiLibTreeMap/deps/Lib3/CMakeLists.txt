#Set this Lib's depend Lib as "deps","deps" will input to "AddTarget"，in "AddTarget",we use "target_link_libraries" link to now Lib
#set(deps "")
get_filename_component(libname "${CMAKE_CURRENT_LIST_DIR}" NAME)#Libname Set as now directory's name
set(libdir "${CMAKE_CURRENT_LIST_DIR}")
set(libincludedir "${CMAKE_CURRENT_LIST_DIR}/Include")

FolderTraRCS_GetCode(libcode ${libdir})
AddTarget(LIB NAME ${libname} FOLDER "Lib" LIB_INCLUDE_DIRS ${libincludedir} CODERES ${libcode})
SrcCodeGroupRCS(${libdir} "/")