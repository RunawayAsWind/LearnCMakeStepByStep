message("\n")
message("----------------") 
message("Before add all sources(test3): ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources(test3): ${DIR_SRCS}") 
unset(DIR_SRCS)
message("After unset(test3): ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("After add all sources(test3): ${DIR_SRCS}") 
message("----------------") 
message("\n")

add_library (Test3 ${DIR_SRCS})





