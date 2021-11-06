!#/bin/bash 

export home=/home/ec2-user/
export projectbname=jumia_phone_validator
export spring.datasource.url=jdbc:postgresql://localhost:5432/validator_backend
export spring.datasource.username=root
export spring.datasource.password=


################# ssh config 
!#/bin/bash 
sudo sed -i "s/PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config 
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config

sudo systemctl reload sshd 

################# install docker 
sudo yum install docker -y ; sudo systemctl enable docker.service ; sudo systemctl start docker.service ; sudo systemctl status docker.service 

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose ; sudo chmod +x /usr/bin/docker-compose

login docker 
sudo docker login -u w491994 -p Vg67822VhiTt



##########################  nodejs 
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo yum install nodejs -y

cd $home/$projectbname/validator-frontend/ &&  npm i && npm run build && sudo docker build -t  w491994/validator-frontend-image:front . &&  sudo docker push w491994/validator-frontend-image:front


################################## restore database 
pg_restore -h database-3.ceg9ua9ljrsl.eu-central-1.rds.amazonaws.com  -p 5432 -U postgress -f  sample.sql

########################################## mavan
sudo mkdir /opt/mavan/ && cd /opt/mavan &&  sudo wget https://archive.apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz

echo "M2_HOME=/opt/mavan/apache-maven-3.6.1/" >> .bash_profile
echo "M2=$M2_HOME/bin" >> .bash_profile
echo "PATH=$PATH:$HOME:$JAVA_HOME:$M2_HOME:$M2:$HOME/bin" >> .bash_profile

source ~/.bash_profile

cd $home/$projectbname/validator-backend/ &&  mvn clean install &&  sudo docker build -t  w491994/validator-frontend-image:backend . &&  sudo docker push w491994/validator-frontend-image:backend

#################################
cd $home/$projectbname/ && sudo docker-compose up

