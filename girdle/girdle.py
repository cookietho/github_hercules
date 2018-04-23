import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText

fromaddr = 'sender addr'
toaddr = 'receiver addr'
toaddr1 = 'receiver addr'
gmail_user = "user id"
gmail_pwd = "password"
msg = MIMEMultipart()
msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = "Warriors! join my army!"
body = "Warrior! Join My Army to fight Amazons"
msg.attach(MIMEText(body, 'plain'))

server = smtplib.SMTP('smtp.gmail.com', 587)
server.ehlo()
server.starttls()
server.ehlo()
server.login(gmail_user, gmail_pwd)
text = msg.as_string()
server.sendmail(fromaddr, [toaddr, toaddr1], text)
print "Email has been sent."
server.quit()

# Python's email package contains many classes and functions for composing
# and parsing email messages.
# importing smtplib
# line 2 & 3 : modifies the contents and headers
# line 5 ~ 15 : settings for this email
# line 17 ~ 25 : the SMTP protocol includes a command to ask a server
# whether an address is valid
# line 17 : created an instance object called server using constructor
# SMTP protocol has some methods(actions) we can use to generate the protocol
# line 18 : ehlo() introduces the server
# line 19 : starttls() offers a way to upgrade a plain text connection to
# an encrypted connection
