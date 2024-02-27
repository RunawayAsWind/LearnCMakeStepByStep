cmake_minimum_required(VERSION 3.10)

project(MyProject)

# 设置 C++ 编译选项
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
enable_language(ASM)  # 让CMacke启用NASM的汇编

# 设置源文件
set(SOURCES
    main.cpp
    assembly.s
)

# 添加可执行文件
add_executable(my_program ${SOURCES})