#!/bin/bash

################## USER VARIABLES ##################

# IP address or domain name of the server
# Use localhost for vagrant
SERVER="52.7.45.7"

# Port used to connect to the server
# User 2222 for vagrant
PORT=22

# Name of the Node to create on the Chef Server
NODE_NAME="wordpress-test-2"

# Path to key
# For vagrant use: ~/.vagrant.d/insecure_private_key
KEY=~/.aws/ahmy-keypair.pem

# Username to log in case
# For vagrant use "vagrant" as the user
USER=ubuntu

####################################################

# This command boostraps the local Vagrant VM to the
# Chef server defined by this local chef-repo

echo "Bootstrapping server: ${SERVER}, as name ${NODE_NAME}, \
        over port: ${PORT}, and user ${USER} ..."

knife bootstrap \
    -i ${KEY} \
    -x ${USER} \
    -p ${PORT} \
    -N ${NODE_NAME} \
    ${SERVER} \
    --sudo

if [ $? -ne 0 ] ; then
    echo "There was a problem bootstrapping ${SERVER} to the chef server :("
    exit 1
fi

echo "${SERVER} was bootstrapped to the chef server successfully!"
exit 0

