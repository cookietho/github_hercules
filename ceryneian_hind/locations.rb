#!/usr/bin/ruby

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    locations.rb                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: minakim <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/09 16:08:43 by minakim           #+#    #+#              #
#    Updated: 2018/03/09 16:08:43 by minakim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require "oauth2"

UID = "a97a1a9ee52606ad0df03cd458d95164165e9708a406cfd32c29d18d556ad19d"
SECRET = "689263bd060bc8837e328200493e951be4f1913b60d0e1722ceea7433d57c95f"

$client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")

$token = $client.client_credentials.get_token

def locate(login)
	begin
		response = $token.get("/v2/users/#{login}/locations")
		while response.status != 200
			puts ("No server")
			sleep(5)
			if response.status == 200
				break
			end
		end
		if !response.parsed[0]["end_at"]
			puts (login.ljust(10) + response.parsed[0]["host"])
		else
			puts (login.ljust(10) + " is not available")
			puts ("(last login -> " + response.parsed[0]["host"] + ")")
		end
	rescue
		puts (login.ljust(10) + " username not found!")
	end
end

if ARGV[0]
	if File.file?(ARGV[0]) and File.extname(ARGV[0]) == ".txt"
		file = File.open(ARGV[0], "r").each_line do |line|
			line == "\n" ? next : login = line.strip
			locate(login)
		end
		file.close
	else
		puts "Invalid file"
	end
else
	puts "add [file.txt]"
end

# $client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")
# Here we are passing parameters to method new and these parameters can be used to initialize 
# the variable. So here we created the client with your credentials.
#
# $token = #client.client_credentials.get_token
# token-based authentication would not associate a user with login info but with a unique token that is used
# to carry client-host transaction (HTTP header to transmit the user info).
# so here we get an access token. (????????)
# get client from client_credentials flow.
#
# The global variables are always preceded by the dollar sign ($).
# $client, $token, $PROGRAM_NAME
# 
# response = $token.get("/v2/users/#{login}/locations")
# the access token will get into the location of the login store in response (????)
#
# The "WHILE" statement - is checking the access token to be 200 (????)
# sleep(5) - tell a Ruby program to wait for 5 seconds. 
#puts response.parsed
#exit (0)
# (line 34) if - the response.parsed[0]["end_at"] part is nil (is not equal to something = does not exist?)
# put the "host"
#
# (line 36) else - we put not available and get the last login.
#
# (line 40) rescue - if fails to get into the location, put username not found.
#
# if ARGV[0] -- In Ruby the 0 position starts after "Ruby a.out". 
# 
# if File.file?(ARGV[0]) and File.extname(ARGV[0] == ".txt"
# this part is checking the ARGV[0] is holding text file.
# if the file is not found, the script moves on. If it finds ".txt", the script will be opened in next line.
#
# file = File.open(ARGV[0], "r").each_line do |line|
# the file will be opened and read but it will be read by each line. 
# it is spliting each line into an array.
# then it will go to next line to check.
#
# line == "\n" ? next : login = line.strip
# if line == "\n" then next else login = line.strip
# if the line is nil then go skip to next line otherwise login(intra) = line.strip <- do this for the line
# locate(login) - will go into the locate function and do
#
# The function will end after each line and repeat.
#
# (line 52) if the file is not ".txt" will put "Invalid file!".
#
# (line 55) if no file is put, will ask for text file.
