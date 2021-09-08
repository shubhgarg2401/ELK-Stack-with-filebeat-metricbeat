#Refer "New App Server Config.xlsx" for outline of steps

#Add history to all commands run
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >>~/.bash_profile && source ~/.bash_profile

# install deltarpm support
sudo yum install deltarpm -y

#Yum update
sudo yum update -y

# Change timezone
cd /etc && sudo ln -sf /usr/share/zoneinfo/Asia/Calcutta localtime && cd

sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

#Create a file called elasticsearch.repo in the /etc/yum.repos.d/ directory for RedHat based distributions
sudo nano /etc/yum.repos.d/elk.repo

[elasticsearch]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md



#install docker
sudo amazon-linux-extras install docker=stable -y

#install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
