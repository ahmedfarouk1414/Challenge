##  preper challenge

- install terafrom and ansible 
- create private key and private key that will attach to ec2 will use by terraform  
    ssh-keygen -f mykey

## terraform apply 
    - will go to mainfest folder to execute teraform plan than teraform apply 
    
## ansible config 
   - i write all config that will be deploy in script inside mainfest folder called script.ssh , also ansible will remove it after deploy 
     script.sh that include all dependences like (docker , mvn , nodejs, psql client)
     
   - ansible-playbook ansible.yaml  --key-file mainfest/mykey -e 'ansible_ssh_port=1337'
  
