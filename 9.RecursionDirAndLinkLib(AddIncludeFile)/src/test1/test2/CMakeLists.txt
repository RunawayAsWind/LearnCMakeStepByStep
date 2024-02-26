message("\n")
message("----------------") 
message("Before add all sources(test2): ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources(test2): ${DIR_SRCS}") 
unset(DIR_SRCS)
message("After unset(test1): ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources(test2): ${DIR_SRCS}")
message("----------------") 
message("\n")

add_library (Test2 ${DIR_SRCS})
target_include_directories(Test2 PUBLIC "${CMAKE_CURRENT_LIST_DIR}/test3")

add_subdirectory("./test3")

target_link_libraries(Test2 Test3)


