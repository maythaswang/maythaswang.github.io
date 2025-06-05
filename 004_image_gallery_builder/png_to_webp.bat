@echo off
REM Usage: png-to-webp.bat "C:\path\to\folder"

if "%~1"=="" (
    echo Please provide a directory path.
    echo Usage: %~nx0 "C:\path\to\folder"
    pause
    exit /b 1
)

set input_dir=%~1

if not exist "%input_dir%" (
    echo Directory "%input_dir%" does not exist.
    pause
    exit /b 1
)

REM Remove trailing backslash if present
if "%input_dir:~-1%"=="\" set input_dir=%input_dir:~0,-1%

REM Create output directory named input_dir_webp
set output_dir=%input_dir%_webp

if not exist "%output_dir%" (
    mkdir "%output_dir%"
    echo Created output directory "%output_dir%"
)

REM Loop through PNG files and convert
for %%f in ("%input_dir%\*.png") do (
    echo Converting "%%f" to "%output_dir%\%%~nf.webp"...
    cwebp -q 80 "%%f" -o "%output_dir%\%%~nf.webp"
)

echo All PNG files converted from "%input_dir%" to "%output_dir%"!
pause

