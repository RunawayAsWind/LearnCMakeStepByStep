message("\n")
message("test1 CMakeLists Start")
message("----------------") 
message("before aux: ${DIR_SRCS}") 
aux_source_directory("." DIR_SRCS)
message("after aux: ${DIR_SRCS}") 
message("----------------") 
message("\n")

message("\n")
message("----------------") 
message("before Set: ${AAA}") 
set(AAA "sb")		
message("after Set: ${AAA}") 
message("----------------") 
message("\n")

message("\n")
message("----------------") 
message("before List: ${BBB}") 
list(APPEND BBB ${AAA})				
message("after List: ${BBB}") 
message("----------------") 
message("\n")

add_subdirectory("./test2")
message("test1 CMakeLists End")




