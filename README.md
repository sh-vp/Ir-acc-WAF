#اسکریپت مسدود سازی دسترسی ای پی های خارجی به سرور برای جلوگیری از حملات دیداس ( ایران اکسس ) 

توجه کنید که اگر با ای پی خارج میخواهید به سرور ssh بزنید حتما قبل از نصب اسکریپت پورت ssh رو به 22 تغییر بدید !
-


# ubuntu Quick Run and Install
````
sudo apt update -y && sudo apt upgrade -y && sudo apt install zip iptables ipset -y && wget https://github.com/sh-vp/Ir-acc-WAF/releases/latest/download/ir_rules.zip && unzip ir_rules.zip && chmod +x start.sh && ./start.sh
````

# CentOS & Almalinux Quick Run and Install
````
sudo yum update -y && sudo yum upgrade -y && sudo yum install zip iptables ipset -y && wget https://github.com/sh-vp/Ir-acc-WAF/releases/latest/download/ir_rules.zip && unzip ir_rules.zip && chmod +x start.sh && ./start.sh
````



# Reset Setting To Default

````
cd && chmod +x reset.sh && ./reset.sh

````
