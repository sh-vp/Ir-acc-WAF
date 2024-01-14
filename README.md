اسکریپت مسدود سازی دسترسی ای پی های خارجی به سرور برای جلوگیری از حملات دیداس ( ایران اکسس ) 

#Requirement

````
#ubuntu

sudo apt update -y
sudo apt install git zip iptables ipset -y
````
````
#CentOS & Almalinux

sudo yum update -y
sudo yum install git zip iptables ipset -y
````
Run & Install Script
````

git clone https://github.com/sh-vp/Ir-acc-WAF.git

cd Ir-acc-WAF

unzip ir_rules.zip

cd ir_rules

chmod +x start.sh && ./start.sh
````

#Reset Setting To Default

````
cd ~/Ir-acc-WAF/ir_rules

chmod +x reset.sh && ./reset.sh

````
