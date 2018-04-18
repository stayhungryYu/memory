@echo off 
set work_path=D:\hprof-99U

D: 
cd %work_path% 
for /R %%s in (.,*) do ( 
echo %%s 
hprof-conv -z %%s %%s-2.hprof
) 
pause 