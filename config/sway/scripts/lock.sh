#! /bin/bash

imagebase="/tmp/swaylock"
ext=".jpg"
lockargs=""

outputs=`swaymsg -t get_outputs | jq -r ".[].name"`

for output in $outputs
do
  img=$imagebase$output$ext
  grim -t jpeg -o $output $img
  ffmpeg -i $img -filter_complex boxblur=lr=20:lp=2 -y $img
  lockargs="--image $output:$img $lockargs"
done

swaylock \
  --indicator-radius 150 \
  --ring-color 6587217f \
  --key-hl-color 86b42b7f  \
  --inside-color 3333337f \
  $lockargs
