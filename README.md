___________________________________________________________

# Ubuntu packages

___________________________________________________________

# First lines

	useradd alex
	usermod -aG sudo alex

## Umask

	umask 077

## Keyboard

	setxkbmap fr azerty
	setxkbmap fr bepo


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
	
# Docker info - swap memory

    You can enable these capabilities on Ubuntu or Debian by following these instructions. Memory and swap accounting incur an overhead of about 1% of the total available memory and a 10% overall performance degradation, even if Docker is not running.

    1) Log into the Ubuntu or Debian host as a user with sudo privileges.

    2) Edit the /etc/default/grub file. Add or edit the GRUB_CMDLINE_LINUX line to add the following two key-value pairs:

    GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"

    3) Update GRUB.

    $ sudo update-grub

[https://ubuntuplace.info/questions/313645/docker-warning-no-swap-limit-support](https://ubuntuplace.info/questions/313645/docker-warning-no-swap-limit-support)
