# Install Dependencies
sudo apt install inotify-tools catimg

home=$HOME/.config/slow-art

mkdir $home
currentDirectory=$PWD 
cd $home

# Build necessary files for the monitoring program
cp $currentDirectory/defaultcover1.jpg defaultcover1.jpg
cp defaultcover1.jpg cover.jpg
touch album.txt
touch artist.txt

mkdir scripts && cd scripts

cp $currentDirectory/slow-monitor.sh slow-monitor.sh
cp $currentDirectory/slow-art.sh slow-art.sh


cd $currentDirectory

export PATH=$PATH:$home/scripts
