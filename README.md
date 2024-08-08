## How to use

To optimize storage in Google Photos (or other types of storage, cloud or on-prem) do the following: 

0. Clone this repo to a new directory
1. Download or move video files (any format) to the same path as compress_videos.sh
2. `chmod +x compress_videos.sh`
3. `./compress_videos.sh *`
4. Wait a while, it can take a few hours depending on how many videos you're compressing

## Test results

- 250 videos of mixed formats, totalling to 43.6GB was compressed without noticeable quality loss (on a 27 inch screen) to 3.02GB
- An impressive compression ratio of 14.44 (storage was optimized by 93.07%)
- Works well for saving home videos, mobile camera footage where nominal loss in quality is not problematic
