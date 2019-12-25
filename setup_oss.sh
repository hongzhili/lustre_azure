mkfs.lustre --fsname=lustrefs --mgsnode=192.168.100.1@tcp --ost --index=12 /dev/sdc
mkfs.lustre --fsname=lustrefs --mgsnode=192.168.100.1@tcp --ost --index=13 /dev/sdd
mkfs.lustre --fsname=lustrefs --mgsnode=192.168.100.1@tcp --ost --index=14 /dev/sde

mkdir /lustre-oss01
mkdir /lustre-oss02
mkdir /lustre-oss03

echo "/dev/sdc                                /lustre-oss01               lustre  defaults,_netdev        0 0" | tee -a /etc/fstab
echo "/dev/sdd                                /lustre-oss02               lustre  defaults,_netdev        0 0" | tee -a /etc/fstab
echo "/dev/sde                                /lustre-oss03               lustre  defaults,_netdev        0 0" | tee -a /etc/fstab

mount /dev/sdc
mount /dev/sdd
mount /dev/sde
