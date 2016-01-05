sudo su

####################################################################
#                                                                  #
#                change this to new hostname and IP                #
#                                                                  #
####################################################################
#                                                                  #
echo "192.168.1.150 hmaster.netbuilder.private puppet" >> /etc/hosts
#                                                                  #
####################################################################

cd /vagrant
#wget http://192.168.1.6:8080/downloads/puppet-enterprise-2015.2.0-ubuntu-14.04-amd64.tar.gz | grep "puppet-enterprise"
tar zxf puppet-enterprise-*.tar.gz | grep "puppet-enterprise"
cd puppet-enterprise-*
./puppet-enterprise-installer -a /vagrant/enterpriseAnswers.txt
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 4433 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8140 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 61613 -j ACCEPT