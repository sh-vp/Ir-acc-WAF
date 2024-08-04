#!/bin/bash

# check root
[[ $EUID -ne 0 ]] && echo -e "${red}Fatal error: ${plain} Please run this script with root privilege \n " && exit 1

# Check OS and set release variable
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    release=$ID
elif [[ -f /usr/lib/os-release ]]; then
    source /usr/lib/os-release
    release=$ID
else
    echo "Failed to check the system OS, please contact the author!" >&2
    exit 1
fi
echo "The OS release is: $release"

    case "${release}" in
    centos | almalinux | rocky)
        yum -y update && yum install zip iptables ipset -y -q
        ;;
    *)
        apt update -y && apt install zip iptables ipset -y -q
        ;;
    esac
    
rm /root/start.sh -rf
rm /root/reset.sh -rf
rm /root/ip.txt -rf
rm /root/ir_rules.zip -rf    
rm /usr/local/ir-waf/ir-waf.sh -rf
rm /usr/local/ir-waf/update.sh -rf
rm /usr/local/ir-waf/iran.txt -rf
rm /usr/local/ir-waf/cloudflare.txt -rf
rm /usr/bin/ir-waf -rf
mkdir /usr/local/ir-waf
wget --no-check-certificate -O /usr/local/ir-waf/ir_rules.zip https://github.com/sh-vp/Ir-acc-WAF/releases/latest/download/ir_rules.zip
if [[ ! -f "/usr/local/ir-waf/conf.txt" ]]; then
unzip -o /usr/local/ir-waf/ir_rules.zip -d /usr/local/ir-waf
else
unzip -o /usr/local/ir-waf/ir_rules.zip -d /usr/local/ir-waf -x conf.txt
fi
rm /usr/local/ir-waf/ir_rules.zip -rf
ln -s  /usr/local/ir-waf/ir-waf.sh /usr/bin/ir-waf
chmod +x /usr/local/ir-waf/ir-waf.sh
chmod +x /usr/local/ir-waf/update.sh
chmod +x /usr/bin/ir-waf
sed -i -e 's/\r$//' /usr/bin/ir-waf
/usr/local/ir-waf/ir-waf.sh
