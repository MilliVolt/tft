## the floating tank

use this script to get scene transition information
```ffprobe -show_frames -of compact=p=0 -f lavfi "movie=foo.mp4,select=gt(scene\,.4)" > foo.txt
```
