#!/bin/bash

red='\033[1;91m'          # Red
green='\033[1;92m'        # Green
yellow='\033[1;93m'       # Yellow
White='\033[1;97m'        # White
Blue='\033[1;94m'
BICyan='\033[1;96m'

header(){
clear

echo -e ""
echo -e "${yellow} ----------------------------------------------------------------"
echo -e "${yellow} ----------------------------------------------------------------"
echo -e ""
echo -e "  ${green} _  ___  ___  _ _   ${red} ___  _  ___  ___  _ _ _  ___  _    _   "
echo -e "  ${green}| || . \| . || \ |  ${red}| __]| || . \| __]| | | || . || |  | |  "
echo -e "  ${green}| ||   /|   ||   |  ${red}| _] | ||   /| _] | | | ||   || |_ | |_ "
echo -e "  ${green}|_||_\_\|_|_||_\_|  ${red}|_|  |_||_\_\|___]|__/_/ |_|_||___||___|"
echo -e ""
echo -e "   ${Blue}VERSION: 2.2.0"
echo -e ""
echo -e "${yellow} ----------------------------------------------------------------"
echo -e "${yellow} ----------------------------------------------------------------"
echo -e ""
echo -e ""

}

port_allow (){

echo -e "${White} Enter Your Server ssh Port (${green}Default:22${White}): "
read -p "" port
if ! [[ $port =~ ^[0-9]+$ ]]; then

 port=$((22))


fi

}
ping_allow (){
echo -e "${White} Do you want to block ICMP Protocol(y,n ${green}Default:yes)${White}?"
read -p "" pin
if [[ "${pin}" == "n" || "${pin}" == "N"  || "${pin}" == "NO"  || "${pin}" == "no" ]]; then

iptables -A INPUT -p ICMP --icmp-type 8 -j ACCEPT
iptables -A INPUT -p ICMP --icmp-type 0 -j ACCEPT

icm="no"
else
icm="yes"

iptables -A INPUT --proto icmp -j DROP

fi
}
reset_func(){
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
}
run(){

iptables -A INPUT -p tcp --dport $port -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -I INPUT 1 -i lo -j ACCEPT
iptables -A INPUT -j DROP
sudo /sbin/iptables-save
}
reset_allow(){
echo -e  "Do you want to reset old Setting(y,n ${green}Default:no)${White}?"
read -p "" reset
}
header

echo -e "${White}Please Choose Option :${White}"
echo -e ""
echo -e "${White}  1 - ${green}Activate"
echo -e ""
echo -e "${White}  2 - ${red}Reset & Deactive"
echo -e ""
echo -e "${White}  3 - ${yellow}Update"
echo -e ""
echo -e "${White}  4 - ${Blue}Uninstall"
echo -e ""
echo -e "${White}  0 - ${BICyan}Exit"
echo -e "${White}"
read -p "Enter Number of Option :" data


if [ "$data" = "1" ]; then

header

echo -e "${White}Please Choose Option :${White}"
echo -e ""
echo -e "${White}  1 - ${green}Allow Iran Geoip"
echo -e ""
echo -e "${White}  2 - ${red}Allow Cloudflare CDN ips"
echo -e ""
echo -e "${White}  3 - ${yellow}Allow Iran & Cloudflare"
echo -e ""
echo -e "${White}  4 - ${Blue}Allow Custom ip"
echo -e ""
echo -e "${White}  0 - ${BICyan}Exit"
echo -e "${White}"
read -p "Enter Number of Option :" active

if [ "$active" = "1" ]; then


port_allow

ping_allow

reset_allow

if [[ "${reset}" == "y" || "${reset}" == "Y"  || "${reset}" == "YES"  || "${reset}" == "yes" ]]; then

while read line; do iptables -A INPUT -p tcp -s $line -j ACCEPT; done < iran.txt
run

else

reset_func

while read line; do iptables -A INPUT -p tcp -s $line -j ACCEPT; done < iran.txt
run

fi
clear

echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e ""
echo -e "${White}Iran Geoip ${green}Allowed ${White}Successfully "
echo -e ""
echo -e "Allowd Port: $port"
echo -e ""
echo -e "Allow ICMP: $icm"
echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e "${White}"

exit 1

elif [ "$active" = "2" ]; then

port_allow

ping_allow

reset_allow

