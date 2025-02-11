#!/bin/bash

exit=false
function header() {
        echo -e ""
        echo -e "================================================"
        echo -e "|  _____                ____        _ _        |"
        echo -e "| | ____|__ _ ___ _   _/ ___| _   _(_) |_ ___  |"
        echo -e "| |  _| / _  / __| | | \___ \| | | | | __/ _ \ |"
        echo -e "| | |__| (_| \__ \ |_| |___) | |_| | | ||  __/ |"
        echo -e "| |_____\__,_|___/\__, |____/ \__,_|_|\__\___| |"
        echo -e "|                 |___/                        |"
        echo -e "=============================== by fr4nc15 ====="
        echo -e "| Making your life easier, one tool at a time  |"
        echo -e "================================================"
}
function backtomenu() {
        echo -e "\nGoing back to main menu..."
        exit=true
}

trap backtomenu SIGINT

while true; do
        if [ "$exit" = true ]; then
                exit=false
                break
        fi
        clear
        header
		echo -e ""
        echo -e "MAIN MENU"
        echo -e "--------------------------"
        echo -e "1. Check for updates"
        echo -e "2. Update your system"
        echo -e "3. Check system information"
        echo -e "4. Remove unnecessary packets"
        echo -e "5. Check Network information"
        echo -e "6. Essential tools"
	echo -e ""
        echo -e "00. Exit"
        echo -e "--------------------------"
		echo -e ""
        read -p "easySuite>" number

        case $number in
        1)

                        clear
                        header
                        echo -e ""
                        echo -e "Checking for system updates..."
                        sudo apt-get update
                        read -p "All done! Hit Enter to go back to menu..."
                ;;

        2)

                        clear
                        header
                        echo -e ""
                        echo -e "Updating your system..."
                        sudo apt-get upgrade
                        read -p "All done! Hit Enter to go back to menu..."

                ;;

        3)

                        clear
                        header
                        echo -e ""
                        echo -e "Checking for system information..."
                        hostnamectl
                        read -p "Hit Enter to go back to menu when ready..."
                ;;


        4)

                        clear
                        echo -e ""
                        header
                        echo -e ""
                        echo -e "Removing unnecessary packets..."
                        sudo apt autoremove
                        read -p "All done! Hit Enter to go back to menu..."
                ;;

        5)

                        clear
                        header
                        echo -e ""
                        echo -e "Checking Network information..."
                        iwconfig
                        read -p "All done! Hit Enter to go back to menu..."
                ;;

        6)
                while true; do
                        if [ "$exit" = true ]; then
                                exit=false
                                break
                        fi
                        clear
                        header
						echo -e ""
                        echo -e "ESSENTIAL TOOLS"
                        echo -e "---------------"
                        echo -e "1. Nmap"
                        echo -e "2. Aircrack-ng"
                        echo -e "3. Wireshark"
                        echo -e "4. MetaSploit Framework"
                        echo -e "5. Social Engineering Toolkit"
			echo -e "6. Bettercap"
			echo -e "7. Lynis"
			echo -e "8. OpenVPN"
			echo -e "9. chkrootkit"
			echo -e ""
                        echo -e "00. Back to main menu"
			echo -e "---------------"
			echo -e ""
                        read -p "easySuite>" essentials

                        case $essentials in
                                1)
                                        NMAP="nmap"
                                        echo -e "Checking for Nmap in your system..."
                                        if ! command  -v $NMAP &> /dev/null
                                        then
                                                echo "$NMAP is not installed. Installing..."
                                                sudo apt update
                                                sudo apt install -y $NMAP
                                                read -p "Done! Hit Enter to go back..."
                                        else
                                                read -p "Nmap is already installed on your system, to execute type 'sudo nmap' in another terminal..."
                                        fi
                                        ;;
                                2)
                                        AIRCRACK="aircrack-ng"
                                        echo -e "Checking for Aircrack-ng on your system..."
                                        if ! command -v $AIRCRACK &> /dev/null
                                        then
                                                echo "$AIRCRACK is not installed. Installing..."
                                                sudo apt update
                                                sudo apt install -y $AIRCRACK
                                                read -p "Done! Hit Enter to go back..."
                                        else
                                                read -p "Aircrack is already installed in your system, to execute type 'sudo aircrack-ng' in another terminal..."
                                        fi
                                        ;;

                                3)
                                        WIRESHARK="wireshark"
                                        echo -e "Checking for Wireshark on your system..."
                                        if ! command -v $WIRESHARK &> /dev/null
                                        then
                                                echo "$WIRESHARK is not installed. Installing..."
                                                sudo apt update
                                                sudo apt install -y $WIRESHARK
                                                read -p "Done! Hit Enter to go back..."
                                        else
                                                read -p "Wireshark is already installed in your system, to execute type 'sudo wireshark' in another terminal..."
                                        fi
                                        ;;
                                4)
                                        METASPLOIT="msfconsole"
                                        echo -e "Checking for Metasploit Framework on your system..."
                                        if ! command -v $METASPLOIT &> /dev/null
                                        then
                                                echo "$METASPLOIT is not installed. Installing..."
                                                sudo apt update
                                                sudo apt install -y $METASPLOIT
                                                read -p "Done! Hit Enter to go back..."
                                        else
                                                read -p "Metasploit Framework is already installed in your system, to execute type 'msfconsole' in another terminal..."
                                        fi
                                        ;;
                                5)
                                        SET="set"
                                        echo -e "Checking for Social Engineering Toolkit on your system..."
                                        if ! command -v $SET &> /dev/null
                                        then
                                                echo "$SET is not installed. Installing..."
                                                sudo apt update
                                                sudo apt install -y $SET
                                                read -p "Done! Hit Enter to go back..."
                                        else
                                                read -p "Social Engineering Toolkit is already installed in your system, to execute type 'sudo set' in another terminal..."
                                        fi
                                        ;;

								6)
										BETTERCAP="bettercap"
										echo -e "Checking for Bettercap on your system..."
										if ! command -v  $BETTERCAP &> /dev/null
										then
											echo "$BETTERCAP is not installed. Installing..."
											sudo apt update
											cd /opt
											sudo git clone https://github.com/bettercap/bettercap.git
											sudo make
											read -p "Done! Hit Enter to go back..."
										else
											read -p "Bettercap is already installed in your system, to execute type 'sudo bettercap' in another terminal..."
										fi
										;;
                                7)
                                        LYNIS="lynis"
                                        echo -e "Checking for Lynis on your system..."
                                        if ! command -v  $LYNIS &> /dev/null
                                        then
                                                echo "$LYNIS is not installed. Installing..."
                                                sudo apt update
                                                cd /opt
                                                sudo apt install lynis
                                                read -p "Done! Hit Enter to go back..."
                                        else
                                                read -p "Lynis is already installed in your system, to execute type 'sudo lynis' in another terminal..."
                                        fi
                                        ;;
                                8)
                                        OPENVPN="openvpn"
                                        echo -e "Checking for OpenVPN on your system..."
                                        if ! command -v  $OPENVPN &> /dev/null
                                        then
                                                echo "$OPENVPN is not installed. Installing..."
                                                sudo apt update
                                                cd /opt
                                                sudo apt install openvpn
                                                read -p "Done! Hit Enter to go back..."
                                        else
                                                read -p "OpenVPN is already installed in your system, to execute type 'sudo openvpn' in another terminal..." 
                                        fi
                                        ;;
                                9)
                                        CHKROOTKIT="chkrootkit"
                                        echo -e "Checking for chkrootkit on your system..."
                                        if ! command -v  $CHKROOTKIT &> /dev/null
                                        then
                                                echo "$CHKROOTKIT is not installed. Installing..."
                                                sudo apt update
                                                cd /opt
                                                sudo apt install chkrootkit
                                                read -p "Done! Hit Enter to go back..."
                                        else
                                                read -p "Chkrootkit is already installed in your system, to execute type 'sudo chkrootkit' in another terminal..." 
                                        fi
                                        ;;
                                00)
                                                echo -e "Going back to main menu..."
                                                break
                                        ;;

                        esac

                done
                ;;


        00)

                while true; do
                        clear
                        header
                        echo -e "Exiting..."
                        exit 0

                done
                ;;


        esac
done
