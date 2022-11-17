# Illegal selling and redistribution of this script is strictly prohibite
# Please respect author's Property
# Binigay sainyo ng libre, ipamahagi nyo rin ng libre.
#
#

# Install AutoScript
function ssh() {
    rm -f DebianVPS* && wget -q 'https://raw.githubusercontent.com/Bonveio/BonvScripts/master/DebianVPS-Installer' && chmod +x DebianVPS-Installer && ./DebianVPS-Installer 
    rm -f /etc/banner
    wget -qO /etc/banner https://raw.githubusercontent.com/bannerpy/Files/main/mcbanner
    dos2unix -q /etc/banner
    service ssh restart
    service sshd restart
    service dropbear restart
}
ssh



function service() {
# Getting Proxy Template
 mkdir /etc/microssh
wget -q -O /etc/microssh/micro1 https://raw.githubusercontent.com/Senpaiconfig/microsshpanel/main/80
wget -q -O /etc/microssh/micro2 https://raw.githubusercontent.com/Senpaiconfig/microsshpanel/main/8043
wget -q -O /etc/microssh/micro3 https://raw.githubusercontent.com/Senpaiconfig/microsshpanel/main/8243
wget -q -O /etc/microssh/micro4 https://raw.githubusercontent.com/Senpaiconfig/microsshpanel/main/8280
wget -q -O /etc/microssh/micro5 https://raw.githubusercontent.com/Senpaiconfig/microsshpanel/main/8443
wget -q -O /etc/microssh/micro6 https://raw.githubusercontent.com/Senpaiconfig/microsshpanel/main/9443
chmod +x /etc/microssh*
}
service

function wsport1() {
# Installing Service
cat << END1 > /etc/systemd/system/microssh1.service 
[Unit]
Description=PORT 80
Documentation=https://google.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/microssh/micro1
Restart=on-failure

[Install]
WantedBy=multi-user.target
END1

cat << END2 > /etc/systemd/system/microssh2.service 
[Unit]
Description=PORT 80
Documentation=https://google.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/microssh/micro2
Restart=on-failure

[Install]
WantedBy=multi-user.target
END2

cat << END3 > /etc/systemd/system/microssh3.service 
[Unit]
Description=PORT 80
Documentation=https://google.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/microssh/micro3
Restart=on-failure

[Install]
WantedBy=multi-user.target
END3

cat << END4 > /etc/systemd/system/microssh4.service 
[Unit]
Description=PORT 80
Documentation=https://google.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/microssh/micro4
Restart=on-failure

[Install]
WantedBy=multi-user.target
END4

cat << END5 > /etc/systemd/system/microssh5.service 
[Unit]
Description=PORT 80
Documentation=https://google.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/microssh/micro5
Restart=on-failure

[Install]
WantedBy=multi-user.target
END5

cat << END6 > /etc/systemd/system/microssh6.service 
[Unit]
Description=PORT 80
Documentation=https://google.com
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/microssh/micro6
Restart=on-failure

[Install]
WantedBy=multi-user.target
END6


}
wsport1







function setting() {
sed -i "/DEFAULT_HOST = '127.0.0.1:443'/c\DEFAULT_HOST = '127.0.0.1:550'" /etc/microssh/micro1
sed -i "/DEFAULT_HOST = '127.0.0.1:443'/c\DEFAULT_HOST = '127.0.0.1:550'" /etc/microssh/micro2
sed -i "/DEFAULT_HOST = '127.0.0.1:443'/c\DEFAULT_HOST = '127.0.0.1:550'" /etc/microssh/micro3
sed -i "/DEFAULT_HOST = '127.0.0.1:443'/c\DEFAULT_HOST = '127.0.0.1:550'" /etc/microssh/micro4
sed -i "/DEFAULT_HOST = '127.0.0.1:443'/c\DEFAULT_HOST = '127.0.0.1:550'" /etc/microssh/micro5
sed -i "/DEFAULT_HOST = '127.0.0.1:443'/c\DEFAULT_HOST = '127.0.0.1:550'" /etc/microssh/micro6

systemctl daemon-reload
systemctl enable microssh1
systemctl restart microssh1
systemctl enable microssh2
systemctl restart microssh2
systemctl enable microssh3
systemctl restart microssh3
systemctl enable microssh4
systemctl restart microssh4
systemctl enable microssh5
systemctl restart microssh5
systemctl enable microssh6
systemctl restart microssh6
}
setting





