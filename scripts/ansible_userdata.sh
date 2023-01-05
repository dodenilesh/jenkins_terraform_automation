#!/bin/bash

set -x
function copy_auth_key() {
    cd /home/ubuntu/.ssh
    cat >> authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdrqT86Ei0jW9z1mT9X+wmYFQszhy33nZ/P4Qr6ERewK+vpKt4Mq3Iv8tYf/VMPFAFV3/r29QgMR+JrQuZpXeLfmPTPLal3g1zDPA9orjlgAYPpxr7Ehqqkfmq5Tlt9gONNK85+mmg+QPjZKqiVITgRsqH3M/Iz/UZ8fCB++RV+dwFeJW5VhEHdF5mj+jODh+wf7WB20+dxFW565bGnO0FI1d+ezpGj37WcnVxOzjpmS+ePgZ4LO9xlk/4/lM3mETOViH5F5B1cMBW6n2P6ONVAbO2mueJp9rvlsTyqDsnm6nWNCQPhIuXC9UapV9hXBQV1RnxTS0W1jUk9HG2BOxv7ww6Vqn4xPftT1d4hDoRe5QY0RJjxNd6EPYO9Lb9dV70Fv4M7wwPcX7hcN+dAaA5XySSBW/lrFJcIUb4zpOh1Wcq6ZJ2ow1vdArbN8qxsfLJ1qngaMXkHm+bWsD2deYDMCTjaAz1iXHGUBQRCIwnQtavN4LhvSDHx9JC6bRP74E= oem@oem-HP-Pavilion-15-Notebook-PC
EOF
}

function copy_pub_key() {
    cat > id_rsa.pub <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdrqT86Ei0jW9z1mT9X+wmYFQszhy33nZ/P4Qr6ERewK+vpKt4Mq3Iv8tYf/VMPFAFV3/r29QgMR+JrQuZpXeLfmPTPLal3g1zDPA9orjlgAYPpxr7Ehqqkfmq5Tlt9gONNK85+mmg+QPjZKqiVITgRsqH3M/Iz/UZ8fCB++RV+dwFeJW5VhEHdF5mj+jODh+wf7WB20+dxFW565bGnO0FI1d+ezpGj37WcnVxOzjpmS+ePgZ4LO9xlk/4/lM3mETOViH5F5B1cMBW6n2P6ONVAbO2mueJp9rvlsTyqDsnm6nWNCQPhIuXC9UapV9hXBQV1RnxTS0W1jUk9HG2BOxv7ww6Vqn4xPftT1d4hDoRe5QY0RJjxNd6EPYO9Lb9dV70Fv4M7wwPcX7hcN+dAaA5XySSBW/lrFJcIUb4zpOh1Wcq6ZJ2ow1vdArbN8qxsfLJ1qngaMXkHm+bWsD2deYDMCTjaAz1iXHGUBQRCIwnQtavN4LhvSDHx9JC6bRP74E= oem@oem-HP-Pavilion-15-Notebook-PC    
EOF
}

function copy_private_key() {
    cat > id_rsa <<EOF
-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----    
EOF
}

function copy_private_pem_key() {
    touch jenkins_server.pem
    chown ubuntu:ubuntu jenkins_server.pem
    cat > jenkins_server.pem <<EOF
-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----  
EOF
}

function installing_packages() {
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt update -y
    sudo apt install ansible -y

}



### script starts here ###
exec >> /var/logkey_setup.log 2>&1

pwd
touch testfile.txt
copy_auth_key
copy_pub_key
copy_private_key
installing_packages
copy_private_pem_key
echo "Done"
exit 0