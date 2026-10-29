# YouTube Toolkit for Windows 🚀

A lightweight, zero-bloat command-line toolkit that sets up **yt-dlp** and **FFmpeg** on any Windows machine in under 60 seconds. **No Python installation required.**

---

## ⚡ Quick Start (1-Click Setup)

1. Download or clone this repository.
2. Right-click **`setup.bat`** and select **"Run as administrator"**.
3. Open a fresh Command Prompt or PowerShell and start downloading!

---

## ✨ Features

- **Zero Python Bloat:** Uses standalone pre-compiled binaries via Windows Package Manager.
- **Smart Drive Detection:** Automatically saves to `E:\DOWNLOAD` if an `E:\` drive exists; otherwise saves to `Downloads\YouTube`.
- **Automatic MP4 Output:** Automatically remuxes high-res VP9/AV1 streams into standard `.mp4` files using FFmpeg (no more `.webm` files).
- **Fast 1-Word Shortcuts:** Short, memorable commands for daily use.
- **Clean Playlist Sorting:** Downloads full playlists into organized, sequentially numbered subfolders.

---

## 🚀 Commands

| Command | Usage | Description |
| :--- | :--- | :--- |
| **`dl`** | `dl "URL"` | Download maximum quality video as `.mp4` (up to 4K) |
| **`dl1080`** | `dl1080 "URL"` | Download 1080p video as `.mp4` |
| **`dlaudio`** | `dlaudio "URL"` | Extract highest quality `.mp3` audio |
| **`dllist`** | `dllist "URL"` | Download full playlist into an organized folder |
| **`update`** | `update` | Update yt-dlp to the latest version |

---

## 📂 Repository Structure

```text
youtube-toolkit/
├── setup.bat          # 1-Click automated installer
├── README.md          # Documentation & command guide
├── LICENSE            # MIT License
├── .gitignore         # Git ignore rules
├── config/
│   └── yt-dlp.conf    # Global configuration
└── shortcuts/         # Individual batch shortcut files
    ├── dl.bat
    ├── dl1080.bat
    ├── dlaudio.bat
    ├── dllist.bat
    └── update.bat
```
