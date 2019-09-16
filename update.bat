@echo off
:repeat
title 设备升级辅助程序
echo   * 注意事项
echo      确保adb环境已安装，并且设备已经连接电脑，检测方法：
echo      adb version 显示版本号为正常
echo      adb devices 显示有设备列表正常
echo.
echo   ----------------------------------------
echo   请输入你想操作的动作序号：
echo   ----------------------------------------
echo.
echo   1.升级luncher
echo.
echo   2.更新表情资源
echo.
echo   3.配置地平线licence
echo.
echo   4.配置设备ID
echo.
echo   5.升级device（设备会重启）
echo.
echo   6.日志打印开关
echo.
echo   7.书架同步开关
echo.
echo   8.重启设备
echo.
echo   9.退出
echo.
adb remount
choice /c 123456789 /m "    请选择："
if %errorlevel%==9 exit
if %errorlevel%==8 goto dereboot
if %errorlevel%==7 goto book
if %errorlevel%==6 goto log
if %errorlevel%==5 goto devupdate
if %errorlevel%==4 goto id
if %errorlevel%==3 goto liceces
if %errorlevel%==2 goto gif
if %errorlevel%==1 goto luncher

:luncher
set /p src=请输入luncher apk路径：
adb install -r %src%
cls
goto repeat

:devupdate
set /p src=请输入device apk路径：
adb install -r %src%
goto repeat

:liceces
set /p src=请输入地平线lincense路径：
adb push %src% /sdcard/hrsc
cls
goto repeat

:id
set /p src=请输入设备ID路径：
adb shell mkdir -p /sdcard/qmorn/config
adb push %src% /sdcard/qmorn/config
goto repeat

:gif
set /p src=请输入表情资源路径：
adb push %src%\. /sdcard/qmorn/gif
goto repeat

:book
choice /c YN /m "    绘本书架同步："
if %errorlevel%==2 goto addbook
if %errorlevel%==1 goto deletebook

:addbook
adb shell touch /sdcard/qmorn/book.txt
cls
goto repeat

:deletebook
adb shell rm /sdcard/qmorn/book.txt
cls
goto repeat

:log
choice /c YN /m "    Logcat输出日志："
if %errorlevel%==2 goto deletelog
if %errorlevel%==1 goto addlog

:addlog
adb shell touch /sdcard/qmorn/log.txt
cls
goto repeat

:deletelog
adb shell rm  /sdcard/qmorn/log.txt
cls
goto repeat

:dereboot
adb reboot
goto repeat
