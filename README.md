___________________________________________________________

# Ubuntu packages

___________________________________________________________

# Installation

## Standard

	useradd alex
	usermod -aG sudo alex

	# git
	git config --global user.name "Alexandre HUBLAU"
	git config --global user.email "contact@alexandre-hublau.com"
	# git config --global branch.autosetuprebase always
	git config --global core.editor "vim"

	# ssh
	cp /mnt/c/Users/$USER/.ssh ~/.ssh/
	chmod 600 ~/.ssh/id_rsa

	# docker
	sudo apt instal docker.io docker-compose -y
	sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker

	# vim
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
	# imap jk <Esc>

	# zsh
	sudo apt install zsh -y
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# sudo vim /etc/passwd  <-- to change default shell, but perhaps `chsh` can do it too ! Actually OMZSH do it for you
	# Add gpg plugin, OR export "GPG_TTY=$(tty)"
	plugins=(git sudo tmux docker docker-compose gpg-agent)

	alias c='batcat'
	alias v='vim'

	alias a='git add .'
	alias s='git status'
	alias cm='git commit -m '
	alias pu='git pull'
	alias diff='git diff'
	alias gclean='git branch | grep -v "master" | xargs git branch -d; git fetch --prune'

	alias ..='cd ../'
	alias ...='cd ../../'
	alias ....='cd ../../../'
	alias .....='cd ../../../../'
	alias ......='cd ../../../../../'
	alias .......='cd ../../../../../../'
	alias rm="rm -i"

	alias dr='docker run --rm -ti'
	alias dka='docker kill $(docker ps -q)'
	alias drm='docker rmi $(docker images -f "dangling=true" -q) ; docker rm $(docker ps -a -q)'
	alias dri='docker rmi $(docker images -f "dangling=true" -q)'
	# alias dri='docker rmi $(docker images -q) --force'
	alias dra='docker system prune -af --volumes'
	alias dp='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

	alias dc='docker-compose'
	alias dcu='docker-compose up -d'
	alias dcd='docker-compose down'

	alias e="docker exec -ti"

	# alias m='docker run --rm -ti -v /tmp/m:/m_save_volume -w /m_save_volume -p 8000:8000 -p 19000-19020:19000-19020 alpine'

	alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

	export PNPM_HOME="/home/alex/.local/share/pnpm"
	export PATH="$PNPM_HOME:$PATH"
	export PATH="/home/alex/.local/bin:$PATH"

# ZSHRC

export LC_ALL=en_US.UTF-8

<!--
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/alex/.oh-my-zsh"

