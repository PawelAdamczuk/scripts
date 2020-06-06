#!/bin/bash

mkdir ./compressed
shopt -s nullglob

for f in *.png;
    do
    if [ $(identify -format %k "$f") -gt 2000 ]
    then
        ffmpeg -i "$f" -q:v 3 -vf "scale=w=min(iw\,800):h=-2" "./compressed/${f%.*}.jpg" -y -hide_banner -loglevel warning;
    else
        pngquant 64 --skip-if-larger --strip --force --output "./compressed/$f" "$f";
        # zopflipng -y "./compressed/$f" "./compressed/$f";
    fi
done;

for f in {*.jpeg,*.jpg};
do
    ffmpeg -i "$f" -q:v 3 -vf "scale=w=min(iw\,800):h=-2" "./compressed/$f" -y -hide_banner -loglevel warning;
done;

for f in *.gif;
do
    cp "$f" "./compressed/$f";
done;
