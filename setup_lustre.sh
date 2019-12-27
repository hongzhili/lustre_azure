cat <<EOM >/etc/yum.repos.d/lustre.repo 
[lustre-server]
name=CentOS-$releasever - Lustre
baseurl=https://downloads.hpdd.intel.com/public/lustre/latest-feature-release/el7/server/
gpgcheck=0

[e2fsprogs]
name=CentOS-$releasever - Ldiskfs
baseurl=https://downloads.hpdd.intel.com/public/e2fsprogs/latest/el7/
gpgcheck=0

[lustre-client]
name=CentOS-$releasever - Lustre
baseurl=https://downloads.hpdd.intel.com/public/lustre/latest-feature-release/el7/client/
gpgcheck=0
EOM




yum install -y e2fsprogs
mkdir /tmp/lustre
wget -O /tmp/lustre/kernel-3.10.0-1062.1.1.el7_lustre.x86_64.rpm https://downloads.whamcloud.com/public/lustre/lustre-2.13.0/el7.7.1908/server/RPMS/x86_64/kernel-3.10.0-1062.1.1.el7_lustre.x86_64.rpm
wget -O /tmp/lustre/lustre-2.13.0-1.el7.x86_64.rpm https://downloads.whamcloud.com/public/lustre/lustre-2.13.0/el7.7.1908/server/RPMS/x86_64/lustre-2.13.0-1.el7.x86_64.rpm
wget -O /tmp/lustre/kmod-lustre-2.13.0-1.el7.x86_64.rpm https://downloads.whamcloud.com/public/lustre/lustre-2.13.0/el7.7.1908/server/RPMS/x86_64/kmod-lustre-2.13.0-1.el7.x86_64.rpm
wget -O /tmp/lustre/kmod-lustre-osd-ldiskfs-2.13.0-1.el7.x86_64.rpm https://downloads.whamcloud.com/public/lustre/lustre-2.13.0/el7.7.1908/server/RPMS/x86_64/kmod-lustre-osd-ldiskfs-2.13.0-1.el7.x86_64.rpm
wget -O /tmp/lustre/lustre-osd-ldiskfs-mount-2.13.0-1.el7.x86_64.rpm https://downloads.whamcloud.com/public/lustre/lustre-2.13.0/el7.7.1908/server/RPMS/x86_64/lustre-osd-ldiskfs-mount-2.13.0-1.el7.x86_64.rpm
wget -O /tmp/lustre/lustre-tests-2.13.0-1.el7.x86_64.rpm https://downloads.whamcloud.com/public/lustre/lustre-2.13.0/el7.7.1908/server/RPMS/x86_64/lustre-tests-2.13.0-1.el7.x86_64.rpm

yum install -y /tmp/lustre/kernel-3.10.0-1062.1.1.el7_lustre.x86_64.rpm
yum install -y /tmp/lustre/kmod*
yum install -y /tmp/lustre/lustre*


