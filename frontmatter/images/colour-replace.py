#!/usr/bin/env python
import random
import re
import sys
import colorsys


inv_color_variance = 10
hue = float(sys.argv[2])
saturation = (float(sys.argv[3]), float(sys.argv[4]))
value = (float(sys.argv[5]), float(sys.argv[6]))


def hsv2rgb(h,s,v):
    return tuple(round(i * 255) for i in colorsys.hsv_to_rgb(h,s,v))


def color2():
    hue_ = hue + (random.random() - 0.5) / inv_color_variance
    if hue_ < 0:
        hue_ = 1 - hue_

    if hue_ > 1:
        hue_ -= 1

    (r, g, b) = hsv2rgb(hue_, random.uniform(*saturation), random.uniform(*value))
    return f'{r:02x}{g:02x}{b:02x}'.format()



with open(sys.argv[1], 'r') as handle:
    for line in handle:
        line = line.rstrip()

        m1 = re.match(r'(.*[;"])fill:#ff0000(.*)stroke:#......(.*)', line)
        m2 = re.match(r'(.*[;"])fill:#ff0000(.*)', line)
        color = color2()
        if m1:
            print("%sfill:#%s%sstroke:#%s%s" % (m1.group(1), color, m1.group(2), color, m1.group(3)))
        elif m2:
            print("%sfill:#%s;stroke:#%s%s" % (m2.group(1), color, color, m2.group(2)))
        else:
            print(line)
