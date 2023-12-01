#!/bin/bash

#if [ "$(uname)" != "Darwin" ]; then
#alias   \
#	codium="flatpak run com.vscodium.codium --no-sandbox "
#else
#fi

alias	\
        ls='exa -h' \
        la='ls -la' \
        l='la' \
        ll='ls -l' \
        lsa='l' \
        dnf='sudo dnf' \
	apt='sudo apt' \
 	apt-get='sudo apt-get' \
        neofetch='neofetch --cpu_speed on' \
        cp='cp -v' \
	mv='mv -v' \
 	rm='rm -v' \
        systemctl='sudo systemctl' \
        docker-compose='docker compose' \
        k='kubectl' \
        db='distrobox'

## YT-DLP + OTHER MEDIA STUFF ##
alias   \
        ytdlmp4='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
	ytdlmp4s='screen yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
        ytdlmp3='yt-dlp -f bestaudio -x --audio-format "mp3" -o "%(title)s.%(ext)s" -i $1' \
        ytdlmp3s='screen yt-dlp -f bestaudio -x --audio-format "mp3" -o "%(title)s.%(ext)s" -i $1' \
        ytdlflac='yt-dlp -f bestaudio -x --audio-format "flac" -o "%(title)s.%(ext)s" -i $1' \
	ytdlmp4o='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
	ffmpegcut='echo ffmpeg -i INPUT_FILE -ss FROM -to TO -c copy OUTPUT_FILE'

## SSH Sessions ##
alias	\
        ims='ssh daniel@imswat.com -p 9661 -i ~/.ssh/SSH/imswat' \
          imswat='ims' \
        mohaa='ssh daniel@mohaa.imswat.com -i ~/.ssh/SSH/mohaa-vps' \
     	net='ssh daniel@10.0.0.3 -i ~/.ssh/SSH/ubuntu-cloud' \
     	wg='ssh daniel@10.0.0.4 -i ~/.ssh/SSH/ubuntu-cloud' \
	doc='ssh daniel@10.0.0.10 -i ~/.ssh/SSH/ubuntu-cloud'
