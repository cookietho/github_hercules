/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minakim <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/03 18:34:34 by minakim           #+#    #+#             */
/*   Updated: 2018/03/03 18:34:51 by minakim          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>

void	error_handling(char *message)
{
	fputs(message, stderr);
	fputc('\n', stderr);
	exit(1);
}

int    main(int ac, char **av)
{
	int    sock;
	struct    sockaddr_in    serv_addr;
	char    message[30];
	int    str_len;

	if (ac != 4)
	{
		printf("%s Type IP, port, ping\n", av[0]);
		exit(1);
	}

	sock = socket(PF_INET, SOCK_STREAM, 0);
	if (sock == -1)
		error_handling("error in socket");

	memset(&serv_addr, 0, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = inet_addr(av[1]);
	serv_addr.sin_port = htons(atoi(av[2]));

	if (connect(sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) == -1)
		error_handling("error in connect");

	str_len = read(sock, message, sizeof(message)-1);
	if(str_len == -1)
		error_handling("error in read");
	message[str_len] = 0;
	printf("%s\n", message);
	return (0);
}
