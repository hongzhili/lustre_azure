sudo mkdir /lustre-mdt0
echo "/dev/sdc                                /lustre-mdt0               lustre  defaults,_netdev        0 0" | sudo tee -a /etc/fstab
sudo mount /dev/sdc