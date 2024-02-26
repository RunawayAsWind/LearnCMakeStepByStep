::Turns off the command echoing feature.Use UTF-8 code page to avoid chinese garbled、clear cmd
::code-page     https://docs.microsoft.com/en-us/windows/win32/intl/code-page-identifiers
@echo off
chcp 65001
CLS

::Displays the directory structure of a path or of the disk in a drive graphically
tree /F 
echo.

::Create directory to save VS Project，and execute cmake and build VS Project
mkdir "./build/default/proj"
cd "./src"
cmake -S "." -B "../build/default/proj"
cmake --build "../build/default/proj" --target Demo --config Release

echo.
echo "-------------------Project Build Finish-------------------"
echo.

pause