#!/bin/bash

if [[ $USER != "root" ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
#MYIP=$(wget -qO- ipv4.icanhazip.com);

# get the VPS IP
#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`

#MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

#vps="zvur";
vps="aneka";

#if [[ $vps = "zvur" ]]; then
	#source="http://"
#else
	source="https://raw.githubusercontent.com/yarzardhiyit/d8-x64"
#fi

# go to root
cd

# download script
cd
wget -O /usr/bin/benchmark $source/master/benchmark.sh
wget -O /usr/bin/speedtest $source/master/speedtest_cli.py
wget -O /usr/bin/ps-mem $source/master/ps_mem.py
wget -O /usr/bin/dropmon $source/master/dropmon.sh
wget -O /usr/bin/menu $source/master/menu.sh
wget -O /usr/bin/user-active-list $source/master/user-active-list.sh
wget -O /usr/bin/user-add $source/master/user-add.sh
wget -O /usr/bin/user-add-pptp $source/master/user-add-pptp.sh
wget -O /usr/bin/user-del $source/master/user-del.sh
wget -O /usr/bin/disable-user-expire $source/master/disable-user-expire.sh
wget -O /usr/bin/delete-user-expire $source/master/delete-user-expire.sh
wget -O /usr/bin/banned-user $source/master/banned-user.sh
wget -O /usr/bin/unbanned-user $source/master/unbanned-user.sh
wget -O /usr/bin/user-expire-list $source/master/user-expire-list.sh
wget -O /usr/bin/user-gen $source/master/user-gen.sh
wget -O /usr/bin/userlimit.sh $source/master/userlimit.sh
wget -O /usr/bin/userlimitssh.sh $source/master/userlimitssh.sh
wget -O /usr/bin/user-list $source/master/user-list.sh
wget -O /usr/bin/user-login $source/master/user-login.sh
wget -O /usr/bin/user-pass $source/master/user-pass.sh
wget -O /usr/bin/user-renew $source/master/user-renew.sh
wget -O /usr/bin/clearcache.sh $source/master/clearcache.sh
wget -O /usr/bin/bannermenu $source/master/bannermenu
wget -O /usr/bin/menu-update-script-vps.sh $source/master/menu-update-script-vps.sh
#cd

#echo "*/30 * * * * root service dropbear restart" > /etc/cron.d/dropbear
#echo "00 23 * * * root /usr/bin/disable-user-expire" > /etc/cron.d/disable-user-expire
#echo "0 */12 * * * root /sbin/reboot" > /etc/cron.d/reboot
##echo "00 01 * * * root echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a" > /etc/cron.d/clearcacheram3swap
#echo "0 */1 * * * root /usr/bin/clearcache.sh" > /etc/cron.d/clearcache1

cd
chmod +x /usr/bin/benchmark
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/ps-mem
#chmod +x /usr/bin/autokill
chmod +x /usr/bin/dropmon
chmod +x /usr/bin/menu
chmod +x /usr/bin/user-active-list
chmod +x /usr/bin/user-add
chmod +x /usr/bin/user-add-pptp
chmod +x /usr/bin/user-del
chmod +x /usr/bin/disable-user-expire
chmod +x /usr/bin/delete-user-expire
chmod +x /usr/bin/banned-user
chmod +x /usr/bin/unbanned-user
chmod +x /usr/bin/user-expire-list
chmod +x /usr/bin/user-gen
chmod +x /usr/bin/userlimit.sh
chmod +x /usr/bin/userlimitssh.sh
chmod +x /usr/bin/user-list
chmod +x /usr/bin/user-login
chmod +x /usr/bin/user-pass
chmod +x /usr/bin/user-renew
chmod +x /usr/bin/clearcache.sh
chmod +x /usr/bin/bannermenu
chmod +x /usr/bin/menu-update-script-vps.sh
cd




#text gambar
apt-get install boxes

# text pelangi
sudo apt-get install ruby
sudo gem install lolcat

# text warna
cd
rm -rf /root/.bashrc
wget -O /root/.bashrc $source/master/.bashrc
