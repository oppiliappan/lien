# lien.sh

A simple shell script to take screenshots and upload them, log the links, inform you about the upload status, and copy the link to clipboard.

### Dependencies

[`curl`](https://curl.haxx.se/) - to transfer files to file hosts.  
`libnotify` / `libnotify-bin` - to send desktop notifications of upload status.  
[`xclip`](https://github.com/astrand/xclip) - to copy URLs to X11 clipboard.  
[`slop`](https://github.com/naelstrof/slop) - for sane screenshotting.  
[`maim`](https://github.com/naelstrof/maim) - scrot sucks.  

```
Usage:
lien [options]

-h                  Display this help message and exit.
-f [file]           Upload a file to a file host.
                    Auto uploads a screenshot when paired with the 's' flag
-s [file]           Take an interactive screenshot.
-a [file]           Take a full screenshot.
-d <num>            Wait for <num> seconds before taking a screenshot.
-l                  Print logs of previous uploads. Logs are stored at $HOME/lien/lien_logs.
-c                  Clear all logs.

Examples:

lien -f xyz.txt # upload a text file
lien -af -d 2   # upload a screenshot of the entire root window
                # after a delay of 2 seconds
```

Users are encouraged to write basic loops to take care of batch uploads.

```shell
for i in `ls`; do
lien -f teknik $i
done
```

### TODO

 - Improve logging
