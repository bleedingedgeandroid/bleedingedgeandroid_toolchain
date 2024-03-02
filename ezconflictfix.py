#!/bin/python
propfiles = open('propfiles.txt', 'r')
lines = []
for line in propfiles:
    if(len(line.strip()) > 1):
        lines.append(line.strip())
    print(line.strip())

import mmap

with open('installs.mk', 'rb', 0) as file, mmap.mmap(file.fileno(), 0, access=mmap.ACCESS_READ) as s:
    for stf in lines:
        if s.find(str.encode("{}:".format(stf))) != -1:
            print('FOUND {}'.format(stf))
