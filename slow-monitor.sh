#!/bin/bash

home=$HOME/.config/slow-art

# Is CMus running?
if ! cmus-remote -C >/dev/null 2>&1 ; then
    echo >&2 "SlowArt: cmus is not running"
else
    
   # Get current info
   info=$(cmus-remote -Q)

   # Get CMus album art and info
   musicFile=$(echo "$info" | sed -n 's/^file //p')
   # Update album file
   echo "$info" | sed -n 's/^tag album //p' > $home/album.txt
   # Update artist file
   echo "$info" | sed -n 's/^tag artist //p' > $home/artist.txt
   directory=$(echo $(dirname "$musicFile"))
   coverArt=$directory"/cover.jpg"
   # Does art exist
   if [ -f "$coverArt" ] ;then
        cp "$coverArt" $home/cover.jpg -f 
   else
        cp $home/defaultcover1.jpg $home/cover.jpg -f           
        
   fi


fi
  

