#!/bin/bash

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>log.out 2>&1

mkdir photos-Optimized

for photos in *.JPG; do 
	convert -verbose $photos -quality 85% -resize 1024 ./photos-Optimized/$photos-Optimized.JPG
done 