if [[ "${reset}" == "y" || "${reset}" == "Y"  || "${reset}" == "YES"  || "${reset}" == "yes" ]]; then

while read line; do iptables -A INPUT -p tcp -s $line -j ACCEPT; done < cloudflare.txt
run

else

reset_func
while read line; do iptables -A INPUT -p tcp -s $line -j ACCEPT; done < cloudflare.txt
run

fi



clear

echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e ""
echo -e "${White}CloudFlare IP ${green}Allowed ${White}Successfully "
echo -e ""
echo -e "Allowd Port: $port"
echo -e ""
echo -e "Allow ICMP: $icm"
echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e "${White}"

exit 1

elif [ "$active" = "3" ]; then

port_allow

ping_allow

reset_allow

if [[ "${reset}" == "y" || "${reset}" == "Y"  || "${reset}" == "YES"  || "${reset}" == "yes" ]]; then

while read line; do iptables -A INPUT -p tcp -s $line -j ACCEPT; done < iran.txt
while read line; do iptables -A INPUT -p tcp -s $line -j ACCEPT; done < cloudflare.txt
run

else

reset_func

while read line; do iptables -A INPUT -p tcp -s $line -j ACCEPT; done < iran.txt
while read line; do iptables -A INPUT -p tcp -s $line -j ACCEPT; done < cloudflare.txt
run

fi



clear

echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e ""
echo -e "${White}Iran Geoip & Cloudflare ${green}Allowed ${White}Successfully "
echo -e ""
echo -e "Allowd Port: $port"
echo -e ""
echo -e "Allow ICMP: $icm"
echo -e ""
echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e "${White}"

exit 1

elif [ "$active" = "4" ]; then

echo -e "${White} Enter Your Custom IP (${green}EX:x.x.x.x/32${White}): "
read -p "" cip

if [[ $cip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then

port_allow


ping_allow

reset_allow

if [[ "${reset}" == "y" || "${reset}" == "Y"  || "${reset}" == "YES"  || "${reset}" == "yes" ]]; then

iptables -A INPUT -p tcp -s $cip -j ACCEPT
run

else

reset_func
iptables -A INPUT -p tcp -s $cip -j ACCEPT
run
fi



clear

echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e ""
echo -e "${White}Custom IP ${green}Allowed ${White}Successfully "
echo -e ""
echo -e "Allowd IP: $cip"
echo -e ""
echo -e "Allowd Port: $port"
echo -e ""
echo -e "Allow ICMP: $icm"
echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e "${White}"

exit 1

else

clear

echo -e "${yellow}------------------------------------"
echo -e ""
echo -e "${red}The Entered IP is Not Valid !"
echo -e ""
echo -e "${White}Please Enter a Valid IP and Try Again!${White}"
echo -e ""
echo -e "${yellow}------------------------------------${White}"

exit 1

fi
else

clear

echo -e ""
echo -e ""
echo -e "${red}Please choose one option ! ${red}"
echo -e "${yellow}------------------------------------"
echo -e "${White}"

fi

elif [ "$data" == "2" ]; then

reset_func


echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e ""
echo -e "${White}The Firewall ${red}Dactivated ${White}Successfully"
echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e "${White}"

exit 1

elif [ "$data" == "3" ]; then

 rm -rf start.sh ip.txt iran.txt cloudflare.txt ir_rules.zip reset.sh && wget https://github.com/sh-vp/Ir-acc-WAF/releases/latest/download/ir_rules.zip &&unzip ir_rules.zip && chmod +x start.sh

clear

echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e ""
echo -e "${White}The Firewall ${yellow}Update ${White}Successfully  "
echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e ""
echo -e "${White}Now Use Below Command To Run Again !"
echo -e ""
echo -e "${green}->  ./start.sh"
echo -e "${White}"

exit 1

elif [ "$data" == "4" ]; then 

reset_func

rm -rf start.sh ip.txt iran.txt cloudflare.txt reset.sh ir_rules.zip

clear

echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e ""
echo -e "${White}  The Firewall ${red}Uninstall And Remove ${White}Completely"
echo -e ""
echo -e "${yellow}-------------------------"
echo -e "${yellow}-------------------------"
echo -e "${White}"

exit 1

elif [ "$data" == "0" ]; then 

exit 1

else

clear

echo -e ""
echo -e ""
echo -e "${red}Please Enter Current Order! ${red}"
echo -e "${White}"

fi