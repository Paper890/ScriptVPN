#!/bin/bash
# COLOR VALIDATION
clear
y='\033[1;33m' #yellow
BGX="\033[42m"
COLBG1="\e[1;97;101m"
CYAN="\033[96m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/Paper890/izin/main/permisi | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/Paper890/izin/main/permisi | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Geo Project
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/Paper890/izin/main/permisi | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information | Geo Project
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | Geo Project
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON${NC}"
else
   status_ssh="${RED}🔴${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}ON${NC}"
else
    status_ws_epro="${RED}🔴${NC} "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}ON${NC}"
else
   status_haproxy="${RED}🔴${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}ON${NC}"
else
   status_xray="${RED}🔴${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}ON${NC}"
else
   status_nginx="${RED}🔴${NC} "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}ON${NC}"
else
   status_dropbear="${RED}🔴${NC} "
fi
#####INFOAKUN
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
###########
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########
r="\033[1;31m"  #REDTERANG
clear
clear
echo -e " "
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"  
echo -e " ${COLBG1}                - INFORMASI VPS -                ${NC}   "
echo -e "\033[1;93m└─────────────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"  
echo -e "\033[1;93m│$NC$r ✧$NC ${z}City           $green=$NC $CITY${NC}"
echo -e "\033[1;93m│$NC$r ✧$NC ${z}System OS      $green=$NC $MODEL${NC}"
echo -e "\033[1;93m│$NC$r ✧$NC ${z}Server RAM     $green=$NC $RAM MB $NC"
echo -e "\033[1;93m│$NC$r ✧$NC ${z}Uptime Server  $green=$NC $SERONLINE${NC}"
echo -e "\033[1;93m│$NC$r ✧$NC ${z}Date           $green=$NC $DATEVPS${NC}"
echo -e "\033[1;93m│$NC$r ✧$NC ${z}Time           $green=$NC $TIMEZONE${NC}"
echo -e "\033[1;93m│$NC$r ✧$NC ${z}IP VPS         $green=$NC $MYIP${NC}"
echo -e "\033[1;93m│$NC$r ✧$NC ${z}Domain         $green=$NC $domain${NC}"
echo -e "\033[1;93m└─────────────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"  
echo -e " ${z}  SSH     VMESS     VLESS    TROJAN     SHADOW     "
echo -e " ${z}   $ssh1        $vma         $vla         $trb         $ssa     "
echo -e "\033[1;93m└─────────────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m" 
echo -e "${z} ${NC}$y  SSH$NC : $status_ssh" "      $y NGINX$NC : $status_nginx" "     $y XRAY$NC : $status_xray      $NC${z}$NC" 
echo -e "${z} ${NC}$y  WS-ePRO$NC : $status_ws_epro" "  $y DROPBEAR$NC : $status_dropbear" "  $y HAPROXY$NC : $status_haproxy   $NC${z}$NC" 
echo -e "\033[1;93m└─────────────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m   ${z} 1.$NC $y SSH MANAGER         ${z} 6.$NC $y XRAY ID CUSTOM $NC   "
echo -e "\033[1;93m   ${z} 2.$NC $y VMESS MANAGER       ${z} 7.$NC $y RUNNING    $NC   "
echo -e "\033[1;93m   ${z} 3.$NC $y VLESS MANAGER       ${z} 8.$NC $y BACKUP/RESTORE $NC"
echo -e "\033[1;93m   ${z} 4.$NC $y TROJAN MANAGER      ${z} 9.$NC $y ADD BOT PANEL  $NC "
echo -e "\033[1;93m   ${z} 5.$NC $y SHADOW MANAGER     ${z} 10.$NC $y MENU LAIN  $NC  "           
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"  
echo -e "\033[1;93m│  $NC USER SCRIPT  : $username                          "
echo -e "\033[1;93m│  $NC EXP SCRIPT   : $Exp1                      "           
echo -e "\033[1;93m└─────────────────────────────────────────────────┘\033[0m"
echo -e "                  Version : 2.2.4                                       "
echo -e "               ${RED}━${NC}${gray}━${NC}${Blue}━${NC}${green}━${NC}${grenbo}━${NC}${purple}━${NC}${YELL}━${NC}${RED}━${NC}${gray}━${NC}${Blue}━${NC}${green}━${NC}${grenbo}━${NC}${purple}━${NC}${YELL}━${NC}${RED}━${NC}${gray}━${NC}${Blue}━${NC}${green}━${NC}${grenbo}━${NC}${purple}━${NC}"
echo -e ""

read -p " Select menu : " opt
echo -e " "
case $opt in
1 | 01)
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
clearcache
;;
7 | 07)
clear
run
;;
8 | 08)
clear
menu-backup
;;
9 | 09)
clear
add-bot-panel
;;
10 | 10)
clear
m-setting
;;
esac
