# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    apples.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: minakim <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/05/04 10:24:58 by minakim           #+#    #+#              #
#    Updated: 2018/05/11 17:36:50 by minakim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ "$#" -ne 3 ] ; then
	echo "usage: sh $0 user ip-address port"
	exit 1
fi

SSH_USR=$1
SSH_IPADDR=$2
SSH_PORT=$3

# creating a public key to generate authentification key pairs for ssh
# ssh-key -t rsa creates private key and public key. 
ssh-keygen -t rsa

# installs an ssh public key on a server as an authorized key. 
# this command copy generated public key to .ssh directory on a server.
ssh-copy-id $SSH_USR@$SSH_IPADDR -p $SSH_PORT

# set permission
# chmod 700: only onwer(user) can read, write, and execute.
# chmod 640: group can read.
ssh $SSH_USR@$SSH_IPADDR -p $SSH_PORT "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
