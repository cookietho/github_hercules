# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mina.s                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: minakim <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/06 10:35:45 by minakim           #+#    #+#              #
#    Updated: 2018/04/11 17:11:52 by minakim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.name "mina"
.comment "minakimminakimminakimmina"

l1:		fork %:live
		st r1, 0
		and r1, %0, r1

live:	live %1
		zjmp %:live

/*
** fork instruction is generated after 800 cycle. 
** it will create a new process
** put live to stay alive
** used zjmp instruction to jump to live which creates a loop.
** when it hits to a certain cycle, st and and instructions will change 
** enemy's memory and zork dies.
*/
