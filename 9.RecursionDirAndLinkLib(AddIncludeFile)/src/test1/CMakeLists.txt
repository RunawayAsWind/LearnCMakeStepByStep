message("\n")
message("----------------") 
message("Before add all sources(test1): ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources(test1): ${DIR_SRCS}") 
unset(DIR_SRCS)
message("After unset(test1): ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources(test1): ${DIR_SRCS}")
message("----------------") 
message("\n")

add_library (Test1 ${DIR_SRCS})
target_include_directories(Test1 PUBLIC "${CMAKE_CURRENT_LIST_DIR}/test2")

add_subdirectory("./test2")

target_link_libraries(Test1 Test2)



