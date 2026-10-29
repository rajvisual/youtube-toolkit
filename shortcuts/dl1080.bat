@echo off
yt-dlp -f "bv*[height<=1080]+ba/b" --remux-video mp4 "%~1"
