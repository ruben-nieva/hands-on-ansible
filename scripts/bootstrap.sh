# Install Ansible on Ubuntu
#

#Comment out localhost
sed -i "0,/${HOSTNAME}/d" /etc/hosts

# Adding host to /etc/hosts
echo "##" | sudo tee --append /etc/hosts 2> /dev/null
echo "192.168.33.10	control" | sudo tee --append /etc/hosts 2> /dev/null
echo "192.168.33.20	web" | sudo tee --append /etc/hosts 2> /dev/null
echo "192.168.33.30	db" | sudo tee --append /etc/hosts 2> /dev/null
echo "192.168.33.40	labipa" | sudo tee --append /etc/hosts 2> /dev/null


# Installing Jfrog Artifactory
echo "Installing Ansible......"
sudo apt-get update
sudo sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible python-netaddr -y

#End Script
