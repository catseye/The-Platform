#!/bin/sh

TH=$HOME/toolshelf/.toolshelf/bin/toolshelf.py
TEMPLATE="'/cdrom/bitbucket.org,%s,%s-master.tar.gz'"

for CATALOG in $*; do
    $TH --bb-prefix-template=$TEMPLATE dock @/cdrom/$CATALOG.catalog
done
