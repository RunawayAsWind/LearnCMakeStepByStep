message("\n")
message("----------------") 
message("Before add all sources(test2): ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources(test2): ${DIR_SRCS}") 
unset(DIR_SRCS)
message("After unset(test2): ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("Before add all sources(test2): ${DIR_SRCS}") 
message("----------------") 
message("\n")

add_library (Test2 ${DIR_SRCS})

add_subdirectory("./test3")
target_link_libraries(Test2 Test3)



