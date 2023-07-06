#! /bin/bash

declare -A musicExtensions=( [mp3]=1 [flac]=1 )

function editMusicTags(){
    oldDirectory=$1
    newDirectory=$2
    filename=$3
    artist=$4
    album=$5
    year=$6

    ## FIX : Performer tag doesn't work
    ffmpeg -i "$oldDirectory/$filename" \
    -codec copy \
    -metadata performer="" \
    -metadata composer="" \
    -metadata genre="" \
    -metadata description="" \
    -metadata disc="0" \
    -metadata publisher="" \
    -metadata copyright="" \
    -metadata comment="" \
    -metadata publisher="" \
    -metadata author="$artist" \
    -metadata artist="$artist" \
    -metadata album_artist="$artist" \
    -metadata album="$album" \
    -metadata date="$year" \
    -y "$newDirectory/$filename"
}

inputAlbumDirectory=$1

# Checking that every file within the folder is music
for file in "$inputAlbumDirectory"/*
do
    ext="${file##*.}"
    if ! [[ ${musicExtensions["$ext"]} ]] ; then
     echo "Error: the folder has unwanted files, please make sure that every file inside the folder are mp3 or flac";exit 1
    fi
done


## FIX : Need to set default values for the inputs
read -e -p "Please enter the artist name : " -i "" artist
read -e -p "Please enter the album name : " -i "" album
read -e -p "Please enter the year : " -i "" year

newAlbumDirectory="/home/cosmicentropy/Music/$artist-($year)-$album"

mkdir "$newAlbumDirectory"

for file in "$inputAlbumDirectory"/*
do
    editMusicTags "$inputAlbumDirectory" "$newAlbumDirectory" "${file##*/}" "$artist" "$album" "$year"
done

