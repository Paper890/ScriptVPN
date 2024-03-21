#!/bin/bash
DF='\e[39m'
RED='\033[0;31m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lyellow='\e[93m'
Lgreen='\e[92m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
#satusbot
bot_kyt=$(systemctl status kyt | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE  BOT 
if [[ $bot_kyt == "running" ]]; then 
   status_bot="${GREEN}Online$NC${c} $NC"
else
   status_bot="${RED}Offline${NC} "
fi
#####
KIRI="\033[1;32m◘$NC"
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
MYIP=$(wget -qO- ipinfo.io/ip);
clear 
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "                MENU BOT PANEL           "
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "" 
echo -e " ${KIRI} Status Bot ( ${status_bot} )"
echo -e ""
echo -e "  ${ORANGE}[1]${NC}\033[0;36m Add Bot Panel${NC}"
echo -e "  ${ORANGE}[2]${NC}\033[0;36m Delete Bot Panel${NC}"
echo -e "  ${ORANGE}[3]${NC}\033[0;36m Stop Bot Panel${NC}"
echo -e "  ${ORANGE}[4]${NC}\033[0;36m Restart Bot Panel${NC}"
echo -e "" 
echo -e "  ${ORANGE}[0]${NC}\033[0;36m Back To Menu${NC}"
echo -e "" 
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; wget https://raw.githubusercontent.com/Paper890/instal-bot/main/san.sh && chmod +x san.sh && ./san.sh ;;
02 | 2) clear ; hapus-bot ;;
02 | 3) clear ; stop-bot ;;
00 | 4) clear ; restart-bot ;;
*) clear ; menu ;;
esac