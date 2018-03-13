# lien.sh

A simple shell script to take screenshots and upload them, log the links, inform you about  
the upload status, and copy the link to clipboard.

### Dependencies

[`curl`](https://curl.haxx.se/) - to transfer files to file hosts.  
`libnotify` / `libnotify-bin` - to send desktop notifications of upload status.  
[`xclip`](https://github.com/astrand/xclip) - to copy URLs to X11 clipboard.

```
Usage:
lien [options]

-h                  Display this help message and exit.
-f host <file>      Upload a file to a file host.
                    The available hosts are:
                       0x0.st (0/0x0)
                       teknik.io (t/teknik)
-s <file>           Take an interactive screenshot.
-u <file>           Take a screenshot of the focused window.
-a <file>           Take a full screenshot.
-d <num>            Wait for <num> seconds before taking a screenshot.
-l                  Print logs of previous uploads. Logs are stored at $HOME/lien/lien_logs.
-c                  Clear all logs.
```

Note: If more than one of the options s/u/a are given, the last option is considered.

Examples:

```shell
# Upload a text file to teknik
lien -f teknik plain.txt

# Take a selective screenshot
lien -s shot.png

# Take a screenshot of the focused window, and upload it to 0x0.st, and clear all logs
lien -ucf 0 focus.png
```

Users are encouraged to write basic loops to take care of batch uploads.

```shell
for i in `ls`; do
lien -f teknik $i
done
```

### TODO

 - Add more hosts
 - Improve logging
