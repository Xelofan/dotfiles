#!/bin/bash

if command -v eza >/dev/null 2>&1; then
	alias ls='eza -hg'
else
	alias ls='ls -F'
fi

alias	\
        la='ls -la' \
        l='la' \
        ll='ls -l' \
        lss='/bin/ls' \
        dnf='sudo dnf' \
	apt='sudo apt' \
 	apt-get='sudo apt-get' \
  	zypper='sudo zypper' \
        neofetch='neofetch --cpu_speed on' \
        cp='cp -v' \
	mv='mv -v' \
 	rm='rm -v' \
        systemctl='sudo systemctl' \
        docker-compose='docker compose' \
        db='distrobox' \
        k='kubectl' \
        ts='tailscale' \
        tss='ts ssh' \
        dotfiles_update='curl -L https://dot.xelobat.hu | sh'

## YT-DLP + OTHER MEDIA STUFF ##
alias   \
        ytdlmp4='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
	ytdlmp4s='screen yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
        ytdlmp3='yt-dlp -f bestaudio -x --audio-format "mp3" -o "%(title)s.%(ext)s" -i $1' \
        ytdlmp3s='screen yt-dlp -f bestaudio -x --audio-format "mp3" -o "%(title)s.%(ext)s" -i $1' \
        ytdlflac='yt-dlp -f bestaudio -x --audio-format "flac" -o "%(title)s.%(ext)s" -i $1' \
	ytdlmp4o='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" -o "%(title)s.%(ext)s" $1' \
	ffmpegcut='echo ffmpeg -i INPUT_FILE -ss FROM -to TO -c copy OUTPUT_FILE'






dockerctx() {
  local ctx="${1:-}"

  if [[ -z "$ctx" ]]; then
    ctx=$(
      docker context ls |
        fzf --header-lines=1 --prompt='Docker context > ' |
        awk '{print $1}'
    ) || return
  fi

  [[ -n "$ctx" ]] && docker context use "$ctx"
}

_dockerctx_widget() {
  if [[ "$BUFFER" == "dockerctx " ]]; then
    local ctx

    ctx=$(
      docker context ls |
        fzf --header-lines=1 --prompt='Docker context > ' |
        awk '{print $1}'
    ) || return 0

    if [[ -n "$ctx" ]]; then
      zle -I
      docker context use "$ctx"

      BUFFER=""
      CURSOR=0
      zle reset-prompt
    fi
  else
    zle expand-or-complete
  fi
}

zle -N _dockerctx_widget
bindkey '^I' _dockerctx_widget
