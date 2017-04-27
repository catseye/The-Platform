#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user/catseye

for p in `cat /cdrom/catseye.catalog`; do
  echo "*** shelf_build $p ***"
  shelf_build $p
  echo "*** shelf_link $p ***"
  shelf_link $p
done
