import smtplib

fromaddr = 'fromaddr'
toaddr = 'toaddr'
toaddr1 = 'toaddr1'

gmail_user = "usr id"
gmail_pwd = "password"

server = smtplib.SMTP('smtp.gmail.com', 587)
server.ehlo()
server.starttls()
server.login(gmail_user, gmail_pwd)
msg = "Hello!"
server.sendmail(fromaddr, [toaddr, toaddr1], msg)
server.quit()
