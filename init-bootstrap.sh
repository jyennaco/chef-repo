#!/bin/bash

################## USER VARIABLES ##################

# Port used to connect to the vagrant VM
PORT=2222

# Name of the Node to create on the Chef Server
NODE_NAME=ahmy-wordpress

####################################################

# This command boostraps the local Vagrant VM to the
# Chef server defined by this local chef-repo

echo "This node will be bootstrapped to the Chef server currently\
      defined in chef-repo/.chef/knife.rb"
echo "Bootstrapping Vagrant VM ${NODE_NAME} over port ${PORT} ..."

knife bootstrap \
    -i ~/.vagrant.d/insecure_private_key \
    -x vagrant \
    -p ${PORT} \
    -N ${NODE_NAME} \
    localhost \
    --sudo

echo "Bootstrapping complete!"

