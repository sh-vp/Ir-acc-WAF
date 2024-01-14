#Run & Install (Ubuntu OS)

```` 
sudo apt update -y

sudo apt install git zip iptables ipset -y

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
