#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user
mkdir -p catseye
cd catseye

shelf_populate_from_distfiles /cdrom/ < /cdrom/catseye.catalog || exit 1
