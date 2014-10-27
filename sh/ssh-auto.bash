#!/bin/bash
# Author : Hemanth.HM
# GPLV3
# Auto login and stay connected!

# Read the hostname and username for SSH login.
read -p "Enter your hostname/ip :" host_name
read -p "Enter your login name  :" login_name

# Generate RSA key.
echo Generating RSA keys
ssh-keygen -t rsa

# Copy the generated key.
echo Copying keys to ${host_name}
ssh-copy-id -i ~/.ssh/id_rsa ${login_name}@${host_name}

# Add a function to ~/.bashrc.
cat >> ~/.bashrc << EOF
function assh(){
	while true; do ssh ${login_name}@${host_name} ; done
}
EOF

# exec new shell or even source the rc?
bash
