#!/bin/bash
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
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
# Getting
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
ipsaya=$(wget -qO- ipinfo.io/ip)
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
export TIME="10"
IP=$(curl -sS ipv4.icanhazip.com)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
domain=$(cat /etc/xray/domain)
clear
echo -e " SSH Ovpn Account           "
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m"
read -p " Username : " Login
read -p " Password : " Pass
read -p " Limit IP     : " limit
read -p " Limit Quota : " Quota
read -p " Expired (Days) : " masaaktif
#limitip
if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/ssh/ip
echo -e "$iplimit" > /etc/kyt/limit/ssh/ip/$Login
else
echo > /dev/null
fi
clear
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`

if [ ! -e /etc/ssh ]; then
  mkdir -p /etc/ssh
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${Login}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^#ssh#" | grep -w "${Login}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${Login}\b/d" /etc/ssh/.ssh.db
fi
echo "#ssh# ${Login} ${Pass} ${Quota} ${iplimit} ${expe}" >>/etc/ssh/.ssh.db
clear

cat > /var/www/html/ssh-$Login.txt <<-END

━━━━━━━━━━━━━━━━━
Username         : $Login
Password         : $Pass
━━━━━━━━━━━━━━━━━
IP               : $IP
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH UDP     : 1-65535
Port SSH WS      : 80, 8080, 8081-9999
Port SSH SSL WS  : 443
Port SSL/TLS     : 400-900
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
BadVPN UDP       : 7100, 7300, 7300
━━━━━━━━━━━━━━━━━
Aktif Selama     : $masaaktif Hari
Dibuat Pada      : $tnggl
Berakhir Pada    : $expe
━━━━━━━━━━━━━━━━━
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
━━━━━━━━━━━━━━━━━
OVPN Download : https://$domain:81/
━━━━━━━━━━━━━━━━━

END
nama_file="$Login.txt"

echo ""
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" >> "$nama_file"
echo -e " SSH OVPN Account    " >> "$nama_file"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" >> "$nama_file"
echo -e "Username         : $Login" >> "$nama_file"
echo -e "Password         : $Pass" >> "$nama_file"
echo -e "Limit Quota      : $Quota GB" >> "$nama_file"
echo -e "Limit Ip          : ${iplimit} User" >> "$nama_file"
echo -e "IP               : $IP" >> "$nama_file"
echo -e "Host             : $domain" >> "$nama_file"
echo -e "Port OpenSSH     : 443, 80, 22" >> "$nama_file"
echo -e "Port SSH UDP     : 1-65535" >> "$nama_file"
echo -e "Port Dropbear    : 443, 109" >> "$nama_file"
echo -e "Port SSH WS      : 80, 8080, 8081-9999" >> "$nama_file"
echo -e "Port SSH SSL WS  : 443" >> "$nama_file"
echo -e "Port SSL/TLS     : 400-900" >> "$nama_file"
echo -e "Port OVPN WS SSL : 443" >> "$nama_file"
echo -e "Port OVPN SSL    : 443" >> "$nama_file"
echo -e "Port OVPN TCP    : 443, 1194" >> "$nama_file"
echo -e "Port OVPN UDP    : 2200" >> "$nama_file"
echo -e "BadVPN UDP       : 7100, 7300, 7300" >> "$nama_file"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" >> "$nama_file"
echo -e "Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]" >> "$nama_file"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" >> "$nama_file"
echo -e "OVPN Download    : https://$domain:81/" >> "$nama_file"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" >> "$nama_file"
echo -e "Save Link Account: https://$domain:81/ssh-$Login.txt" >> "$nama_file"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" >> "$nama_file"
echo -e "Aktif Selama     : $masaaktif Hari" >> "$nama_file"
echo -e "Dibuat Pada      : $tnggl" >> "$nama_file"
echo -e "Berakhir Pada    : $expe" >> "$nama_file"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" >> "$nama_file"

clear
echo ""
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m"
echo -e " SSH OVPN Account    "
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Username         : $Login"
echo -e "Password         : $Pass"
echo -e "Limit Quota      : $Quota GB"
echo -e "Limit Ip          : ${iplimit} User"
echo -e "IP               : $IP"
echo -e "Host             : $domain"
echo -e "Port OpenSSH     : 443, 80, 22"
echo -e "Port SSH UDP     : 1-65535"
echo -e "Port Dropbear    : 443, 109"
echo -e "Port SSH WS      : 80, 8080, 8081-9999"
echo -e "Port SSH SSL WS  : 443"
echo -e "Port SSL/TLS     : 400-900"
echo -e "Port OVPN WS SSL : 443"
echo -e "Port OVPN SSL    : 443"
echo -e "Port OVPN TCP    : 443, 1194"
echo -e "Port OVPN UDP    : 2200"
echo -e "BadVPN UDP       : 7100, 7300, 7300"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m"
echo -e "OVPN Download    : https://$domain:81/"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Save Link Account: https://$domain:81/ssh-$Login.txt"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m"
