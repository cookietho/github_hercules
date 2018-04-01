/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minakim <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/03 18:33:21 by minakim           #+#    #+#             */
/*   Updated: 2018/03/03 18:34:14 by minakim          ###   ########.fr       */
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

int	main(int ac, char **av)
{
	int serv_sock;
	int clnt_sock;
	struct sockaddr_in serv_addr;
	struct sockaddr_in clnt_addr;
	int clnt_addr_size;
	char message[] = "Pong Pong\n";

	if (ac != 2)
	{
		printf("%s Type port\n", av[0]);
		exit(1);
	}

	serv_sock = socket(PF_INET, SOCK_STREAM, 0);
	if (serv_sock == -1)
		error_handling("error in socket");

	memset(&serv_addr, 0, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_addr.s_addr = htonl(INADDR_ANY);
	serv_addr.sin_port = htons(atoi(av[1]));

	if (bind(serv_sock, (struct sockaddr*) &serv_addr, sizeof(serv_addr)) == -1)
		error_handling("error in bind");

	if (listen(serv_sock, 5) == -1)
		error_handling("error in listen");

	clnt_addr_size = sizeof(clnt_addr);
	clnt_sock = accept(serv_sock, (struct sockaddr*) &clnt_addr, &clnt_addr_size);
	if (clnt_sock == -1)
		error_handling("error in accept");

	write(clnt_sock, message, sizeof(message));

	return (0);
}
