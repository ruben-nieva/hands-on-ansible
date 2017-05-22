# Install Ansible on Ubuntu
#

#Comment out localhost
#sed -i "0,/${HOSTNAME}/d" /etc/hosts

# Adding host to /etc/hosts
echo "192.168.33.10	control" | sudo tee --append /etc/hosts 2> /dev/null
echo "192.168.33.20	web" | sudo tee --append /etc/hosts 2> /dev/null
echo "192.168.33.30	db" | sudo tee --append /etc/hosts 2> /dev/null
echo "192.168.33.40	labipa" | sudo tee --append /etc/hosts 2> /dev/null


#
# Check if PasswordAuthentication is configured to Yes in /etc/ssh/sshd_config
# On centos/7 it is disabled by default

# Installing Jfrog Artifactory
echo "Installing Ansible......"
sudo yum -y install epel-release
#sudo yum update repolist
sudo yum -y install ansible

#End Script
