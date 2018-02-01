#!/usr/bin/env python3.5

import sys
import subprocess
from os.path import expanduser

home = expanduser("~")

for i in range(len(sys.argv) - 1):
	curfile = 'file=@%s' %(sys.argv[i + 1])

	with subprocess.Popen(["curl", "-s", "-F", curfile, "https://0x0.st"], stdout=subprocess.PIPE, bufsize=1, universal_newlines=True) as p:
		for line in p.stdout:
			with open(home + '/scripts/logs.txt', 'at') as f:
				f.write(sys.argv[i + 1])
				f.write(' - ')
				f.write(str(line))
	subprocess.Popen(["notify-send", "Uploaded", (sys.argv[i + 1])])
	subprocess.Popen(["echo", "Uploaded:", sys.argv[i + 1]])
