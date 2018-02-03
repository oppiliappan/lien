#!/usr/bin/env python3.5

import sys
from  subprocess import Popen, PIPE

for i in range(len(sys.argv) - 1):
	curfile = 'file=@%s' %(sys.argv[i + 1])
	with Popen(["curl", "-s", "-F", curfile, "https://0x0.st"], stdout=PIPE, bufsize=1, universal_newlines=True) as x:
		for line in x.stdout:
			with open('logs.txt', 'at') as f:
				f.write(sys.argv[i + 1])
				f.write(' - ')
				f.write(str(line))
			print("Uploaded %s" %(str(line)), end='')
	Popen(["notify-send", "Uploaded", (sys.argv[i + 1])])
