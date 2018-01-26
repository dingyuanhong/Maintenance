firewall-cmd --list-all
firewall-cmd --list-ports
#
firewall-cmd --add-port=80/tcp --permanent
#weblive
firewall-cmd --add-port=81/tcp --permanent
#evoplayer
firewall-cmd --add-port=82/tcp --permanent
#slam_web
firewall-cmd --add-port=88/tcp --permanent
#ThinkCMF
firewall-cmd --add-port=90/tcp --permanent
#share
firewall-cmd --add-port=98/tcp --permanent
#operation
firewall-cmd --add-port=99/tcp --permanent
#upgrade
firewall-cmd --add-port=100/tcp --permanent
#websvn
firewall-cmd --add-port=100/tcp --permanent

firewall-cmd --reload