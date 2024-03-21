#!/bin/bash
# COLOR VALIDATION
clear
RED='\033[0;31m'
NC='\e[0m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\033[1;95m"
YELL='\033[1;33m'
ORANGE='\033[0;33m'
BGX="\033[42m"
UPDATE="https://abc.xcodehoster.com/"
BOT="https://abc.xcodehoster.com/"
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

echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "                 MENU BOT              $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "  ${ORANGE}1.${NC}\033[0;36m Add Bot Notifikasi${NC}"
echo -e "  ${ORANGE}2.${NC}\033[0;36m Delete Bot Notifikasi${NC}"
echo -e "  ${ORANGE}3.${NC}\033[0;36m Add bot auto backup${NC}"
echo -e "  ${ORANGE}4.${NC}\033[0;36m Add bot Telegram panel${NC}"
echo -e ""
echo -e "  ${ORANGE}0.${NC}\033[0;36m Back To Menu${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p "  Select From Options [ 1 - 2 or 0 ] : " menu
case $menu in
1) clear ;
    add-bot-notif
    ;;
2) clear ;
    del-bot-notif
    ;;
3) clear ;
    mbot
    ;;
4) clear ;
    add-bot-panel
    ;;
0) clear ;
    menu
    ;;
*) clear ;
    menu
    ;;
esac
