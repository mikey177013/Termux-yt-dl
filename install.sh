#!/bin/bash
# Color codes
g="\033[1;32m"
r="\033[1;31m"
b="\033[1;34m"
w="\033[0m"
o="\033[1;33m"
p="\033[1;35m"
c="\033[1;36m"

# Banner
echo -e "$c"
echo '╔══════════════════════════════════════╗'
echo '║    YouTube Downloader Installer     ║'
echo '║           Termux Edition            ║'
echo '╚══════════════════════════════════════╝'
echo -e "$w"

# Function to print status
print_status() {
    echo -e "$w[$g+$w]$b $1$w"
}

print_error() {
    echo -e "$w[$r!$w]$r $1$w"
}

print_warning() {
    echo -e "$w[$o*$w]$o $1$w"
}

# Update packages
print_status "Updating packages..."
pkg update -y && pkg upgrade -y

# Install termux-storage
print_status "Setting up storage permissions..."
termux-setup-storage

# Install dependencies
print_status "Installing Python..."
pkg install python -y

print_status "Installing Ruby and Lolcat..."
pkg install ruby -y
gem install lolcat

print_status "Installing Figlet..."
pkg install figlet -y

print_status "Installing yt-dlp (modern YouTube downloader)..."
pip install yt-dlp

print_status "Installing ffmpeg for audio conversion..."
pkg install ffmpeg -y

# Create directories
print_status "Creating directories..."
mkdir -p ~/storage/shared/YouTube-Downloads
mkdir -p ~/.config/yt-dlp
mkdir -p ~/bin

# Make termux-url-opener executable
print_status "Setting up URL opener..."
if [ -f "termux-url-opener" ]; then
    cp termux-url-opener ~/bin/
    chmod +x ~/bin/termux-url-opener
else
    print_error "termux-url-opener file not found!"
    exit 1
fi

# Create dl command for direct downloading
print_status "Creating dl command..."
cat > ~/bin/dl << 'EOF'
#!/bin/bash

# Color codes
g="\033[1;32m"
r="\033[1;31m"
b="\033[1;34m"
w="\033[0m"
o="\033[1;33m"

if [ -z "$1" ]; then
    echo -e "$rUsage: dl <youtube-url>$w"
    echo -e "$bExample: dl https://youtube.com/watch?v=xxx$w"
    exit 1
fi

echo -e "$w[$g▶$w]$b Starting download...$w"
~/bin/termux-url-opener "$1"
EOF

chmod +x ~/bin/dl

# Add ~/bin to PATH if not already there
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
fi

# Create config file for yt-dlp
print_status "Creating configuration..."
cat > ~/.config/yt-dlp/config << EOF
# Output template
-o /data/data/com.termux/files/home/storage/shared/YouTube-Downloads/%(title)s.%(ext)s

# Continue partially downloaded files
--continue

# No overwrite files
--no-overwrites

# Write metadata to file
--write-info-json
--write-thumbnail

# Convert thumbnails to jpg
--convert-thumbnails jpg

# Embed thumbnail in audio files
--embed-thumbnail

# Add metadata to files
--add-metadata
EOF

clear
echo -e "\n"
figlet -f small "Installation Complete!" | lolcat -p 1.5
echo -e "$g"
echo "╔═════════════════════════════════════════════╗"
echo "║                 Usage Guide                ║"
echo "╠═════════════════════════════════════════════╣"
echo "║  • Share YouTube link with Termux          ║"
echo "║  • Select quality from menu                ║"
echo "║  • Downloads saved to YouTube-Downloads/   ║"
echo "║  • Supports both video & audio             ║"
echo "║  • Use: dl <youtube-link>                  ║"
echo "╚═════════════════════════════════════════════╝"
echo -e "$w"
echo -e "$b📁 Download location: $g/storage/shared/YouTube-Downloads/$w"
echo -e "$b🎵 Supported: $gMP3, 144p-4K videos, playlists$w"
echo -e "$b🔗 Direct command: $gdl <youtube-link>$w"
echo -e "$o⚠️  Note: Always respect copyright laws!$w"
echo -e "\n"
echo -e "$g✅ Installation completed successfully!$w"
echo -e "$b🎯 Now you can use:$w"
echo -e "$g  1. Share YouTube links with Termux$w"
echo -e "$g  2. Or use: dl https://youtube.com/...$w"