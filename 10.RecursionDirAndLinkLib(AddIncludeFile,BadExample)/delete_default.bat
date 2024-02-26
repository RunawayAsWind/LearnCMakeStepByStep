::Turns off the command echoing feature.Use UTF-8 code page to avoid chinese garbled、clear cmd
::code-page     https://docs.microsoft.com/en-us/windows/win32/intl/code-page-identifiers
@echo off
chcp 65001
CLS

::Delete directory
if exist ".\build\default" (
	rmdir /s/q ".\build\default"
)

echo.
echo "-------------------Project Delete Finish-------------------"
echo.

pause