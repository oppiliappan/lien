# lien.sh

A simple shell script to upload files / take screenshots and upload them.

### Dependencies

[xclip](https://github.com/astrand/xclip) - to copy URLs to X11 clipboard  
[curl](https://curl.haxx.se/) - to transfer files to file hosts  
libnotify / libnotify-bin - to send desktop notifications of upload status

```
Usage:
lien [option] [file]

-h  --help           Display this help message and exit. Does not require a [file].
-o  --oxo            Upload a file to 0x0.st.
-t  --teknik         Upload a file to teknik.io.
-s  --scrot          Take an interactive screenshot and upload it to teknik.io (default).
-f  --scrot-full     Take a screenshot and upload it to teknik.io.
-l  --display-logs   Print logs of previous uploads. Logs are stored at $HOME/lien/lien_logs.
                     They are printed in reverse chronological order.

Examples:
lien -o image.png  # upload an existing file called image.png to 0x0.st
lien -l  # print logs
lien -s owo.png  # take an interactive screenshot called owo.png and upload it to teknik.io
```

Users are encouraged to write basic loops to take care of batch uploads.

```shell
for i in `ls`; do
lien -t $i
done
```

### TODO

 - add more hosts
 - improve logging
