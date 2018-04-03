# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: minakim <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/30 16:30:12 by minakim           #+#    #+#              #
#    Updated: 2018/04/02 23:28:54 by minakim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

mkdir $1

read -p "Do you want C language? (yes/no): " answer
if [[ "$answer" == "yes" ]]; then
	echo "Good!";
elif [[ "$answer" == "no" ]]; then
	echo "Sorry C only"
else
	echo "What? C? Good!";
fi

read -p "What is your intra? " intra
echo "$intra" > $1/author
mkdir $1/src
mkdir $1/includes
touch $1/includes/$1.h

while true; do
	read -p "Do you want to include your libft? (y/n): " yn
	case $yn in
		[Yy]* ) git clone https://github.com/cookietho/libft.git $1/libft; break;;
		[Nn]* ) LiBFT=0; break;;
		* ) echo "y or n";;
	esac
done

while true; do
	read -p "Do you want to add gitignore? (y/n): " yn
	case $yn in 
		[Yy]* ) cp c.gitignore $1/.gitignore; break;;
		[Nn]* ) break;;
		* ) echo "y or n";;
	esac
done

while true; do
	read -p "Do you want a Makefile? (y/n): " yn
	case $yn in
		[Yy]* ) cp -R Makefile $1/Makefile; break;;
		[Nn]* ) break;;
		* ) echo "y or n";;
	esac
done
