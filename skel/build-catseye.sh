#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user/catseye

for line in `cat /cdrom/catseye.catalog`; do
  project=`echo $line | awk '{split($0,a,"@"); print a[1]}'`
  tag=`echo $line | awk '{split($0,a,"@"); print a[2]}'`
  echo "*** shelf_build $project ***"
  shelf_build $project || exit 1
  echo "*** shelf_link $project ***"
  shelf_link $project || exit 1
done
