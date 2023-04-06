#!/bin/sh

cd /home/user/catseye/Python-3.9.13/install/lib/python3.9/site-packages/

tar zxvf /cdrom/atomize-0.2.0.tar.gz
mv atomize-0.2.0/src3/atomize.py atomize.py

tar zxvf /cdrom/Markdown-2.6.8.tar.gz
mv Markdown-2.6.8/markdown markdown

tar zxvf /cdrom/beautifulsoup4-4.12.1.tar.gz
mv beautifulsoup4-4.12.1/bs4 bs4
