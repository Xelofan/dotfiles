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
        neofetch='neofetch --cpu_speed on' \
        cp='cp -v' \
        systemctl='sudo systemctl' \
        docker-compose='docker compose' \
        k='sudo kubectl'

## YT-DLP + OTHER MEDIA STUFF ##
alias   \
        ytdlmp4='screen yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
        ytdlmp3='screen yt-dlp -f bestaudio -x --audio-format "mp3" -o "%(title)s.%(ext)s" -i $1' \
	ytdlmp4n='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
        ytdlmp3n='yt-dlp -f bestaudio -x --audio-format "mp3" -o "%(title)s.%(ext)s" -i $1' \
	ytdlmp4o='screen youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
	ytdlmp4on='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
	ffmpegcut='echo ffmpeg -i INPUT_FILE -ss FROM -to TO -c copy OUTPUT_FILE'

## SSH Sessions ##
alias	\
	arm='ssh daniel@arm.nazx.ch -i ~/.ssh/SSH/arm' \
        ims='ssh daniel@imswat.com -p 9661 -i ~/.ssh/SSH/imswat' \
          imswat='ims' \
     	net='ssh daniel@192.168.0.3 -i ~/.ssh/SSH/cloud' \
     	wg='ssh daniel@192.168.0.4 -i ~/.ssh/SSH/cloud' \
	s='ssh daniel@192.168.0.10 -i ~/.ssh/SSH/cloud'
