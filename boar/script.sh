#/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: minakim <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/15 18:17:53 by minakim           #+#    #+#              #
#    Updated: 2018/03/15 22:17:00 by minakim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

echo "echo 'hello mina!' > script.txt" | at now + 1 minute

echo -n "Your script will be executed in 1 minute!\n"
