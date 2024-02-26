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

add_subdirectory("./test2")
target_link_libraries(Test1 Test2)




