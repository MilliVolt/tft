#!/bin/bash
#ffprobe -show_frames -of compact=p=0 -f lavfi "movie=drag_race_nyc.ogv,select=gt(scene\,.4)" > foo.txt

#audio
MUSIC_FOLDER="music"
# white space
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for i in $(ls $MUSIC_FOLDER); do
    for title in $(ls $MUSIC_FOLDER/$i); do
        echo "starting $res_file"
        res_file=$(echo $title |sed "s/mp3$/txt/g")
        aubiotrack $MUSIC_FOLDER/$i/$title > $MUSIC_FOLDER/$i/$res_file
    done
done
#whitespace
IFS=$SAVEIFS

