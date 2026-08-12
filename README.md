# video-compress

Batch-compress video with ffmpeg to cut cloud storage costs. One script, nothing to install but ffmpeg.

Pointed at a folder of home videos and phone footage:

| | |
|---|---|
| Input | 250 videos, mixed formats — **43.6 GB** |
| Output | **3.02 GB** |
| Result | **14.4× smaller** — 93.1% of the storage reclaimed |

No quality loss noticeable on a 27-inch screen. Good for home videos and mobile camera footage where a nominal drop is fine — not for footage you intend to edit further or keep as a master.

## Requirements

- `ffmpeg` on your `PATH`

## Use it

```bash
git clone https://github.com/shyamvalsan/video-compress.git
cd video-compress
chmod +x compress_videos.sh
cp /path/to/your/videos/* .    # the script operates on files in its own directory
./compress_videos.sh *
```

Each `NAME.ext` becomes `NAME_compressed.mp4` beside it. **Originals are never modified or deleted** — check the output, then remove the originals yourself.

Budget hours, not minutes, for a large batch: `-preset slow` deliberately trades encoding time for smaller files.

## What it does to each file

| | |
|---|---|
| Video | H.264 (`libx264`), `-preset slow`, `-crf 23` |
| Resolution | scaled to **720p** (`scale=-2:720`, aspect ratio preserved) |
| Audio | AAC, 128 kbps |
| Playback | `+faststart`, so it streams without a full download |

The 720p downscale is a large part of that 14.4× — worth knowing if your source is 4K and you want to keep the resolution.

## Known issue

The per-file compression summary printed at the end uses `stat -f%z`, which is macOS/BSD syntax. On Linux that line errors out (`stat -c%s` is the equivalent). The encoding itself is unaffected and completes normally.

## License

GPL-3.0
