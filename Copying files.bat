@echo off
echo. 
echo.
echo.

color 06
echo  ---------------------------------------------------------
echo. \                                                       /
echo  \  *       *   ***    *   *     *     *         *       /
echo  \   *     *   ** **   *   *    * *    *        * *      /
echo  \    *   *   **   **  *****   *****   *       *****     /
echo  \     * *     ** **   *   *  *     *  *      *     *    /
echo  \      *       ***    *   * *       * ***** *       *   /
echo. \                                                       /
echo  ---------------------------------------------------------

echo. 
echo.
echo.
color 05
rem Set the source and destination directories
set source=D:\VBS\
set destination=D:\Vyaar\code

setlocal enabledelayedexpansion


set files_copied=0
set files_failed=0

echo. > failed_files.txt

echo Copying files from %source% to %destination%...

for /f "delims=" %%a in ('dir "%source%\*" /b /s') do (
    
    xcopy "%%a" "%destination%\" /E /C /R /Y
    
    if !errorlevel! == 0 (
        
        set /a files_copied+=1
    ) else (
        
        set /a files_failed+=1
        
        echo %%a >> failed_files.txt
    )
)

echo.
echo ________________________________________
echo Total files copied: %files_copied%
echo Total files failed: %files_failed%
echo ________________________________________

if %files_failed% GTR 0 (
    echo Failed files:
    type failed_files.txt
)

del failed_files.txt

endlocal

echo.
echo Press any key to exit...
pause >nul
