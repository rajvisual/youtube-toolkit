# YouTube Toolkit for Windows 🚀

A lightweight Windows toolkit for downloading videos, audio, and playlists with **yt-dlp** and **FFmpeg**. It uses Windows Package Manager (WinGet), so you do not need to install Python separately.

## 📥 Download

**[⬇️ Download YouTube Toolkit (ZIP)](https://github.com/rajvisual/youtube-toolkit/archive/refs/heads/main.zip)**

### Quick Start

1. Download the ZIP using the link above.
2. Extract the ZIP file.
3. Open the extracted `youtube-toolkit` folder.
4. Review `setup.bat` before running it.
5. Right-click `setup.bat` and select **Run as administrator**.
6. When setup finishes, open a **new** Command Prompt or PowerShell window.

The installer uses WinGet to install yt-dlp and FFmpeg, creates command shortcuts in `C:\Tools`, adds that folder to your user PATH, and configures a default download location. Administrator permission is requested by the installer.

## ✨ Features

- **No separate Python installation:** Installs yt-dlp and FFmpeg through WinGet.
- **Best available quality:** The `dl` command requests the best available video and audio streams. Actual resolution depends on the source video.
- **1080p option:** Use `dl1080` to cap the selected video stream at 1080p.
- **MP4 remuxing:** Attempts to remux supported downloads into MP4 using FFmpeg.
- **Smart default folder:** Uses `E:\DOWNLOAD` when the E: drive is available; otherwise uses your user Downloads folder under `YouTube`.
- **Playlist downloads:** Downloads playlist items into a playlist-named folder with playlist indices in filenames.
- **Change the download folder:** Use `setfolder` to change the configured destination.
- **Quick updates:** Use `update` to update yt-dlp.

> **Note:** MP4 remuxing changes the container when supported; it does not re-encode every video into a universally compatible codec. The available quality and formats depend on the source.

## 🖥️ Daily Commands

Run these commands in a new Command Prompt or PowerShell window after setup. Replace the example URL with the actual video or playlist URL.

| Command | Example | What it does |
|---|---|---|
| `dl` | `dl "VIDEO_URL"` | Downloads the best available video and audio streams |
| `dl1080` | `dl1080 "VIDEO_URL"` | Downloads at up to 1080p |
| `dlaudio` | `dlaudio "VIDEO_URL"` | Extracts audio as MP3 |
| `dllist` | `dllist "PLAYLIST_URL"` | Downloads a playlist into a playlist-named folder |
| `setfolder` | `setfolder "D:\Videos"` | Changes the default download folder |
| `update` | `update` | Updates yt-dlp |

### Example

```bat
dl "https://www.youtube.com/watch?v=VIDEO_ID"
```

### Check available formats

To list the formats available for a video, run:

```bat
yt-dlp -F "VIDEO_URL"
```

### Download to a different folder for one command

You can pass yt-dlp's `-P` option after the URL:

```bat
dl "VIDEO_URL" -P "C:\Users\YourName\Desktop"
```

## 📂 Repository Structure

```text
youtube-toolkit/
├── setup.bat
├── README.md
├── LICENSE
├── .gitignore
├── config/
│   └── yt-dlp.conf
└── shortcuts/
    ├── dl.bat
    ├── dl1080.bat
    ├── dlaudio.bat
    ├── dllist.bat
    ├── setfolder.bat
    └── update.bat
```

## 🛠️ Manual Installation (Alternative)

If you prefer to install the tools manually, open PowerShell and run:

```powershell
winget install yt-dlp.yt-dlp Gyan.FFmpeg --accept-source-agreements --accept-package-agreements
```

Then create the yt-dlp configuration directory and file:

```powershell
New-Item -ItemType Directory -Force -Path "$env:APPDATA\yt-dlp" | Out-Null
@'
-o "E:\DOWNLOAD/%(title)s.%(ext)s"
--windows-filenames
--no-mtime
--remux-video mp4
'@ | Set-Content -Path "$env:APPDATA\yt-dlp\config.txt" -Encoding UTF8
```

This example uses `E:\DOWNLOAD`. Change the output path if you want a different folder. The manual commands above install the tools and configure yt-dlp; they do not create the toolkit's `dl`, `dl1080`, and other shortcut commands.

## ❓ Troubleshooting

- **Command not recognized:** Open a new terminal after setup. Check that `C:\Tools` is present in your user PATH.
- **Download fails:** Check your internet connection and try updating yt-dlp with `update`.
- **MP4 remuxing fails:** Confirm that FFmpeg installed correctly and is available in PATH.
- **Downloads go to the wrong folder:** Run `setfolder "D:\Videos"` or review the yt-dlp configuration at `%APPDATA%\yt-dlp\config.txt`.

## ⚖️ Responsible Use

Download only content you have permission to download. Respect copyright, platform terms, and applicable laws.

## 📄 License

This project is released under the [MIT License](LICENSE).

## 👨‍💻 Author

Created by [Raj Visual](https://github.com/rajvisual).

**Repository:** [rajvisual/youtube-toolkit](https://github.com/rajvisual/youtube-toolkit)
