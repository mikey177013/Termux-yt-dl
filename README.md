
# 🎬 YouTube Downloader Pro - Termux

A powerful and feature-rich YouTube video downloader for Termux (Android) with beautiful UI and multiple download options.

[![Made with ❤️ by Phoenix](https://img.shields.io/badge/Made%20with%20❤️%20by-%20Phoenix-red)](https://github.com/mikey177013)

<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfMSwcXISpSqJlesWPK7CEu9iQplhBHTJLEfMiBtNSrsWZmhczr7x-RE8z&s=10" width="80%">

![Termux](https://img.shields.io/badge/Termux-000000?style=for-the-badge&logo=termux&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![YouTube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)

## ✨ Features

- 🎵 **Audio Extraction** - Download MP3 audio only
- 📹 **Multiple Resolutions** - 144p to 4K video quality
- 🎨 **Beautiful Interface** - Colorful terminal UI with progress indicators
- 🔗 **Two Download Methods** - Share from YouTube app or use command line
- 📁 **Organized Downloads** - Automatic file organization with metadata
- 🖼️ **Thumbnail Support** - Download and embed thumbnails
- ⚡ **Fast & Efficient** - Uses modern yt-dlp for best performance
- 🔄 **Resume Support** - Continue interrupted downloads

## 🚀 Installation

### Prerequisites
- Termux app installed
- Internet connection
- Storage permission

### Quick Install
```bash
# Update packages
pkg update && pkg upgrade

# Setup storage
termux-setup-storage

# Install git and clone repository
pkg install git
git clone https://github.com/yourusername/Youtube-Downloader-Pro
cd Youtube-Downloader-Pro

# Run installation
chmod +x install.sh
bash install.sh
```

## 📖 Usage

### Method 1: Share from YouTube App (Recommended)
1. Open YouTube app
2. Find video you want to download
3. Tap **Share** → **Termux**
4. Select quality from menu
5. Wait for download to complete

### Method 2: Command Line
```bash
# Basic usage
dl https://www.youtube.com/watch?v=YOUR_VIDEO_ID

# Examples
dl https://youtu.be/dQw4w9WgXcQ
dl https://www.youtube.com/watch?v=abc123def456
```

### Quality Options
When you start a download, choose from:
- 🎵 **1** - MP3 Audio (Best Quality)
- 📱 **2** - Video 144p (Mobile Minimal)
- 📱 **3** - Video 240p (Mobile Basic)
- 📺 **4** - Video 360p (Standard)
- 📺 **5** - Video 480p (Good Quality)
- 🖥️  **6** - Video 720p (HD)
- 🖥️  **7** - Video 1080p (Full HD)
- 🎬 **8** - Video 1440p (2K)
- 🎬 **9** - Video 2160p (4K)
- 🎵 **10** - Best Audio + Video (Merge)
- 📺 **11** - Best Available Quality (Auto)

## 📁 File Structure

```
YouTube-Downloader-Pro/
├── install.sh          # Installation script
├── termux-url-opener   # URL handler for Termux
└── README.md          # This file

After installation:
~/bin/
├── dl                 # Command line downloader
└── termux-url-opener  # URL handler

Downloads are saved to:
/storage/shared/YouTube-Downloads/
```

## 🛠️ Troubleshooting

### Common Issues & Solutions

**❌ "dl command not found"**
```bash
source ~/.bashrc
# or restart Termux
```

**❌ "Download failed"**
```bash
# Update yt-dlp
pip install -U yt-dlp

# Check internet connection
ping youtube.com

# Verify storage permissions
termux-setup-storage
```

**❌ "No such file or directory"**
```bash
# Re-run installation
bash install.sh
```

**❌ Age-restricted videos**
```bash
# Use browser cookies (if you're logged in)
yt-dlp --cookies-from-browser firefox "URL"
```

### Manual Update
```bash
cd Youtube-Downloader-Pro
git pull
bash install.sh
```

## 🔧 Advanced Usage

### Download Playlist
```bash
# Download entire playlist
yt-dlp -o "~/storage/shared/YouTube-Downloads/%(playlist_title)s/%(title)s.%(ext)s" "PLAYLIST_URL"
```

### Custom Format Selection
```bash
# Download specific format
yt-dlp -f "bestvideo[height<=720]+bestaudio" "URL"

# See available formats first
yt-dlp -F "URL"
```

### Batch Download
```bash
# Create file with URLs (urls.txt)
echo "https://youtube.com/watch?v=VID1" >> urls.txt
echo "https://youtube.com/watch?v=VID2" >> urls.txt

# Download all
dl $(cat urls.txt)
```

## ⚠️ Legal Disclaimer

This tool is intended for:
- Downloading your own content
- Content with explicit download permission
- Fair use purposes where allowed by law

Please respect:
- YouTube's Terms of Service
- Copyright laws
- Content creator rights

The developers are not responsible for misuse of this tool.

## 🐛 Reporting Issues

If you encounter any problems:

1. Check the [Troubleshooting](#troubleshooting) section
2. Ensure you have the latest version
3. Run with debug info:
   ```bash
   yt-dlp --verbose "URL"
   ```
4. Create an issue with:
   - Error message
   - Video URL (if possible)
   - Termux version
   - Steps to reproduce

## 📄 License

This project is for educational purposes. Please use responsibly.

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest features
- Submit pull requests
- Improve documentation

## 🎯 Pro Tips

1. **Use Wi-Fi** for large downloads to save mobile data
2. **Check available space** before downloading 4K videos
3. **Use option 11** (Best Available) for fastest downloads
4. **MP3 option** is perfect for music and podcasts
5. **720p** offers the best balance of quality and file size

---

**⭐ Star this repo if you find it useful!**

**📞 Support:** Create an issue for help with installation or bugs

**🔄 Update regularly:** YouTube frequently changes their API
```

## Additional Files You Might Want:

### `.gitignore`
```
# Downloaded files
/storage/
*.mp4
*.mp3
*.mkv
*.webm

# System files
.DS_Store
Thumbs.db

## 📝 Attribution

This project is an enhanced and updated version of the original [YoutubeVideoHack](https://github.com/mishakorzik/YoutubeVideoHack) by [mishakorzik](https://github.com/mishakorzik).

### Major Improvements in This Version:
- ✅ **Modern yt-dlp** - Replaces outdated youtube-dl for better compatibility
- ✅ **Enhanced UI/UX** - Beautiful colors, progress indicators, and better formatting
- ✅ **Extended Quality Options** - Support for up to 4K resolution (2160p)
- ✅ **Command-Line Interface** - Added `dl` command for direct usage
- ✅ **Improved Error Handling** - Better troubleshooting and user feedback
- ✅ **Advanced Features** - Thumbnail embedding, metadata support, resume capability
- ✅ **Updated Dependencies** - Current package versions and better installation process
- ✅ **Professional Documentation** - Comprehensive README and troubleshooting guide

**All original concepts and base functionality credit goes to the original author.** This version maintains the core purpose while adding significant improvements for better user experience and reliability.