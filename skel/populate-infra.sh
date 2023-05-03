#!/bin/sh

. /home/user/.shelf/shelf.sh

cd /home/user
mkdir -p infra
cd infra

shelf_populate_from_distfiles /cdrom/ < /cdrom/infrastructure.catalog || exit 1
mv Ophis-99f074da278d4ec80689c0e22e20c5552ea12512 Ophis-2.1-2019.0413
mv dcc6502-680c21299241133449056c2ddfbc0dd087dc3807 dcc6502-2.1-2018.0902
