#!/bin/bash
#Color
y='\033[1;33m' #yellow
BGX="\033[42m"
c="\033[96m" #biruterang
z="\033[96m"
p="\033[1;95m" #ungu
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
RED='\033[0;31m'
green='\e[32m'
PURPLE='\e[35m'
cyan='\e[36m'
LRED='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
blue="\033[0;34m"
Blue="\033[36m"
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
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

# // System Information
domain=$(cat /etc/xray/domain)
WKT=$(curl -s ipinfo.io/timezone)
IPVPS=$(curl -s ipv4.icanhazip.com)
tram=$(free -m | awk 'NR==2 {print $2}')
swap=$(free -m | awk 'NR==4 {print $2}')
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
knr=$( uname -r )

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )
# // SSH
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udp1_service=$(systemctl status udp-mini-1 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udp2_service=$(systemctl status udp-mini-2 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udp3_service=$(systemctl status udp-mini-3 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
Iptables=$(systemctl status netfilter-persistent | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
RClocal=$(systemctl status rc-local | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Autorebot=$(systemctl status rc-local | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
UdpSSH=$(systemctl status udp-custom | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')

openssh=$( systemctl status ssh | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $openssh == "running" ]]; then
    status_openssh="${GREEN}Online$NC${c} │$NC"
else
    status_openssh="${RED}Offline${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${GREEN}Online$NC${c} │$NC"
else
    status_ws_epro="${RED}Offline${NC} "
fi

# // Trojan Proxy
ss=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ss == "running" ]]; then
    status_ss="${GREEN}Online$NC${c} │$NC"
else
    status_ss="${RED}Offline${NC} "
fi

# // NGINX
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}Online$NC${c} │$NC"
else
    status_nginx="${RED}Offline${NC} "
fi

# STATUS SERVICE IPTABLES
if [[ $Iptables == "exited" ]]; then
    status_galo="${GREEN}Online$NC${c} │$NC"
else
    status_galo="${RED}Offline${NC}"
fi

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}Online$NC${c} │$NC"
else
   status_ssh="${RED}Offline${NC} "
fi

# STATUS OHP SSH
#if [[ $ohr == "running" ]]; then 
 #  sohr="${GREEN}Online${NC}${NC}"
#else
 #  sohr="${RED}Offline${NC} ${NC}"
#fi

# STATUS SERVICE OPENVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn="${GREEN}Online$NC${c} │$NC"
else
  status_openvpn="${RED}Offline${NC} "
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN}Online$NC${c} │$NC"
else
   status_beruangjatuh="${RED}Offline${NC} ${NC}"
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${GREEN}Online$NC${c} │$NC"
else
   status_haproxy="${RED}Offline${NC} "
fi

# STATUS SERVICE  SQUID 
#if [[ $squid_service == "running" ]]; then 
  # status_squid="${GREEN}Online${NC} ( No Etror )"
#else
  # status_squid="${RED}Offline${NC} "
#fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN}Online$NC${c} │$NC"
else
   status_fail2ban="${RED}Offline${NC} "
fi

# STATUS SERVICE  CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron="${GREEN}Online$NC${c} │$NC"
else
   status_cron="${RED}Offline${NC} "
fi

# STATUS SERVICE  BADVPN 1
if [[ $udp1_service == "running" ]]; then 
   status_udp1="${GREEN}Online$NC${c} │$NC"
else
   status_udp1="${RED}Offline${NC} "
fi

# STATUS SERVICE  BADVPN 2
if [[ $udp2_service == "running" ]]; then 
   status_udp2="${GREEN}Online$NC${c} │$NC"
else
   status_udp2="${RED}Offline${NC} "
fi

# STATUS SERVICE  BADVPN 3
if [[ $udp3_service == "running" ]]; then 
   status_udp3="${GREEN}Online$NC${c} │$NC"
else
   status_udp3="${RED}Offline${NC} "
fi

if [[ $RClocal == "exited" ]]; then
    status_galoo="${GREEN}Online$NC${c} │$NC"
else
    status_galoo="${RED}Offline${NC}"
fi

if [[ $Autorebot == "exited" ]]; then
    status_galooo="${GREEN}Online$NC${c} │$NC"
else
    status_galooo="${RED}Offline${NC}"
fi

# STATUS SERVICE  SSH UDP 
if [[ $UdpSSH == "running" ]]; then 
   status_udp="${GREEN}Online$NC${c} │$NC"
else
   status_udp="${RED}Offline${NC} "
fi

# // Running Function 
clear
echo -e " ${c}╭════════════════════════════════════════════╮$NC"
echo -e " ${c}│$NC$NC\033[41m              Service Information           $NC${c}│$NC"
echo -e " ${c}╰════════════════════════════════════════════╯$NC"
echo -e " ${c}╭════════════════════════════════════════════╮$NC"
echo -e " ${c}│$NC ${p}Service SSH / TUN                $NC $blue=$NC $status_ssh"
echo -e " ${c}│$NC ${p}Service SSH UDP                  $NC $blue=$NC $status_udp"
echo -e " ${c}│$NC ${p}Service OpenVPN                  $NC $blue=$NC $status_openvpn"
echo -e " ${c}│$NC ${p}Service WS ePRO                  $NC $blue=$NC $status_ws_epro"
echo -e " ${c}│$NC ${p}Service BadVPN 7100              $NC $blue=$NC $status_udp1"
echo -e " ${c}│$NC ${p}Service BadVPN 7200              $NC $blue=$NC $status_udp2"
echo -e " ${c}│$NC ${p}Service BadVPN 7300              $NC $blue=$NC $status_udp3"
echo -e " ${c}│$NC ${p}Service Dropbear                 $NC $blue=$NC $status_beruangjatuh"
echo -e " ${c}│$NC ${p}Service Haproxy                  $NC $blue=$NC $status_haproxy"
echo -e " ${c}│$NC ${p}Service Fail2Ban                 $NC $blue=$NC $status_fail2ban"
echo -e " ${c}│$NC ${p}Service Crons                    $NC $blue=$NC $status_fail2ban"
echo -e " ${c}│$NC ${p}Service Nginx Webserver          $NC $blue=$NC $status_nginx"
echo -e " ${c}│$NC ${p}Service Xray Vmess WS TLS        $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Xray Vmess WS Non TLS    $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Xray Vmess gRPC          $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Xray Vless WS TLS        $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Xray Vless WS Non TLS    $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Xray Vless gRPC          $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Xray Trojan WS           $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Xray Trojan gRPC         $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Xray Shadowsocks WS      $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Xray Shadowsocks gRPC    $NC $blue=$NC $status_ss"
echo -e " ${c}│$NC ${p}Service Iptables                 $NC $blue=$NC $status_galo"
echo -e " ${c}│$NC ${p}Service RClocal                  $NC $blue=$NC $status_galoo"
echo -e " ${c}│$NC ${p}Service Autoreboot               $NC $blue=$NC $status_galooo"
echo -e " ${c}╰════════════════════════════════════════════╯$NC"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
