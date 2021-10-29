firewall-cmd --add-service=http --permanent
firewall-cmd --reload
setenforce 0
mkdir /var/www
hostname > /var/www/index.html
hostname > /var/www/hostname.txt
uptime >> /var/www/index.html
cd /var/www
chmod a+x /etc/rc.d/rc.local
sed -i -e '$i \cat /var/www/hostname.txt > /var/www/index.html && uptime >> /var/www/index.html\n' /etc/rc.d/rc.local
sed -i -e '$i \cd /var/www && python -m SimpleHTTPServer 80 &\n' /etc/rc.d/rc.local
python -m SimpleHTTPServer 80 &
