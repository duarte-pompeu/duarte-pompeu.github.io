---
title: How to sync files from Linux to Android using FTP
tags:
  - Android
  - FTP
  - Linux
date: 2016-08-31 02:09:26
---


# Why FTP?

**MTP sucks**. Connecting your devices with a USB cable uses the awful MTP protocol. I don't know why, but it crashes often and freezes some file managers. I always had problems with it, even with different phones, cables or Linux distros.

**Syncthing sucks**. I love the concept (a private, open-source cloud) but it's too unstable. Syncthing upgrade? Ooops, stopped working. Android update? Ooops, broken again.

**Mini-SD is ok**. However, taking it out of my phone requires a special tool or a thin pin, which is not always available. Sometimes apps go crazy when you take the card out, which sucks.

# Solution: a FTP server

Old but gold, FTP has been my favorite tool so far. Activate the FTP server in your phone, access it with a client in your PC and do whatever you want with your files - download, upload, delete, etc. I decided to use **FTP Server (Free)** because it is open-source and simple to use. 

**WARNING**: I haven't checked the source code, so no safety guarantee.

# Instructions: phone

We'll install **F-Droid** (an alternative app store) and then download and install **FTP Server (Free)** from it.

1. Install F-Droid 
2. In F-Droid, search for FTP Server (Free), install and open it
3. Enter login settings and set a username and password
4. (Optional) On "Advanced settings" -> "Stay in folder" pick the parent directory you wish to use (such as internal storage or SD card).
5. Return to the first menu and start the FTP Server using the toggle button


# Instructions: PC

You got the FTP server, now you need the client to access and manage it. It can be a command line program (such as **lftp**) or a graphical program (such as **filezilla**). I'll demonstrate **lftp** on Manjaro Linux.

1. Install lftp

~~~
# It's a good idea to install lftp using a package manager. Here are the commands for some.
yaourt -S lftp # Arch-Linux based
apt-get install lftp # Debian based
dnf install lftp # Fedora based
~~~

## Script to mirror files from PC to smartphone

**Warning**: this script may delete files from your phone. It targets a folder from your computer and creates an exact copy in your phone. If you use a completely unrelated file in your phone, the script might delete everything!

**Tip**: don't forget to fill in your username and password :)

~~~
touch ftpsync.sh
chmod +x ftpsync.sh
ln -s ftpsync.sh /usr/local/bin/ftpsync # (optional)
~~~

Copy the following script to ftpsync.sh:

~~~
#!/bin/sh

# mirror local directory to ftp directory
# usage: $ ftpsync.sh [local dir] [ftp dir]
# tip: to sync with an android phone, get FTP Server (Free) from F-Droid (https://f-droid.org/)

#ftp username, password and host (IP:port)
USER=
PASS=
HOST="192.168.1.2:2121"
# local and remote directories
LCD=$1
RCD=$2

lftp -f "
open $HOST
user $USER $PASS
lcd "$LCD"
mirror --continue --reverse --delete --verbose "$LCD" "$RCD"
bye
"
~~~

**Credit**: [Stack Overflow - Syntax for using lftp to synchronize local folder with an ftp folder?](http://stackoverflow.com/a/32235669)

Example of usage:
~~~
ftpsync.sh "/run/media/jubileu/Data/sync_music/" "/Music/"
~~~

And that's it! You can now turn off the FTP Server in your phone.

# Conclusion

For me, this has been the easiest way to share files between my computer and my smartphone.

**Bug**: sometimes the speed is really slow. Usually stopping the script and trying again later (a minute or so) fixes it.


