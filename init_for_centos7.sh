# base centos7 mini

# install require package
yum install vim net-tools wget tree lrzsz ntpdate lsof lftp -y

# stop firewalld server
systemctl stop firewalld.service
systemctl disable firewalld.service

# stop postfix server
systemctl stop postfix.service
systemctl disable postfix.service

# close selinux
setenforce 0
sed -i 's#SELINUX=enforcing#SELINUX=disabled#g' /etc/sysconfig/selinux 

# ntpdate time server
cd /var/spool/cron/
echo "*/1 * * * * /usr/sbin/ntpdate ntp1.aliyun.com > /dev/null" >> root


#backup CentOS-Base.repo
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

# install epel repo
cd /etc/yum.repos.d
wget https://mirrors.ustc.edu.cn/epel//epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm

# install aliyun repo
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

# yum cache
yum clean all
yum makecache

# 163的源
http://mirrors.163.com/.help/centos.html
wget -O CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
