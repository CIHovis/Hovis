####################################################################
#                                                                  #
#                change this to new hostname and IP                #
#                                                                  #
####################################################################
#                                                                  #
echo "192.168.1.150 hmaster.netbuilder.private puppet" >> /etc/hosts
#                                                                  #
####################################################################


curl -k https://puppet:8140/packages/current/install.bash | sudo bash
