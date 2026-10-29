@echo off
yt-dlp --yes-playlist -o "%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" "%~1"
