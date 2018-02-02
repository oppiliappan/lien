#!/usr/bin/env python3.5

import sys
import subprocess

for i in range(len(sys.argv) - 1):
	curfile = 'file=@%s' %(sys.argv[i + 1])
	with subprocess.Popen(["curl", "-s", "-F", curfile, "https://0x0.st"], stdout=subprocess.PIPE, bufsize=1, universal_newlines=True) as x:
		for line in x.stdout:
			with open('logs.txt', 'at') as f:
				f.write(sys.argv[i + 1])
				f.write(' - ')
				f.write(str(line))
			print("Uploaded %s" %(str(line)), end='')
	subprocess.Popen(["notify-send", "Uploaded", (sys.argv[i + 1])])
