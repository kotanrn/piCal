#!/bin/bash

# Must set this option, else script will not expand aliases
shopt -s expand_aliases

# Set username and IP address here
alias piSSH='ssh pi@192.168.1.113'
alias PICsshfs='sshfs pi@192.168.1.113:/home/pi /media/user/pics_mnt&'


HEIGHT=20
WIDTH=40
CHOICE_HEIGHT=13
BACKTITLE="Eagle Rising - n0beard"
TITLE="Available calendar modes"
MENU="Choose one of the following options:"

OPTIONS=(1 "Update shells and index"
         2 "Chores"
         3 "Family"
         4 "Chores w/ mouse"
         5 "Family w/ mouse"
         6 "Do Nothing"
         7 "Reboot"
         8 "Check Flags"
         9 "Just SSH"
         A "Kid Pictures"
         B "Family Pictures"
         C "sshfs Pictures"
         D "localIndex")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            # Update browser.sh
            if [ -e "browser.local" ]; then echo -e "Updating browser.sh\n" && cat browser.local | piSSH 'cat > browser.sh' && sleep 2
              else echo "Error! Unable to locate browser.local....exiting" && sleep 1
            fi

            if [ -e "reload.local" ]; then echo -e "Updating reload.sh\n" && cat reload.local | piSSH 'cat > reload.sh' && sleep 1
              else echo "Error! Unable to locate reload.local....exiting" && sleep 2
            fi

            if [ -e "index.local" ]; then echo -e "Updating index.html\n" && cat index.local | piSSH 'cat > index.html' && sleep 1
              else echo "Error! Unable to locate index.local....exiting" && sleep 2
            fi

            # Show me what you got!
            echo -e "Fucking updated that shit, biiiiiiiiiiitch!"; sleep 2
            ;;
        2)
            # Chores
            echo "Changing to chores calendar (no mouse)" && (echo 'Chores' | piSSH 'cat > doit.value; sudo reboot') && echo "Fuck yeah" && sleep 2
            ;;
        3)
            # Family
            echo "Changing to family calendar (no mouse)" && echo 'iCloud' | piSSH 'cat > doit.value; sudo reboot' && sleep 2
            ;;
        4)
            # Chores w/ mouse
            echo "Changing to chores calendar (with mouse)" && echo 'ChoresMouse' | piSSH 'cat > doit.value; sudo reboot' && sleep 2
            ;;
        5)
            # Family w/ mouse
            echo "Changing to chores calendar (with mouse)" && echo 'iCloudMouse' | piSSH 'cat > doit.value; sudo reboot' && sleep 2
            ;;
        6)
            # Do Nothing
            echo "The calendar won't load chromium next time" && echo 'doNothing' | piSSH 'cat > doit.value' && sleep 2
            ;;
        7)
            # Reboot
            echo "The calendar is rebooting now" && piSSH 'sudo reboot' && sleep 2
            ;;
        8)
            # Check Flags
            echo "Changing to check chromium's advanced flags" && echo 'checkFlags' | piSSH 'cat > doit.value; sudo reboot' && sleep 2
            ;;
        9)
            # Just SSH
            echo "Establishing plain SSH connection" && sleep 1 && piSSH
            ;;

        A)
            # Load Kids' pics slideshow
            echo "Changing to Kids' pics slideshow" && echo 'PicsKid' | piSSH 'cat > doit.value; sudo reboot' && sleep 2
            ;;

        B)
            # Load Family pics slideshow
            echo "Changing to Family pics slideshow" && echo 'PicsFam' | piSSH 'cat > doit.value; sudo reboot' && sleep 2
            ;;

        C)
            # Use sshfs to load pictures
	    ~/Desktop/famPics.sh
            ;;

        D)
            # Launch index.html
            echo "Launching index.html" && (echo 'localIndex' | piSSH 'cat > doit.value; sudo reboot') && echo "Fuck yeah" && sleep 2
            ;;


esac
