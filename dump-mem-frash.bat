set  T=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%
set PKG=com.nd.app.factory.imapp0
set FILE_NAME=%PKG%-%T%.hprof
set FILE_PC=D:\hprof
echo %FILE_PC%
set FILE_PHONE=/data/local/tmp/hprof/%FILE_NAME%
echo %FILE_PHONE%

echo "cause GC for %PKG%"
adb shell "pkill -l 10  %PKG%"
pause
adb shell "am dumpheap  %PKG%  %FILE_PHONE%"
pause
adb wait-for-devices
adb devices
adb pull %FILE_PHONE%  %FILE_PC%
hprof-conv -z %FILE_PC%\%FILE_NAME% %FILE_PC%\%FILE_NAME%-2.hprof
::adb shell "rm %FILE_PHONE%"
pause
