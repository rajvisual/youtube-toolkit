@echo off
if "%~1"=="" (
    echo [!] Please specify a folder path.
    echo Example: setfolder "D:\Videos"
    exit /b
)

set "NEW_DIR=%~1"
if not exist "%NEW_DIR%" (
    mkdir "%NEW_DIR%"
    echo [+] Created folder: %NEW_DIR%
)

if not exist "%APPDATA%\yt-dlp" mkdir "%APPDATA%\yt-dlp"
(
echo -o "%NEW_DIR%/%%(title)s.%%(ext)s"
echo --windows-filenames
echo --no-mtime
echo --remux-video mp4
) > "%APPDATA%\yt-dlp\config.txt"

echo [✓] Success! Download folder changed to: %NEW_DIR%
