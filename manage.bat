REM DJANGO MENU FOR WINDOWS
REM VERSION 1.0

REM CLEANING OUTPUT
@echo off
ECHO OFF

REM SAVING UNISON PATH
SET UNISONPATH=...

REM SAVING UNISON PROFILE
SET UNISON=%UNISONPATH%\profiles

REM SAVING UNISON
SET PROGUNISON=...

REM SAVING PYTHON PATH
SET PYTHONPATH=...

REM SAVING PATH
SET PATH=%UNISONPATH%;%PYTHONPATH%;%PYTHONPATH%\Scripts;%PATH%

REM SAVING PATH 1 FOR UNISON
SET LOCAL=...

REM SAVING PATH 2 FOR UNISON
SET SERVER=...

REM SHOWING MENU

:MENU
CLS
ECHO ###### DJANGO MENU #######
ECHO # 1. RUNSERVER           #
ECHO # 2. SHELL               #
ECHO # 3. CREATE SUPER USER   #
ECHO ########### DB ###########
ECHO # 4. MAKE MIGRATIONS     #
ECHO # 5. MIGRATE             #
ECHO ##########################
ECHO # 6. DOC                 #
ECHO ##########################
ECHO # 7. UNISON              #
ECHO ##########################
ECHO # 8. COLLECT STATIC      #
ECHO ##########################
ECHO # 9. EXIT                #
ECHO ##########################
choice /C 123456789 /M "SELECT AN OPTION:"

IF %ERRORLEVEL% EQU 1 GOTO OPT1
IF %ERRORLEVEL% EQU 2 GOTO OPT2
IF %ERRORLEVEL% EQU 3 GOTO OPT3
IF %ERRORLEVEL% EQU 4 GOTO OPT4
IF %ERRORLEVEL% EQU 5 GOTO OPT5
IF %ERRORLEVEL% EQU 6 GOTO OPT6
IF %ERRORLEVEL% EQU 7 GOTO OPT7
IF %ERRORLEVEL% EQU 8 GOTO OPT8
IF %ERRORLEVEL% EQU 9 GOTO OPT9

:OPT1
START %PYTHONPATH%\python.exe manage.py runserver
PAUSE
GOTO MENU

:OPT2
START %PYTHONPATH%\python.exe manage.py shell
PAUSE
GOTO MENU

:OPT3
%PYTHONPATH%\python.exe manage.py createsuperuser
PAUSE
GOTO MENU

:OPT4
%PYTHONPATH%\python.exe manage.py makemigrations
PAUSE
GOTO MENU

:OPT5
%PYTHONPATH%\python.exe manage.py migrate
REM %PYTHONPATH%\python.exe manage.py migrate --fake mb 0001
PAUSE
GOTO MENU

:OPT6
cd docs
CALL doc.bat
cd ..
PAUSE
GOTO MENU

:OPT7
REM SAVING OLD DIR
SET OLDDIR=%CD%
REM CHANGING DIRECTORY
cd /D "%UNISONPATH%"
%PROGUNISON% "%LOCAL%" "%SERVER%" -auto
REM RESTORING DIRECTORY
cd /D "%OLDDIR%"
PAUSE
GOTO MENU

:OPT8
%PYTHONPATH%\python.exe manage.py collectstatic --noinput
PAUSE
GOTO MENU

:OPT9
EXIT