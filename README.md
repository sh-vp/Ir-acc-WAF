# اسکریپت مسدود سازی دسترسی ای پی های خارجی به سرور برای جلوگیری از حملات دیداس ( ایران اکسس ) 

# توجه کنید که اگر با ای پی خارج میخواهید به سرور ssh بزنید ختما قبل از نصب اسکریپت پورت ssh رو به 22 تغییر بدید !
-------------------------------------------

# ubuntu Requirement
````
sudo apt update -y
sudo apt install git zip iptables ipset -y
````

# CentOS & Almalinux Requirement
````
sudo yum update -y
sudo yum install git zip iptables ipset -y
````

# Install Script

````
git clone https://github.com/sh-vp/Ir-acc-WAF.git

cd Ir-acc-WAF

unzip ir_rules.zip
````

# Run Script

````
cd ~/Ir-acc-WAF && chmod +x start.sh && ./start.sh

````

# Reset Setting To Default

````
cd ~/Ir-acc-WAF && chmod +x reset.sh && ./reset.sh

````
