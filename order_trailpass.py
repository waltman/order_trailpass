#!/usr/bin/env python3

from datetime import date
from subprocess import Popen, PIPE

month = ["January", "February", "March",
         "April",   "May",      "June",
         "July",    "August",   "September",
         "October", "November", "December"]
next_month = month[(date.today().month + 1) % 12]

email = f"""From: order_trailpass.pl <waltman@mawode.com>
To: Walt Mankowski <waltman>
Subject: Order new trailpass

Today is the last day to order your {next_month} Trailpass.  The
deadline is 5 PM!

Hugs,
order_trailpass.pl
"""

sendmail = Popen(['/usr/sbin/sendmail', '-t'], stdin=PIPE)
sendmail.communicate(email.encode('utf-8'))
