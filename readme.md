## Quick Installation
```
git clone https://github.com/Xelofan/dotfiles && \
    sudo apt install zsh -y && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    cp dotfiles/zshrc ~/.zshrc
```

## Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

##  ZSH Theme:
```
alanpeabody
```

##  ZSH Plugins:
```
git brew ansible timer zsh-autosuggestions zsh-syntax-highlighting
```

##  ZSH Autosuggestions:
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

##  ZSH Syntax Highlighting:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
