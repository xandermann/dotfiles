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
	# imap jk <Esc>

	# zsh
	sudo apt install zsh -y
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# sudo vim /etc/passwd  <-- to change default shell, but perhaps `chsh` can do it too ! Actually OMZSH do it for you

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
0 * * * * find /tmp -type f -atime +10 -delete
0 * * * * find /var/log/ -type f -regex '.*\.[0-9]+\.gz$' -delete
# 0 * * * * docker system prune -af --volumes
0 * * * * apt-get autoclean
0 * * * * apt-get clean
0 * * * * apt-get autoremove --purge
0 * * * * apt-get autoremove
0 * * * * journalctl --vacuum-time=3d
```

```
#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
# set -eu
# snap list --all | awk '/disabled/{print $1, $3}' |
    # while read snapname revision; do
        # snap remove "$snapname" --revision="$revision"
    # done
```


___________________________________________________________
___________________________________________________________
___________________________________________________________
___________________________________________________________
___________________________________________________________
___________________________________________________________
___________________________________________________________
___________________________________________________________
___________________________________________________________
___________________________________________________________

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
