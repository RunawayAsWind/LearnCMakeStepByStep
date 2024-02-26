::Turns off the command echoing feature.Use UTF-8 code page to avoid chinese garbled、clear cmd
::code-page     https://docs.microsoft.com/en-us/windows/win32/intl/code-page-identifiers
@echo off
chcp 65001
CLS

::Displays the directory structure of a path or of the disk in a drive graphically
tree /F 
echo.

::Create directory to save VS Project，and execute cmake and build VS Project
cmake -G "Visual Studio 16 2019" -A x64 -B build -D CMAKE_CONFIGURATION_TYPES="Release;Debug"
cmake --build build --config debug --target install
cmake --build build --config release --target install
echo.
echo "-------------------Project Build Finish-------------------"
echo.

pause