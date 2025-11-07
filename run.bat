@echo off
setlocal enabledelayedexpansion

REM ======================================
REM  Configuration section (edit freely)
REM ======================================

REM Define your package folders here:
set FOLDERS=dictionary\model dictionary\controller

REM Name of your main class (no .java or package name)
set MAINCLASS=Dictionary

REM ======================================
echo Compiling Java files...
echo --------------------------------------

REM Clean old class files (optional)
for %%F in (%FOLDERS%) do (
    if exist "%%F\*.class" del /Q "%%F\*.class"
)

if exist "*.class" del /Q "*.class"

REM Compile all sources from listed folders
set FILES=
for %%F in (%FOLDERS%) do (
    for %%J in ("%%F\*.java") do (
        set FILES=!FILES! "%%~fJ"
    )
)

REM Add main file in the root directory
set FILES=!FILES! "%MAINCLASS%.java"

javac !FILES!

if errorlevel 1 (
    echo.
    echo Compilation failed. Check the errors above.
    pause
    exit /b 1
)

echo.
echo --------------------------------------
echo Running %MAINCLASS%...
echo --------------------------------------
echo.

java %MAINCLASS%

echo.
echo Program finished.
pause
