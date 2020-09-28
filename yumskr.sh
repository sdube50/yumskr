#!/bin/bash
echo "Enter the path of Packages ex: /root/skr/7.6/Packages"
read Path
cd $Path
sleep 3
rpm -ivh deltarpm-3.6-3.el7.x86_64.rpm
rpm -ivh python-deltarpm-3.6-3.el7.x86_64.rpm
rpm -ivh libxml2-python-2.9.1-6.el7_2.3.x86_64.rpm
sleep 4
mkdir /etc/yum.repos.d/local.repo
cd /etc/yum.repos.d/
sleep 2
mv CentOS-Base.repo CentOS-Base.repo.old
mv CentOS-Debuginfo.repo CentOS-Debuginfo.repo.old
mv CentOS-Media.repo CentOS-Media.repo.old
mv CentOS-Vault.repo CentOS-Vault.repo.old
mv CentOS-CR.repo CentOS-CR.repo.old
mv CentOS-fasttrack.repo CentOS-fasttrack.repo.old
mv CentOS-Sources.repo CentOS-Sources.repo.old
sleep 4
echo "[localrepo]
name=local repo
baseurl=file://$Path
gpgcheck=0
enabled=1" >> local.repo
sleep 4
yum clean all
sleep 2
createrepo $Path
sleep 3
yum update
sleep 2
printf "Repo is created"
sleep 1
yum list
