Dots
====

Installation (Ubuntu)
------------
First, run the scripts to install all the packages and config files.
```
sudo apt install git
git clone https://github.com/rfaulk/dots
cd dots/
./packages.sh  
./install.sh -i
```

Restart and choose i3 as the window manager.

Now run `lxappearance` and pick a theme (Adwaita-dark is nice).

Uninstallation
--------------
Run the uninstallation script to remove all the config files.
```
./install.sh -u
```
