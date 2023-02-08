## Music updater bash script (Linux)

A script for changing music file metadata in a specific way and copying the files inside a new folder with a unique name based on metadata.

### How to use :

First Download or clone the repository and cd into it, then you need to grant access for the script to execute with this command :

```sudo chmod +x update_music.sh```

After that you need to copy the musics that you want to modify into a folder (name of the folder doesn't matter.), and run the shell script with path of the folder as an option along with it :

```./update_music.sh /$path_of_the_folder/```

Then the script wants you to enter the artist, album and year. After that the script will create a folder inside your "Music" directory with a specific format for the name and every music will be modified and copied into it.
