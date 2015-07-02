#!/bin/bash -eux
# These were only needed for building VMware/Virtualbox extensions:
yum -y remove gcc cpp kernel-devel kernel-headers perl
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

rm -Rf /opt/oracle/install
rm -Rf /opt/oracle/WebCenterSites_11.1.1.8.0
rm -Rf /tmp/Disk1
rm -Rf /tmp/installer.sh
rm -Rf /tmp/set_listener.sql
rm -Rf /tmp/packer-provisioner-ansible-local
rm -Rf /opt/apache-tomcat-7.0.62.tar.gz

# clean up redhat interface persistence
rm -f /etc/udev/rules.d/70-persistent-net.rules

for ndev in $(ls /etc/sysconfig/network-scripts/ifcfg-*); do
  if [ "$(basename ${ndev})" != "ifcfg-lo" ]; then
    sed -i '/^HWADDR/d' ${ndev}
    sed -i '/^UUID/d' ${ndev}
  fi
done