function antitorrent() {
iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
iptables -A INPUT -f -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -m string --string "BitTorrent" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "BitTorrent protocol" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "peer_id=" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string ".torrent" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "announce.php?passkey=" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "torrent" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "announce" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "info_hash" --algo bm --to 65535 -j DROP
iptables -A INPUT -m string --string "peer_id" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "BitTorrent" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "BitTorrent protocol" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "bittorrent-announce" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "announce.php?passkey=" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "find_node" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "info_hash" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "get_peers" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "announce" --algo kmp --to 65535 -j DROP
iptables -A INPUT -m string --string "announce_peers" --algo kmp --to 65535 -j DROP
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -I OUTPUT -p tcp --dport 1723 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 6881:6889 -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -p tcp --dport 6881:6889 -j DROP
iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "peer_id=" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string ".torrent" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j LOGDROP iptables -D FORWARD -m string --algo bm --string "torrent" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "announce" -j LOGDROP
iptables -D FORWARD -m string --algo bm --string "info_hash" -j LOGDROP
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j LOGDROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j LOGDROP
iptables -A FORWARD -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -A FORWARD -p udp -m string --algo bm --string "tracker" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -A INPUT -p udp -m string --algo bm --string "tracker" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -I INPUT -p udp -m string --algo bm --string "tracker" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -D INPUT -p udp -m string --algo bm --string "tracker" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "peer_id=" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string ".torrent" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "torrent" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "announce" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "info_hash" -j DROP
iptables -I OUTPUT -p udp -m string --algo bm --string "tracker" -j DROP
iptables -D INPUT -m string --algo bm --string "BitTorrent" -j DROP
iptables -D INPUT -m string --algo bm --string "BitTorrent protocol" -j DROP iptables -D INPUT -m string --algo bm --string "peer_id=" -j DROP
iptables -D INPUT -m string --algo bm --string ".torrent" -j DROP
iptables -D INPUT -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -D INPUT -m string --algo bm --string "torrent" -j DROP
iptables -D INPUT -m string --algo bm --string "announce" -j DROP
iptables -D INPUT -m string --algo bm --string "info_hash" -j DROP
iptables -D INPUT -m string --algo bm --string "tracker" -j DROP
iptables -D OUTPUT -m string --algo bm --string "BitTorrent" -j DROP
iptables -D OUTPUT -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -D OUTPUT -m string --algo bm --string "peer_id=" -j DROP
iptables -D OUTPUT -m string --algo bm --string ".torrent" -j DROP
iptables -D OUTPUT -m string --algo bm --string "announce.php?passkey=" -j DROP iptables -D OUTPUT -m string --algo bm --string "torrent" -j DROP
iptables -D OUTPUT -m string --algo bm --string "announce" -j DROP
iptables -D OUTPUT -m string --algo bm --string "info_hash" -j DROP
iptables -D OUTPUT -m string --algo bm --string "tracker" -j DROP
iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP iptables -D FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -D FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP iptables -D FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -D FORWARD -m string --algo bm --string "announce" -j DROP
iptables -D FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables -D FORWARD -m string --algo bm --string "tracker" -j DROP
iptables-save
}
antitorrent



function logo() {
sed -i "s|https://openvpn.net/wp-content/uploads/openvpn.jpg|https://github.com/Senpaiconfig/microsshpanel/raw/main/microssh-ovpn-banner.jpg|g" /var/www/openvpn/index.html && service nginx restart
}
logo


function remove() {
echo "" > .bash_history 
history -c
echo '' > /var/log/syslog
}
remove

clear

rm /root/.bash_history
echo 'UTUT MU' > /root/.bash_history

echo "THIS SCRIPT IS NOT FOR SALE"
echo "MICROSSH AUTO SCRIPT "
echo "WEBSOCKET PORT 80, 8280, 8043, 8243, 8443, 9443"
echo "ANTI TORRENT INSTALLED"
echo "MICROSSH.COM"
