REM 请保证手机调试模式连接电脑后点击执行bat
adb push ./build/arm64-v8a/my_program /data/local/tmp
adb shell

REM 进入shell后输入以下代码
REM cd /data/local/tmp
REM chmod 777 ./my_program
REM ./my_program