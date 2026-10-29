# YouTube Toolkit for Windows

Download videos, playlists, or audio using simple commands in Windows. This toolkit uses **yt-dlp** and **FFmpeg** and creates shortcuts so you do not need to remember long commands.

> Use this tool only for content you have permission to download. Follow the platform's terms and applicable laws.

## 1. Install

1. **[Download the project ZIP](https://github.com/rajvisual/youtube-toolkit/archive/refs/heads/main.zip).**
2. Extract the ZIP file.
3. Open the extracted folder.
4. Right-click `setup.bat` and choose **Run as administrator**.
5. Approve the Windows permission prompt, then wait for setup to finish.
6. Close and reopen Command Prompt.

The installer uses **WinGet** to install yt-dlp and FFmpeg. If WinGet is missing or the installation fails, see [Troubleshooting](#troubleshooting).

## 2. Download something

Open **Command Prompt** and enter one of these commands. Replace the example URL with the link you want to use.

| What you want | Command |
|---|---|
| Best available video quality | `dl "VIDEO_URL"` |
| Video up to 1080p | `dl1080 "VIDEO_URL"` |
| Audio as MP3 | `dlaudio "VIDEO_URL"` |
| A full playlist | `dllist "PLAYLIST_URL"` |

**Example**

```bat
dl "https://www.youtube.com/watch?v=VIDEO_ID"
```

Keep the quotation marks around the URL. The actual quality available depends on the source video.

## 3. Where are my downloads?

The installer chooses a default folder:

- If your PC has an **E: drive**, downloads go to `E:\\DOWNLOAD`.
- Otherwise, downloads go to `Downloads\\YouTube` inside your Windows user folder.

To change the download folder, run:

```bat
setfolder "D:\\Videos"
```

Replace `D:\\Videos` with the folder you want. The folder is created if it does not already exist.

## 4. Useful commands

| Command | What it does |
|---|---|
| `dl` | Downloads the best available video and audio streams and remuxes the result to MP4 when possible. |
| `dl1080` | Downloads at up to 1080p when that quality is available. |
| `dlaudio` | Extracts audio as an MP3 file. |
| `dllist` | Downloads a playlist into a folder named after the playlist. |
| `setfolder` | Changes the default download location. |
| `update` | Updates yt-dlp. |

## 5. Troubleshooting

**'dl' or another command is not recognized**
- Close Command Prompt and open it again after installation.
- Check that `C:\\Tools` exists and is included in your user PATH.

**WinGet is not recognized**
- Update or install **App Installer** from Microsoft Store, then reopen Command Prompt and run `setup.bat` again.

**A download fails**
- Update yt-dlp by running `update`.
- Check that the link works in your browser and try again.
- Some videos may require sign-in or may not be accessible to yt-dlp.

**The video is not MP4**
- The toolkit asks yt-dlp to remux the download to MP4. Some formats or codecs may not be compatible with MP4, so the final result can depend on the source.

## 6. Project files

- `setup.bat` — installs the required tools and creates the command shortcuts.
- `shortcuts/` — contains the shortcut command files.
- `config/yt-dlp.conf` — contains example yt-dlp settings.

## License

This project is released under the [MIT License](LICENSE).

## Project

Created by [Raj Visual](https://github.com/rajvisual).

- **Repository:** https://github.com/rajvisual/youtube-toolkit
- **Download ZIP:** https://github.com/rajvisual/youtube-toolkit/archive/refs/heads/main.zip
