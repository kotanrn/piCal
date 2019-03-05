# piCal
A simple RaspberryPi calendar photo display. It can be switched between the two remotely.  

# Setup:
Download latest rPi image:
-- https://www.raspberrypi.org/downloads/


Copy the image to SD card:
-- sudo dd bs=4M if=2018-11-13-raspbian-stretch-full.img of=/dev/mmcblk0 conv=fsync status=progress


Install SD card and boot.


Update rPi and install dependencies:
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get install -y xdotool ntp feh sshfs && sudo apt -y autoremove


Create and copy ssh keys to remote server:
-- On local machine:
-- ssh-copy-id pi@[Pi's IP address]


Add this to /etc/profile:
-- sudo ntpd -gq   # Ensures the time is accurate on boot
-- sudo /etc/init.d/ntp restart

Display what you told it to:
-- cd ~/; ./browser.sh


See crontab.txt for example crontab...
