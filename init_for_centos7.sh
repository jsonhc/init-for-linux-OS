# base centos7 mini

# install require package
yum install vim net-tools wget tree lrzsz ntpdate lsof lftp

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


# add aliyun ntp server
ntp1.aliyun.com
ntp2.aliyun.com
ntp3.aliyun.com
ntp4.aliyun.com
ntp5.aliyun.com
ntp6.aliyun.com
ntp7.aliyun.com

#backup CentOS-Base.repo
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

# install epel repo
cd /etc/yum.repos.d
wget http://mirrors.neusoft.edu.cn/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-6.noarch.rpm

# install aliyun repo
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
