#!/bin/sh

home=$HOME/.config/slow-art

clear
echo -ne "\033]0;SlowArt\007"
imageWidth=100

if [ $# -eq 1 ] ; then
    imageWidth=$1
fi 

catimg -w $imageWidth $home/cover.jpg
echo "Album"
cat $home/album.txt
echo "Artist"
cat $home/artist.txt


while inotifywait --quiet -e modify $home/cover.jpg; do
   clear 
   catimg -w $imageWidth $home/cover.jpg
   echo "Album"
   cat $home/album.txt
   echo "Artist"
   cat $home/artist.txt
done

