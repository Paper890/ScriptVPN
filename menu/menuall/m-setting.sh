#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }

#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/Paper890/izin/main/permisi"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "                 MENU LAINNYA              $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE} 1.${NC} \033[0;36m UPDATE SCRIPT ${NC}"
echo -e "  ${ORANGE} 2.${NC} \033[0;36m DELL ALL EXP ${NC}"
echo -e "  ${ORANGE} 3.${NC} \033[0;36m INFO PORT ${NC}"
echo -e "  ${ORANGE} 4.${NC} \033[0;36m VPS INFO ${NC}"
echo -e "  ${ORANGE} 5.${NC} \033[0;36m SPEEDTEST ${NC}"
echo -e "  ${ORANGE} 6.${NC} \033[0;36m ADD DOMAIN ${NC}"
echo -e "  ${ORANGE} 7.${NC} \033[0;36m CERT. SSL ${NC}"
echo -e "  ${ORANGE} 8.${NC} \033[0;36m AUTOREBOOT ${NC}"
echo -e "  ${ORANGE} 9.${NC} \033[0;36m RESTART ALL SERVICE ${NC}"
echo -e "  ${ORANGE}10.${NC} \033[0;36m GANTI BANNER SSH ${NC}"
echo -e "  ${ORANGE}11.${NC} \033[0;36m INSTALL UDP CUSTOM ${NC}"
echo -e "  ${ORANGE}12.${NC} \033[0;36m REBOOT SERVER ${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p "Select From Options [ 1 - 5 ] : " menu
case $menu in
1)
    wget https://raw.githubusercontent.com/Paper890/ScriptVPN/menu/instal.sh && chmod +x instal.sh && instal.sh
    ;;
2)
    xp
    ;;
3)
    prot
    ;;
4)
    gotop
    ;;
5)
    speedtest
    ;;
6)
    addhost
    ;;
7)
    fixcert
    ;;
8)
    autoreboot
    ;;
9)
    restart
    ;;
10)
    nano /etc/issue.txt
    ;;
11)
    udp-custom
    ;;
12)
    reboot
    ;;
*)
    menu
    ;;
esac
