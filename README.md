#اسکریپت مسدود سازی دسترسی ای پی های خارجی به سرور برای جلوگیری از حملات دیداس خارجی ( ایران اکسس ) 




# Ubuntu Quick Run and Install OR Update
````
rm -rf start.sh reset.sh ip.txt ir_rules.zip && sudo apt update -y && sudo apt upgrade -y && sudo apt install zip iptables ipset -y && wget https://github.com/sh-vp/Ir-acc-WAF/releases/latest/download/ir_rules.zip && unzip ir_rules.zip && chmod +x start.sh && ./start.sh
````

 ###################################################
  
# CentOS & Almalinux Quick Run and Install OR Update
````
rm -rf start.sh reset.sh ip.txt ir_rules.zip && sudo yum update -y && sudo yum upgrade -y && sudo yum install zip iptables ipset -y && wget https://github.com/sh-vp/Ir-acc-WAF/releases/latest/download/ir_rules.zip && unzip ir_rules.zip && chmod +x start.sh && ./start.sh
````
