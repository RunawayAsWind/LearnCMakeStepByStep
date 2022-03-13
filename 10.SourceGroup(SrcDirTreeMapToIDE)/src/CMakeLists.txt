cmake_minimum_required (VERSION 2.6)


function(FolderTra_GetFileAndDir result rootdir)
	file(GLOB all LIST_DIRECTORIES true ${rootdir}/*)
	set(${result} ${all} PARENT_SCOPE)
endfunction()

function(FolderTra_GetFile result rootdir)
	file(GLOB allfile LIST_DIRECTORIES false ${rootdir}/*)
	set(${result} ${allfile} PARENT_SCOPE)
endfunction()

function(FolderTra_GetDir result rootdir)
	file(GLOB all LIST_DIRECTORIES true ${rootdir}/*)
	foreach(fileordir ${all})
		if (IS_DIRECTORY ${fileordir})    
			LIST(APPEND alldir ${fileordir})
		endif()
	endforeach()
	set(${result} ${alldir} PARENT_SCOPE)
endfunction()

function(FolderTraRCS_GetFileAndDir result rootdir)
	file(GLOB_RECURSE all LIST_DIRECTORIES true ${rootdir}/*)
	set(${result} ${all} PARENT_SCOPE)
endfunction()

function(FolderTraRCS_GetFile result rootdir)
	file(GLOB_RECURSE allfile LIST_DIRECTORIES false ${rootdir}/*)
	set(${result} ${allfile} PARENT_SCOPE)
endfunction()

function(FolderTraRCS_GetDir result rootdir)
	file(GLOB_RECURSE all LIST_DIRECTORIES true ${rootdir}/*)
	foreach(fileordir ${all})
		if (IS_DIRECTORY ${fileordir})    
			LIST(APPEND alldir ${fileordir})
		endif()
	endforeach()
	set(${result} ${alldir} PARENT_SCOPE)
endfunction()



function(FolderTra_GetCode result rootdir)
	file(GLOB allcode "${rootdir}/*.h" "${rootdir}/*.hpp" "${rootdir}/*.cpp" "${rootdir}/*.c")
	set(${result} ${allcode} PARENT_SCOPE)
endfunction()

function(FolderTraRCS_GetCode result rootdir)
	file(GLOB_RECURSE allcode "${rootdir}/*.h" "${rootdir}/*.hpp" "${rootdir}/*.cpp" "${rootdir}/*.c")
	set(${result} ${allcode} PARENT_SCOPE)
endfunction()

function(SrcCodeGroup rootdir)
	FolderTraRCS_GetDir(dirlist ${rootdir})
	LIST(APPEND dirlist ${rootdir})

	foreach(dir ${dirlist})
		FolderTra_GetCode(dircode ${dir})
		list(LENGTH dircode len)
		
		if (NOT (${dir} STREQUAL ${rootdir}))  
			string(REPLACE "${rootdir}" "" groupname ${dir})
			message("${groupname}     ${len}")
			if (${len} STRGREATER 0)  
				source_group(${groupname} FILES ${dircode})
			endif()
		else()
			message("/     ${len}")
			if (${len} STRGREATER 0) 
				source_group("/" FILES ${dircode})
			endif()
		endif()
	endforeach()
endfunction()

project (Demo)

message("\n")
message("-------------CMakeOut--------------")
message("\n")

include("${PROJECT_SOURCE_DIR}/CMakeHelp/PathHelp.cmake")

message("\n")
message("Traversal folder--File And Dir")
FolderTra_GetFileAndDir(TEST1 ${PROJECT_SOURCE_DIR})
foreach(f ${TEST1})
   message("${f}")
endforeach()

message("\n")
message("Traversal folder--Only File")
FolderTra_GetFile(TEST2 ${PROJECT_SOURCE_DIR})
foreach(f ${TEST2})
   message("${f}")
endforeach()

message("\n")
message("Traversal folder--Only Dir")
FolderTra_GetDir(TEST3 ${PROJECT_SOURCE_DIR})
foreach(f ${TEST3})
   message("${f}")
endforeach()

#
message("\n")
message("Traversal folder RCS--File And Dir")
FolderTraRCS_GetFileAndDir(TEST4 ${PROJECT_SOURCE_DIR})
foreach(f ${TEST4})
   message("${f}")
endforeach()

message("\n")
message("Traversal folder RCS--Only File")
FolderTraRCS_GetFile(TEST5 ${PROJECT_SOURCE_DIR})
foreach(f ${TEST5})
   message("${f}")
endforeach()

message("\n")
message("Traversal folder RCS--Only Dir")
FolderTraRCS_GetDir(TEST6 ${PROJECT_SOURCE_DIR})
foreach(f ${TEST6})
   message("${f}")
endforeach()

message("\n")
message("Traversal folder--Only Code")
FolderTra_GetCode(TEST7 ${PROJECT_SOURCE_DIR})
foreach(f ${TEST7})
   message("${f}")
endforeach()

message("\n")
message("Traversal folder RCS--Only Code")
FolderTraRCS_GetCode(TEST8 ${PROJECT_SOURCE_DIR})
foreach(f ${TEST8})
   message("${f}")
endforeach()

message("\n")
message("SrcCodeGroup")
SrcCodeGroup(${PROJECT_SOURCE_DIR})
message("\n")

message("\n")
message("-------------CMakeOut--------------")
message("\n")

include_directories(${TEST6})
add_executable (Demo ${TEST8})



