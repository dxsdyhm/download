@echo off
:repeat
title �汾������������
echo.
echo   ----------------------------------------
echo   ��������������Ķ�����ţ�
echo   ----------------------------------------
echo.
echo   1.��������汾
echo.
echo   2.ɾ���豸���л汾
echo.
echo   3.�鿴�豸���л汾
echo.
echo   4.�����豸
echo.
echo   5.�˳�
echo.
choice /c 12345 /m "    ��ѡ��"
if %errorlevel%==5 exit
if %errorlevel%==4 goto dereboot
if %errorlevel%==3 goto checkbooks
if %errorlevel%==2 goto deleteall
if %errorlevel%==1 goto import

:import
set /p src=������ԴĿ¼��
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
echo δʵ��
:dereboot
adb reboot

pause
cls
goto repeat
