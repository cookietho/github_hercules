/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   my_manger.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: minakim <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/14 19:27:56 by minakim           #+#    #+#             */
/*   Updated: 2018/04/16 17:51:40 by minakim          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLUE    "\x1b[34m"
#define ANSI_COLOR_MAGENTA "\x1b[35m"
#define ANSI_COLOR_CYAN    "\x1b[36m"
#define ANSI_COLOR_RESET   "\x1b[0m"

void	text()
{
	printf(ANSI_COLOR_RED " (ﾉﾟ0ﾟ)ﾉ~\n" ANSI_COLOR_RESET "\n");
	printf(ANSI_COLOR_GREEN " (ﾉﾟ0ﾟ)ﾉ~\n" ANSI_COLOR_RESET "\n");
	printf(ANSI_COLOR_YELLOW " (ﾉﾟ0ﾟ)ﾉ~\n" ANSI_COLOR_RESET "\n");
	printf(ANSI_COLOR_BLUE " (ﾉﾟ0ﾟ)ﾉ~\n" ANSI_COLOR_RESET "\n");
	printf(ANSI_COLOR_MAGENTA " (ﾉﾟ0ﾟ)ﾉ~\n" ANSI_COLOR_RESET "\n");
	printf(ANSI_COLOR_CYAN " (ﾉﾟ0ﾟ)ﾉ~\n" ANSI_COLOR_RESET "\n");

	printf(".    .      .                                    .\n");
	printf("|\  /|      |                       o           / \\                     o\n");
	printf("| \/ |.  .  |--. .-..--.--. .-.     .  .--.    /___\\  .--.--. .-.  ---. .  .--. .-..\n");
	printf("|    ||  |  |  |(   )  `--.(.-'     |  `--.   /     \\ |  |  |(   )  .'  |  |  |(   |\n");
	printf("'    '`--|  '  `-`-''  `--' `--'  -' `-`--'  '       `'  '  `-`-'`-'---' `-'  `-`-`|\n");
	printf("         |                                                                      ._.'\n");
	printf("      `-'\n");
	sleep (1);
}

void	horse()
{
	system("osascript -e 'set Volume 3'");
	system("say -v Yuna '말.'");
//	sleep (1);
}

int		main(void)
{
	while (1)
	{
		fork();
		horse();
		text();
	}
	return (0);
}
