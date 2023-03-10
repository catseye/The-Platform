#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user
mkdir -p catseye
cd catseye

shelf_populate_from_distfiles /cdrom/ < /cdrom/infrastructure.catalog || exit 1
mv catseye/Ophis-99f074da278d4ec80689c0e22e20c5552ea12512 catseye/Ophis-2.1-2019.0413
mv catseye/dcc6502-dcc6502_v2.1 catseye/dcc6502_v2.1
