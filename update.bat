@echo off
:repeat
title �豸������������
echo   * ע������
echo      ȷ��adb�����Ѱ�װ�������豸�Ѿ����ӵ��ԣ���ⷽ����
echo      adb version ��ʾ�汾��Ϊ����
echo      adb devices ��ʾ���豸�б�����
echo.
echo   ----------------------------------------
echo   ��������������Ķ�����ţ�
echo   ----------------------------------------
echo.
echo   1.����luncher
echo.
echo   2.���±�����Դ
echo.
echo   3.���õ�ƽ��licence
echo.
echo   4.�����豸ID
echo.
echo   5.����device���豸��������
echo.
echo   6.��־��ӡ����
echo.
echo   7.���ͬ������
echo.
echo   8.�����豸
echo.
echo   9.�˳�
echo.
adb remount
choice /c 123456789 /m "    ��ѡ��"
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
set /p src=������luncher apk·����
adb install -r %src%
cls
goto repeat

:devupdate
set /p src=������device apk·����
adb install -r %src%
goto repeat

:liceces
set /p src=�������ƽ��lincense·����
adb push %src% /sdcard/hrsc
cls
goto repeat

:id
set /p src=�������豸ID·����
adb shell mkdir -p /sdcard/qmorn/config
adb push %src% /sdcard/qmorn/config
goto repeat

:gif
set /p src=�����������Դ·����
adb push %src%\. /sdcard/qmorn/gif
goto repeat

:book
choice /c YN /m "    �汾���ͬ����"
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
choice /c YN /m "    Logcat�����־��"
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
