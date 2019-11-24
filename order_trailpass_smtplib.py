#!/usr/bin/env python3

from datetime import date
import smtplib
from email.message import EmailMessage

month = ["January", "February", "March",
         "April",   "May",      "June",
         "July",    "August",   "September",
         "October", "November", "December"]
next_month = month[(date.today().month + 1) % 12]

email = f"""Today is the last day to order your {next_month} Trailpass.  The
deadline is 5 PM!

Hugs,
order_trailpass.pl
"""

msg = EmailMessage()
msg.set_content(email)
msg['Subject'] = 'Order new trailpass'
msg['From'] = 'order_trailpass.pl <waltman@mawode.com>'
msg['To'] = 'Walt Mankowski <waltman>'

s = smtplib.SMTP('localhost')
s.send_message(msg)
s.quit()
