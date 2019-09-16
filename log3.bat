@echo off
:repeat
title 绘本拷贝辅助程序
echo.
echo   ----------------------------------------
echo   请输入你想操作的动作序号：
echo   ----------------------------------------
echo.
echo   1.批量导入绘本
echo.
echo   2.删除设备所有绘本
echo.
echo   3.查看设备已有绘本
echo.
echo   4.重启设备
echo.
echo   5.退出
echo.
choice /c 12345 /m "    请选择："
if %errorlevel%==5 exit
if %errorlevel%==4 goto dereboot
if %errorlevel%==3 goto checkbooks
if %errorlevel%==2 goto deleteall
if %errorlevel%==1 goto import

:import
set /p src=请输入源目录：
adb remount
adb shell mkdir -p /sdcard/qmorn/books
adb push %src%\. /sdcard/qmorn/books
goto checkbooks
:deleteall
adb shell rm -rf /sdcard/qmorn/books/
adb shell ls /sdcard/qmorn
:checkbooks
adb shell ls /sdcard/qmorn/books
goto repeat
:deletesome
echo 未实现
:dereboot
adb reboot

pause
cls
goto repeat
