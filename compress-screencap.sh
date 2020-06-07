#!/bin/bash

ffmpeg -i "$1" "${1%.*}.png" -y -hide_banner -loglevel warning;

if [ -z "$2" ]
then
    pngquant 64 --skip-if-larger --strip --force --output "${1%.*}.png" "${1%.*}.png";
else
    pngquant $2 --skip-if-larger --strip --force --output "${1%.*}.png" "${1%.*}.png";
fi
