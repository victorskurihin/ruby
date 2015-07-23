#!/usr/bin/python
################################################################################
# http://www.codeskulptor.org/#user40_VLv2YgdbZV_2.py
# my_Tiled_images.py
################################################################################
USE_TUPLE = True
CARD_SIZE = (73, 98)
CARD_CENTER = (36.5, 49)
def get_card_pos(i, j, usetuple = False):
    if usetuple:
       return (CARD_CENTER[0] + i*CARD_SIZE[0], CARD_CENTER[1] + j*CARD_SIZE[1])
    else:
       return [CARD_CENTER[0] + i*CARD_SIZE[0], CARD_CENTER[1] + j*CARD_SIZE[1]]

print get_card_pos(0, 0, USE_TUPLE)
print get_card_pos(13, 3)
################################################################################
#EOF
# vim: syntax=python:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
