#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user
mkdir -p catseye
cd catseye

shelf_populate_from_distfiles /cdrom/ < /cdrom/infrastructure.catalog || exit 1
