#!/usr/bin/python
# -*- coding: utf-8 -*-
################################################################################
# http://www.codeskulptor.org/#user40_VLv2YgdbZV_3.py
# my_Tiled_images.py
# http://www.codeskulptor.org/#examples-tiled_images.py
################################################################################

RANKS = ('A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K')
SUITS = ('C', 'S', 'H', 'D')

# card sprite - 950x392
CARD_CENTER = (36.5, 49)
CARD_SIZE = (73, 98)
#[912.5, 343]

def get_card_pos(suit, rank):
    i = RANKS.index(rank)
    j = SUITS.index(suit)
    return [CARD_CENTER[0] + i*CARD_SIZE[0], 
            CARD_CENTER[1] + j*CARD_SIZE[1]]

print get_card_pos('C', 'A')
print get_card_pos('D', 'K')

def list_extend_many1(lists):
    """
    Returns a list that is the concatenation of all the lists in the given 
    list-of-lists.
    """
    result = []
    for l in lists:
        result.extend(l)
    return result

def list_extend_many2(lists):
    result = []
    for i in range(len(lists) - 1, -1, -1):
        result.extend(lists[i])
    return result

def list_extend_many3(lists):
    result = []
    i = 0
    while i < len(lists): 
        result += lists[i]
        i += 1
    return result

#print list_extend_many([[1,2], [3], [4, 5, 6], [7]])

################################################################################
## Q1 ##
# What is the position of the center of the top-left card (Ace of Clubs, A♣) in
# the tiled image discussed in the "Tiled images" video? Remember that each card
# in this tiled image has size 73 x 98 pixels.
# 
# (Note that the tiled image used in the current version of your Blackjack 
# mini-project is slightly smaller.)
#
# (36.5, 49)

################################################################################
## Q2 ##
# What is the position of the center of the bottom-right card 
# (King of Diamonds, K♦) in the tiled image discussed in the "Tiled images"
# video? Again, remember that each card in this tiled image has size 73 x 99
# pixels.
#
# Enter two numbers, separated only by spaces.
#
# 985.5 343
# 985.5 - bad

################################################################################
## Q3 ##
# When using Dropbox to store images for use with CodeSkulptor, what should the
# www portion of the DropBox URL be replaced by?
#
# Refer to the video on tiled images.
################################################################################
## Q4 ##
# Question 4
# Within the __init__ method, the new object should be returned with what code?
# No return statement is needed in __init__.
################################################################################
## Q5 ##
# One way of understanding code is to think about other code that accomplishes 
# the same thing — i.e., given the same starting values, it returns and/or 
# mutates the same values.
#
# This following defines one way to concatenate multiple lists. For example,
# list_extend_many([[1,2], [3], [4, 5, 6], [7]]) returns [1, 2, 3, 4, 5, 6, 7] 
# and doesn't mutate anything.
#
# def list_extend_many(lists):
#     """
#      Returns a list that is the concatenation of all the lists in the given 
#      list-of-lists.
#     """
#     result = []
#     for l in lists:
#         result.extend(l)
#     return result
# Which of the following definitions are equivalent? I.e., which always produce
# the same output for the same input, and never mutate the input or any global
# variable?
print "## Q5 ##"
def list_extend_many1(lists):
    """
     Returns a list that is the concatenation of all the lists in the given 
     list-of-lists.
    """
    result = []
    for l in lists:
        result.extend(l)
    return result

def comment1():
    ############################################################################
    def list_extend_many(lists):
        result = []
        i = 0
        while i < len(lists): 
            result.extend(lists[i])
            i += 1
        return result
    ############################################################################
    def list_extend_many(lists):
        result = []
        i = 0
        while i < len(lists): 
            result += lists[i]
            i += 1
        return result
    ############################################################################
print list_extend_many1([[1,2], [3], [4, 5, 6], [7]])
print "test"
def list_extend_many2(lists):
    result = []
    for i in range(len(lists)):
        result.extend(lists[i])
    return result
print list_extend_many2([[1,2], [3], [4, 5, 6], [7]])
################################################################################
## Q6 ##
# Which of the following programs would never end if it weren't for 
# CodeSkulptor's timeout? Assume no break or return statement is used in the 
# elided loop bodies.
#
# You might want to add a print statement to each loop to better understand 
# the behavior.

def comment2():
    ############################################################################
    n = 127834876
    while n >= 0:
        # … Assume this doesn't modify n.
        n //= 2
    ############################################################################
    n = 1001
    while n != 0:
        #… Assume this doesn't modify n.
        n -= 2
    ############################################################################
    n = 1
    while n > 0:
        #… Assume this doesn't modify n.
        n += 1 
    ############################################################################
################################################################################
## Q7 ##
# Convert the following English description into code.
#
# 1) Initialize n to be 1000. Initialize numbers to be a list of numbers from 2
#    to n, but not including n.
# 2) With results starting as the empty list, repeat the following as long as 
#    numbers contains any numbers.
#       Add the first number in numbers to the end of results.
#       Remove every number in numbers that is evenly divisible by (has no 
#       remainder when divided by) the number that you had just added to 
#       results.
# How long is results?
#
# To test your code, when n is instead 100, the length of results is 25.

n = 1000
numbers = range(2, n)
results = []
while len(numbers) > 0:
    results.append(numbers[0])
    temp = []
    for n in numbers:
        if 0 == n % numbers[0]:
            temp.append(n)
    for n in temp:
        numbers.remove(n)

print "## Q7 ## %d" % len(results)
# 168
################################################################################
## Q8 ##
# We can use loops to simulate natural processes over time. Write a program that
# calculates the populations of two kinds of “wumpuses” over time.
# At the beginning of year 1, there are 1000 slow wumpuses and 1 fast wumpus.
# This one fast wumpus is a new mutation. Not surprisingly, being fast gives it
# an advantage, as it can better escape from predators. Each year, each wumpus 
# has one offspring. (We'll ignore the more realistic niceties of sexual 
# reproduction, like distinguishing males and females.). There are no further 
# mutations, so slow wumpuses beget slow wumpuses, and fast wumpuses beget fast 
# wumpuses. Also, each year 40% of all slow wumpuses die each year, while only 
# 30% of the fast wumpuses do.
#
# So, at the beginning of year one there are 1000 slow wumpuses. Another 1000 
# slow wumpuses are born. But, 40% of these 2000 slow wumpuses die, leaving a 
# total of 1200 at the end of year one. Meanwhile, in the same year, we begin 
# with 1 fast wumpus, 1 more is born, and 30% of these die, leaving 1.4. 
# (We'll also allow fractional populations, for simplicity.)
# Beginning of Year	Slow Wumpuses	Fast Wumpuses
# 1	 1000	1
# 2	 1200	1.4
# 3	 1440	1.96
# …	    …	…
# Enter the first year in which the fast wumpuses outnumber the slow wumpuses.
# Remember that the table above shows the populations at the start of the year.

year = 1
slow_wumpus = 1000.0
fast_wumpus = 1.0
while slow_wumpus > fast_wumpus:
    if year < 100:
        print "%2d %12.1f %12.3f" % (year, slow_wumpus, fast_wumpus)
    year += 1
    slow_wumpus *= 2
    fast_wumpus *= 2
    to_die = (slow_wumpus/100)*40
    slow_wumpus -= to_die
    to_die = (fast_wumpus/100)*30
    fast_wumpus -= to_die
print "%2d %12.1f %12.3f" % (year, slow_wumpus, fast_wumpus)
print "At the end of %2d around %12.1f %12.3f" % (year - 1, slow_wumpus, fast_wumpus)

################################################################################
#EOF
# vim: syntax=python:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