# Set name of the theme to load - if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# zsh-autosuggestions
plugins=(git sudo zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias r='df -h /'
-->

alias c='batcat'
alias v='vim'

alias a='git add .'
alias s='git status'
alias cm='git commit -m '
alias pu='git pull'
alias diff='git diff'
alias gclean='git branch | grep -v "master" | xargs git branch -d; git fetch --prune'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias rm="rm -i"

alias dr='docker run --rm -ti'
alias dka='docker kill $(docker ps -q)'
alias drm='docker rmi $(docker images -f "dangling=true" -q) ; docker rm $(docker ps -a -q)'
alias dri='docker rmi $(docker images -f "dangling=true" -q)'
# alias dri='docker rmi $(docker images -q) --force'
alias dra='docker system prune -af --volumes'
alias dp='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

alias e="docker exec -ti"

# alias m='docker run --rm -ti -v /tmp/m:/m_save_volume -w /m_save_volume -p 8000:8000 -p 19000-19020:19000-19020 alpine'

alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

export GPG_TTY=$(tty)


## Drafts

	# php
	sudo apt install php php-xml composer

	# node
	sudo apt install nodejs npm
	sudo npm cache clean -f
	sudo npm install -g n
	sudo n stable # sudo n latest

	sudo apt install chromium keepassxc redshift-gtk sublime-text veracrypt fonts-firacode ttf-mscorefonts-installer

	@TODO
	* I3
	* I3 Gaps -> https://github.com/Airblader/i3
	* Rofi
	* Compton
	* lxappearance

## Run docker

	sudo dockerd &

## Trim SSD (done by default in ubuntu ?)

	lsblk
	sudo systemctl enable fstrim.timer
	systemctl status fstrim.timer

## Keyboard

	setxkbmap fr azerty
	setxkbmap fr bepo

## Replace the key ² with: \`:
	xmodmap -pke > ~/.Xmodmap # Create the key map
	~/.Xmodmap # Change 'twosuperior' with 'grave' (l49)
	xmodmap ~/.Xmodmap # and refresh

## VPS

### SWAP limit

[https://ubuntuplace.info/questions/313645/docker-warning-no-swap-limit-support](https://ubuntuplace.info/questions/313645/docker-warning-no-swap-limit-support)

```diff
+ docker info
- WARNING: No swap limit support

1) Log into the Ubuntu or Debian host as a user with sudo privileges.

2) Edit the /etc/default/grub file. Add or edit the GRUB_CMDLINE_LINUX line to add the following two key-value pairs:

GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"

3) Update GRUB.
$ sudo update-grub
```

### Clean for free space

```
# 0 * * * * apt update && apt upgrade -y

# LOGS CLEAN
0 6 * * * find /tmp -type f -atime +10 -delete
0 6 * * * find /var/log/ -type f -regex '.*\.[0-9]+\.gz$' -delete

# DOCKER CLEAN
0 6 * * * docker builder prune -f
0 6 * * * docker rmi $(docker images -f "dangling=true" -q)
0 6 * * * docker rm $(docker ps -a -q)
# 0 * * * * docker system prune -af --volumes

# APT CLEAN
0 6 * * * apt-get autoclean
0 6 * * * apt-get clean
0 6 * * * apt-get autoremove --purge
0 6 * * * apt-get autoremove
0 6 * * * journalctl --vacuum-time=3d
0 6 * * * sudo snap set system refresh.retain=2
```
___________________________________________________________

## Generate ACME (old)

	# 0 5 1 * * docker container run -ti -v /home/alex/ENV/letsencrypt:/etc/letsencrypt certbot/certbot certonly --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory --manual-public-ip-logging-ok -d '*.alexandre-hublau.com' -d alexandre-hublau.com

(not clean because we generate for `*.alexandre-hublau.com`)

## FIXES

### Umask

	umask 077

### Install image:

	sudo dd bs=1M if=~/Downloads/s.img of=/dev/sda status=progress conv=fsync

### Scan network:

	nmap -sn 192.168.1.0/24

### Chromium history

In `/home/alex/snap/chromium/current/.config/chromium/Default`, put the file `History` in read only.

### I3 mouse fix

	xinput --set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Tapping Enabled" 1


### XPS

https://github.com/erpalma/throttled

### LIGHT:

* Sound:
```pavucontrol```
```amixer -D pulse sset Master 30%```

* Fix wifi:
```nmtui```

### The touchpad does not work:

* Change in the grub,  l ~ 10:
```sudo nano /etc/default/grub```
```GRUB_CMDLINE_LINUX_DEFAULT="i8042.reset i8042.nomux i8042.nopnp i8042.noloop"```
```sudo update-grub```

* OR:

* Open the grub (shift when the computer goes on), then type:
```psmouse.proto=bare```


### Sublime text 3

* Build JS if it doesn't work : `which node`

See in : .config/sublime-text-3/Packages/User/js.sublime-build/js.sublime-build

Change the path

___________________________________________________________

	sudo service mysql restart
	sudo mysql # logs in automatically into MariaDB
	use mysql;
	update user set plugin='' where user='root';
	SET PASSWORD FOR root@'localhost' = PASSWORD('root');
	flush privileges;
	exit;
	sudo service mysql restart # restarts the mysql service

### Bash not displayed

	chsh -s /bin/bash

### Time

	sudo dpkg-reconfigure tzdata
	
### Click sound issue

	echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save
	# Found here : https://askubuntu.com/questions/175602/periodic-clicking-sound-from-pc-speaker & https://stackoverflow.com/questions/51434915/etc-rc-local-is-missing-from-my-headless-ubuntu-18-04
	
### Docker snap use

	sudo snap stop docker

### Gnome

	gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
