#!/bin/sh -ex

cat >/tmp/preliminaries.catalog <<EOF;
realpath@1.0-2022.0908
Falderal@rel_0_14
yucca@rel_1_2_2022_0909
hatoucan@0.2-2022.0908
OpenZz@1.0.4-4ce1
EOF

if [ -d "$CHRYSOBERYL" ]; then
  (cd $CHRYSOBERYL && ./venv/bin/python3 ./script/create-shelf-catalog > /tmp/Chrysoberyl.catalog)
else
  echo "The CHRYSOBERYL env var must be set to a valid directory path."
  exit 1
fi

cat /tmp/preliminaries.catalog /tmp/Chrysoberyl.catalog > skel/catseye.catalog
