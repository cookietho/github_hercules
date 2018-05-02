# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    geryon2.py                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: minakim <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/28 23:24:06 by minakim           #+#    #+#              #
#    Updated: 2018/04/28 23:24:48 by minakim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

import sys
import time
import requests

url = input("Type the URL: ")
Thread = eval(input("Type number of thread (clients): "))
Times = eval(input("Type number of times: "))
data = {
        'transactions': Thread * Times,
        'success': 0,
        'failure': 0,
        'time': 0,
        'size': 0
}

try:
    r = requests.get(url)
    print ("Server Benchmarking Start")
    time.sleep(2)

except:
    print ("URL not exist ")
    sys.exit(1)

number_thread = 0
while number_thread < Thread:
    number_times = 0
    while number_times < Times:
        r = requests.get(url)
        status = r.status_code
        if status == 200:
            data['success'] += 1
        else:
            data['failure'] += 1

        time = str(r.elapsed.total_seconds())
        data['time'] += float(time)

        size = len(r.content)
        data['size'] += size

        method = str(r.request)[18:-2]

        print (('HTTP/1.1 '), status, ('\t'), time, ('secs\t'), size, ('bytes ==>'), method, (''), url)
        number_times += 1
    number_thread += 1

print ('Transactions:\t\t\t', data['transactions'], 'number_times')
print ('Availability:\t\t\t', (data['success'] * 100) / data['transactions'], '%')
print ('Elapsed time:\t\t\t', data['time'], 'secs')
print ('Response time:\t\t\t', data['time'] / data['transactions'], 'secs')
print ('Data transfered:\t\t', data['size'] / 1024 * 1000, 'MB')
print ('Successful transactions:\t', data['success'])
print ('Failed transactions:\t\t', data['failure'])
