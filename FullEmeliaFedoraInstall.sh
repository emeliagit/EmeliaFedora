#! /bin/bash

# welcome message, tell user what to expect
echo "Hello! This little script here is gonna do some stuff, install some software to make your install of Fedora more complete and comfortable to install with little hassle. This may take awhile depending on your internet, should generally only be like a minute, but could be more like 5 if your router is a potato."
echo "Beware, this script does enable RPM Fusion's nonfree repository for drivers and whatnot, feel free to edit it to your liking. It will also require a root password, and your user password later to change your shell. Feel free to change that if you don't like it."
# upgrade computer before doing anything
sudo dnf upgrade 
# enable RPM Fusion's free and nonfree repos 
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update && sudo dnf makecache
# Append some options that I like to dnf.conf (dnf's config file, located in /etc/dnf)
sudo echo "gpgcheck=True
installonly_limit=3
clean_requirements_on_remove=True
best=False
skip_if_unavailable=True
max_parallel_downloads=6
defaultyes=True" >> /etc/dnf.conf
# install some software I like to use, personally
sudo dnf install utils-linux-user lolcat alacritty fastfetch flatpak ark gnome-tweaks gnome-extensions-app fish zsh
# install multimedia codecs, done separately because some people may have issues with it
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
# change default shell to Fish, as I like using Fish to interact with my OS. Bash for scripting, though. Fish sucks for scripting lol
chsh -s /bin/fish | lolcat
#  add Flathub repository to Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# install some flatpaks I like 
flatpak install librewolf flatseal discord blanket kget
# run a quick Fastfetch 'cause Fastfetch is cool, then display ending message
fastfetch | lolcat
echo "All done! Hopefully everything worked, sorry if it didn't. Enjoy your Emelia-ified Fedora installation. :)"
