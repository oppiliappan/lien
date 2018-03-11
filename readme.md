# lien.sh

A simple shell script to upload files / take screenshots and upload them, log the links, inform you about  
the upload status, and copy the link to clipboard.

### Dependencies

[`curl`](https://curl.haxx.se/) - to transfer files to file hosts.  
`libnotify` / `libnotify-bin` - to send desktop notifications of upload status.  
[`xclip`](https://github.com/astrand/xclip) - to copy URLs to X11 clipboard.

```
Usage:
lien [options] [file]

-h      Display this help message and exit. Does not require a [file].
-f      Upload a file to a file host.
        The available hosts are:
           0x0.st (0)
           teknik.io (t)
-s      Take an interactive screenshot.
-u      Take a screenshot of the focused window.
-a      Take a screenshot of the entire viewport.
-l      Print logs of previous uploads. Logs are stored at $HOME/lien/lien_logs.
-c      Clear all logs.

Examples:

# Upload a text file to teknik
lien -f teknik plain.txt

# Take a selective screenshot
lien -s shot.png

# Take a screenshot of the focused window, and upload it to 0x0.st
lien -uf 0x0 focus.png
```

Users are encouraged to write basic loops to take care of batch uploads.

```shell
for i in `ls`; do
lien -t $i
done
```

### TODO

 - Add more hosts
 - Improve logging
