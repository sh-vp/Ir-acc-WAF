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
        yum -y update && yum install -y -q zip iptables ipset -y
        ;;
    *)
        apt-get update && apt install -y -q zip iptables ipset -y
        ;;
    esac
    
rm /usr/local/ir-waf -rf
rm /usr/bin/ir-waf -rf
mkdir /usr/local/ir-waf
wget --no-check-certificate -O /usr/local/ir-waf/ir_rules.zip https://github.com/sh-vp/Ir-acc-WAF/releases/latest/download/ir_rules.zip
unzip /usr/local/ir-waf/ir_rules.zip
cp /usr/local/ir-waf/ir-waf.sh /usr/bin/ir-waf
chmod +x /usr/local/ir-waf/ir-waf.sh
chmod +x /usr/bin/ir-waf
sed -i -e 's/\r$//' /usr/bin/ir-waf