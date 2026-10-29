# YouTube Toolkit for Windows 🚀

A simple Windows toolkit for downloading videos, audio, and playlists using **yt-dlp** and **FFmpeg**. Easy to install, lightweight, and no separate Python installation required.

## 📥 Download

**[⬇️ Download YouTube Toolkit (ZIP)](https://github.com/rajvisual/youtube-toolkit/archive/refs/heads/main.zip)**

### Quick installation

1. Click the download link above.
2. Extract the downloaded ZIP file.
3. Open the extracted `youtube-toolkit` folder.
4. Review `setup.bat`, then right-click it and select **Run as administrator**.
5. Follow the installation instructions.
6. Open a new Command Prompt and try one of the commands below.

> **Note:** The installer uses Windows Package Manager (WinGet). Availability depends on your Windows setup. Review the installer before running it.

## ✨ Features

- **Easy setup:** Installs yt-dlp and FFmpeg using WinGet.
- **No separate Python installation:** Uses Windows package-managed tools.
- **Smart download location:** Supports saving to `E:\DOWNLOAD` or a fallback Downloads folder, depending on the configuration.
- **Video downloads:** Download videos at the highest available quality or up to 1080p.
- **MP4 output:** Attempts to remux supported downloads into MP4 format.
- **Audio extraction:** Extract audio as MP3.
- **Playlist downloads:** Download playlists with organized filenames.
- **Quick commands:** Use short commands instead of typing long yt-dlp instructions.

## 🖥️ Available commands

Run these commands in Command Prompt or PowerShell after installation.

| Command | Example | Purpose |
|---|---|---|
| `dl` | `dl "VIDEO_URL"` | Download the highest available video quality |
| `dl1080` | `dl1080 "VIDEO_URL"` | Download video at up to 1080p |
| `dlaudio` | `dlaudio "VIDEO_URL"` | Extract audio as MP3 |
| `dllist` | `dllist "PLAYLIST_URL"` | Download a playlist |
| `update` | `update` | Update yt-dlp |

Replace `VIDEO_URL` or `PLAYLIST_URL` with the actual URL you want to download.

**Example:**

```bat
dl "https://www.youtube.com/watch?v=VIDEO_ID"
```

The commands and output formats depend on the settings in the included batch files and configuration.

## 📂 Project structure

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

## 🛠️ Requirements

- Windows
- Windows Package Manager (WinGet), if using the automatic installer
- An internet connection
- FFmpeg and yt-dlp, installed by the setup or already available on your system

## 🔧 Troubleshooting

- **Command not recognized:** Reopen Command Prompt or PowerShell after installation. Check that the shortcut files and installed tools are available through your PATH.
- **Download fails:** Check your internet connection and update yt-dlp using `update`.
- **MP4 conversion fails:** Verify that FFmpeg is installed and available.
- **Download folder is incorrect:** Review `config/yt-dlp.conf` and the `setfolder.bat` script.

## ⚖️ Responsible use

Use this toolkit only for content you have permission to download. Respect copyright, platform terms, and applicable laws.

## 📄 License

This project is distributed under the [MIT License](LICENSE).

## 👨‍💻 Author

Created by [Raj Visual](https://github.com/rajvisual).

**Repository:** [rajvisual/youtube-toolkit](https://github.com/rajvisual/youtube-toolkit)