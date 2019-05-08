#!/usr/bin/python

##
#    @file    auto_test_generator.py
#    @Brief   This script will generator random inputs to test
#             the multiplier design.
#
#    @param   None
#
##

import sys
import os
import time
import string
import random


#---------Set sys.path for scripts execution---------------------------------------
# Absolute path to scripts
full_path = os.path.abspath(os.path.dirname(sys.argv[0])).split('script')[0]
sys.path.append(full_path)
# Walk path and append to sys.path
for root, dirs, files in os.walk(full_path):
    for dir in dirs:
      sys.path.append(os.path.join(root, dir))


def main(argv):
a=random.randint(1, 1000)
g=hex(a)
print("1st random value=",g)
gdec=int(g,16)
b=random.randint(1, 1000)
s=hex(b)
print("2nd random value=",s)
sdec=int(s,16)
c=gdec*sdec
d=hex(c)
print("Result=",d)



if __name__ == "__main__":
    main(sys.argv[1:])
