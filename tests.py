#!/usr/bin/env python3.5

import sys
import subprocess
from os.path import expanduser

with subprocess.Popen(["ls", "-l"], stdout=subprocess.PIPE, bufsize=1, universal_newlines=True) as p:
    for line in p.stdout:
        print(line, end='')
