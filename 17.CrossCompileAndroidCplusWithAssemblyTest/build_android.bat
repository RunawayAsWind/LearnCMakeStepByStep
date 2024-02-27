@REM abi=armeabi armeabi-v7a arm64-v8a mips mips64 x86 x86_64
set abi=arm64-v8a
set ANDROID_SDK_HOME=C:/Users/jchan/AppData/Local/Android/Sdk
set ANDROID_NDK_HOME=%ANDROID_SDK_HOME%/ndk/21.4.7075529
set ANDROID_SDK_CMAKE=%ANDROID_SDK_HOME%/cmake/3.10.2.4988404
set ANDROID_NATIVE_API_LEVEL=19
set ANDROID_PLATFORM=android-29
set BUILD_TYPE=Release
set GENERATOR="Ninja"

if not exist build md build
cd build

@REM build armeabi-v7a
if not exist %abi% md %abi%
cd %abi%

%ANDROID_SDK_CMAKE%/bin/cmake ^
  -DANDROID_ABI=%abi% ^
  -DANDROID_NDK=%ANDROID_NDK_HOME% ^
  -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
  -DCMAKE_TOOLCHAIN_FILE=%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake ^
  -DANDROID_PLATFORM=%ANDROID_PLATFORM% ^
  -DANDROID_NATIVE_API_LEVEL=%ANDROID_NATIVE_API_LEVEL% ^
  -DANDROID_TOOLCHAIN=clang ^
  -DCMAKE_GENERATOR=%GENERATOR% ^
  -DCMAKE_MAKE_PROGRAM=%ANDROID_SDK_CMAKE%/bin/ninja ^
  ../../

%ANDROID_SDK_CMAKE%/bin/ninja

cd ../../

pause
