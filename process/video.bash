#!/bin/bash

#audio
VIDEO_FOLDER="video"
# white space
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for i in $(ls $VIDEO_FOLDER); do
    for title in $(ls $VIDEO_FOLDER/$i); do
        echo "starting $title"
        res_file=$VIDEO_FOLDER/$i/$(echo $title |sed "s/\.[^.]*$/.txt/g")
        tmp_file=$VIDEO_FOLDER/$i/$(echo $title |sed "s/\.[^.]*$/.tmp/g")
        ffprobe -show_frames -of compact=p=0 -f lavfi "movie=$VIDEO_FOLDER/$i/$title,select=gt(scene\,.4)" > $tmp_file
        cat $tmp_file |awk -F '|' '{print $5}' | awk -F '=' '{print $2}' > $res_file
        rm $tmp_file
        echo "done with $res_file"
    done
done
#whitespace
IFS=$SAVEIFS

