@echo off
setlocal enabledelayedexpansion
title YouTube Toolkit 1-Click Installer
echo ===================================================
echo   Universal YouTube Downloader & FFmpeg Setup
echo ===================================================
echo.

:: 1. Check for Admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] Requesting administrative privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"%~f0\"' -Verb RunAs"
    exit /b
)

:: 2. Install yt-dlp and ffmpeg via winget
echo [+] Installing yt-dlp and FFmpeg via Windows Package Manager...
winget install yt-dlp.yt-dlp Gyan.FFmpeg --accept-source-agreements --accept-package-agreements

:: 3. Configure Download Directory (E:\DOWNLOAD if available, otherwise Downloads\YouTube)
set "TARGET_DIR=%USERPROFILE%\Downloads\YouTube"
if exist "E:\" (
    set "TARGET_DIR=E:\DOWNLOAD"
)
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"
echo [+] Download directory set to: %TARGET_DIR%

:: 4. Configure global yt-dlp settings
if not exist "%APPDATA%\yt-dlp" mkdir "%APPDATA%\yt-dlp"
(
echo -o "%TARGET_DIR%/%%(title)s.%%(ext)s"
echo --windows-filenames
echo --no-mtime
echo --remux-video mp4
) > "%APPDATA%\yt-dlp\config.txt"
echo [+] Global settings configured (Forces MP4 format).

:: 5. Create Tools directory and deploy shortcut commands
set "TOOLS_DIR=C:\Tools"
if not exist "%TOOLS_DIR%" mkdir "%TOOLS_DIR%"

(
echo @echo off
echo yt-dlp -f "bv*+ba/b" --remux-video mp4 "%%~1"
) > "%TOOLS_DIR%\dl.bat"

(
echo @echo off
echo yt-dlp -f "bv*[height<=1080]+ba/b" --remux-video mp4 "%%~1"
) > "%TOOLS_DIR%\dl1080.bat"

(
echo @echo off
echo yt-dlp -x --audio-format mp3 --audio-quality 0 "%%~1"
) > "%TOOLS_DIR%\dlaudio.bat"

(
echo @echo off
echo yt-dlp --yes-playlist -o "%TARGET_DIR%/%%(playlist_title)s/%%(playlist_index)s - %%(title)s.%%(ext)s" "%%~1"
) > "%TOOLS_DIR%\dllist.bat"

(
echo @echo off
echo if "%%~1"=="" (
echo     echo [!] Please specify a folder path. Example: setfolder "D:\Videos"
echo     exit /b
echo )
echo if not exist "%%~1" mkdir "%%~1"
echo ^(
echo echo -o "%%~1/%%%%(title)s.%%%%(ext)s"
echo echo --windows-filenames
echo echo --no-mtime
echo echo --remux-video mp4
echo ^) ^> "%%APPDATA%%\yt-dlp\config.txt"
echo [✓] Success! Download folder changed to: %%~1
) > "%TOOLS_DIR%\setfolder.bat"

(
echo @echo off
echo yt-dlp -U
) > "%TOOLS_DIR%\update.bat"

echo [+] Shortcut commands created in %TOOLS_DIR%

:: 6. Add C:\Tools to User PATH if not already present
powershell -Command "$userPath = [Environment]::GetEnvironmentVariable('Path', 'User'); if ($userPath -notlike '*C:\Tools*') { [Environment]::SetEnvironmentVariable('Path', $userPath + ';C:\Tools', 'User') }"
echo [+] Windows PATH updated successfully.

echo.
echo ===================================================
echo   Setup Complete!
echo   Downloads will save to: %TARGET_DIR%
echo   Restart CMD to use: dl, dl1080, dlaudio, dllist, setfolder, update
echo ===================================================
pause
