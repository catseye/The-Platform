#!/usr/bin/env python3

import re

with open('skel/catseye.catalog', 'r') as f:
    lines = [tuple(re.match(r'^(.+?)@(.+?)\s*$', n).groups()) for n in sorted(list(f))]

for (name, version) in lines:
    name = name.replace('-', ' ')
    m = re.match(r'^(\d+\.\d+)-(\d+\.\d+)$', version)
    if m:
        version = '{} ({})'.format(m.group(1), m.group(2))
    m = re.match(r'^rel_(\d+)_(\d+)_(\d+)_(\d+)$', version)
    if m:
        version = '{}.{} ({}.{})'.format(m.group(1), m.group(2), m.group(3), m.group(4))
    print('{} {}'.format(name, version))
