___________________________________________________________

# Ubuntu packages

___________________________________________________________

Install image:

	sudo dd bs=1M if=~/Downloads/s.img of=/dev/sda status=progress conv=fsync

Scan network:

	nmap -sn 192.168.1.0/24

## Replace the key ² with: \`:
1. `xmodmap -pke > ~/.Xmodmap` > Create the key map
2. `~/.Xmodmap` > Change 'twosuperior' with 'grave' (l49)
3. `xmodmap ~/.Xmodmap` > and refresh

## SSH
Cache `ssh-agent ssh-add`

`git config --global user.name "xandermann"`
`git config --global user.email "contact@alexandre-hublau.com"`
`git config --global branch.autosetuprebase always`

___________________________________________________________

## Package list:

### Basic

`Chromium keepassxc redshift-gtk sublime-text veracrypt`
Font `fonts-firacode`

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
	update user set plugin='' where user='your_user_name';
	flush privileges;
	exit;
	sudo service mysql restart # restarts the mysql service



	UPDATE
	  mysql.user
	SET
	  Password = PASSWORD('root')
	WHERE
	  User = 'root';
	FLUSH PRIVILEGES;
	exit;
