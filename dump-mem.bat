set  T=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%%time:~9,2%
set PKG=com.nd.app.factory.imapp0
set FILE_PC=%PKG%-%T%.hprof
echo %FILE_PC%
set FILE_PHONE=/data/local/tmp/hprof/%FILE_PC%
echo %FILE_PHONE%


echo "cause GC for %PKG%"
adb shell "pkill -l 10 %PKG%"
adb shell "am dumpheap %PKG% %FILE_PHONE%"
pause