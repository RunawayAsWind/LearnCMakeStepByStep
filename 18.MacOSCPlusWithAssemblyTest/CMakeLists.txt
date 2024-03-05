cmake_minimum_required(VERSION 3.11)

project(TestProject VERSION 0.1 LANGUAGES CXX ASM)

set_property(SOURCE assembly.s APPEND PROPERTY COMPILE_OPTIONS "-x" "assembler-with-cpp")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(TestProject main.cpp assembly.s)

target_include_directories(TestProject PUBLIC
              "${PROJECT_BINARY_DIR}"
              )

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})

install(TARGETS TestProject DESTINATION bin)