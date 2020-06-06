#!/bin/bash

mkdir ./compressed
shopt -s nullglob

for f in *.png;
do
    pngquant 64 --skip-if-larger --strip --force --output "./compressed/$f" "$f";
done;
