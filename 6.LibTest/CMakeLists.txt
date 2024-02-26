cmake_minimum_required(VERSION 3.15)

project ( Demo )

include("${PROJECT_SOURCE_DIR}/CMakeHelp/ArchHelp.cmake")

SET(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})

set( STATIC_LIB_SOURCES
    src/LibTest_Static.cpp
)

set( SHARED_LIB_SOURCES
    src/LibTest_Shared.cpp
)


set( EXE_SOURCES
    src/main.cpp
)

add_library( LibTest_static_library STATIC
    ${STATIC_LIB_SOURCES}
)

add_library( LibTest_shared_library SHARED 
    ${SHARED_LIB_SOURCES}
)

target_compile_definitions( LibTest_shared_library PRIVATE BUILD_DLL )

target_include_directories( LibTest_shared_library
    PUBLIC 
        ${PROJECT_SOURCE_DIR}/include
)

target_include_directories( LibTest_static_library
    PUBLIC 
        ${PROJECT_SOURCE_DIR}/include
)

add_executable( LibTest_exe_static_link  ${EXE_SOURCES} )

target_include_directories( LibTest_exe_static_link
    PRIVATE 
        ${PROJECT_SOURCE_DIR}/include
)

target_link_libraries( LibTest_exe_static_link 
    PRIVATE 
        LibTest_static_library
)

add_executable( LibTest_exe_shared_link  ${EXE_SOURCES} )

target_compile_definitions( LibTest_exe_shared_link PRIVATE USE_DLL )

target_link_libraries( LibTest_exe_shared_link 
    PRIVATE 
        LibTest_shared_library
)

target_architecture(Arch)

install(TARGETS LibTest_shared_library LibTest_static_library LibTest_exe_static_link LibTest_exe_shared_link 
        EXPORT MyDemoTargets
		CONFIGURATIONS Debug
        LIBRARY DESTINATION lib/${Arch}/debug
        ARCHIVE DESTINATION lib/${Arch}/debug
        RUNTIME DESTINATION bin/${Arch}/debug
        PUBLIC_HEADER DESTINATION include
        )
		

install(TARGETS LibTest_shared_library LibTest_static_library LibTest_exe_static_link LibTest_exe_shared_link 
        EXPORT MyDemoTargets
		CONFIGURATIONS Release
        LIBRARY DESTINATION lib/${Arch}/release
        ARCHIVE DESTINATION lib/${Arch}/release
        RUNTIME DESTINATION bin/${Arch}/release
        PUBLIC_HEADER DESTINATION include
        )
