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
	cp /mnt/c/Users/KGHB1518/.ssh ~/.ssh/
	chmod 600 ~/.ssh/id_rsa

	# docker
	sudo apt instal docker.io docker-compose -y
	sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker 

	# vim
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh

	# zsh
	sudo apt install zsh -y
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# sudo vim /etc/passwd  <-- to change default shell, but perhaps `chsh` can do it too ! Actually OMZSH do it for you

## Drafts

	# php
	sudo apt install php php-xml

	# node
	sudo apt install nodejs npm
	sudo npm cache clean -f
	sudo npm install -g n
	sudo n stable
	
	sudo n latest

## Run docker

	sudo dockerd &

## Trim SSD (done by default in ubuntu ?)

	lsblk
	sudo systemctl enable fstrim.timer
	systemctl status fstrim.timer
	
## Keyboard

	setxkbmap fr azerty
	setxkbmap fr bepo

___________________________________________________________
___________________________________________________________
___________________________________________________________
___________________________________________________________
___________________________________________________________


## Umask

	umask 077

## Install image:

	sudo dd bs=1M if=~/Downloads/s.img of=/dev/sda status=progress conv=fsync

## Scan network:

	nmap -sn 192.168.1.0/24

## Chromium history

In `/home/alex/snap/chromium/current/.config/chromium/Default`, put the file `History` in read only.

## Replace the key ² with: \`:
1. `xmodmap -pke > ~/.Xmodmap` > Create the key map
2. `~/.Xmodmap` > Change 'twosuperior' with 'grave' (l49)
3. `xmodmap ~/.Xmodmap` > and refresh

## SSH
Cache `ssh-agent ssh-add`

`git config --global user.name "xandermann"`
`git config --global user.email "contact@alexandre-hublau.com"`
`git config --global branch.autosetuprebase always`


# I3 mouse fix

	xinput --set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Tapping Enabled" 1

___________________________________________________________

## Package list:

### Basic

`Chromium keepassxc redshift-gtk sublime-text veracrypt`
Font `fonts-firacode`

	sudo apt install ttf-mscorefonts-installer

### Dev

`eclipse-java composer npm git ruby`
+ LAMP `https://doc.ubuntu-fr.org/lamp`

### See ?

`flash-plugin` ?

### I3WM
* I3
* I3 Gaps -> https://github.com/Airblader/i3
* Rofi
* Compton
* lxappearance

___________________________________________________________

## FIXES:

### XPS

https://github.com/erpalma/throttled

### LIGHT:

* Sound:
```pavucontrol```
```amixer -D pulse sset Master 30%```

* Fix wifi:
```nmtui```

#### The touchpad does not work:

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

# Bash not displayed

	chsh -s /bin/bash

# Hours

	sudo dpkg-reconfigure tzdata
	
# Docker info - swap memory

    You can enable these capabilities on Ubuntu or Debian by following these instructions. Memory and swap accounting incur an overhead of about 1% of the total available memory and a 10% overall performance degradation, even if Docker is not running.

    1) Log into the Ubuntu or Debian host as a user with sudo privileges.

    2) Edit the /etc/default/grub file. Add or edit the GRUB_CMDLINE_LINUX line to add the following two key-value pairs:

    GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"

    3) Update GRUB.

    $ sudo update-grub

[https://ubuntuplace.info/questions/313645/docker-warning-no-swap-limit-support](https://ubuntuplace.info/questions/313645/docker-warning-no-swap-limit-support)
