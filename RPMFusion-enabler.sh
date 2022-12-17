#! /bin/bash

echo "Hello! This little script here is just gonna enable RPM Fusion for ya real quick. You will need to enter your password, as this runs dnf as root to install RPM Fusion repositories."
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  echo "Alrighty, assuming everything went right here, you'll probably want to reboot now, but I leave that up to your discretion. :)"
