#!/usr/bin/python
# -*- coding: utf-8 -*-
################################################################################
# http://www.codeskulptor.org/#user40_TDVdtJuWEH_4.py
# http://www.codeskulptor.org/#user40_YV6GEfPyvt_2.py
################################################################################
# Testing template for the Hand class

import simplegui
import random

# define globals for cards
SUITS = ['C', 'S', 'H', 'D']
RANKS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K']
VALUES = {'A':1, '2':2, '3':3, '4':4, '5':5, '6':6, '7':7, '8':8, '9':9, 'T':10, 'J':10, 'Q':10, 'K':10}


# define card class
class Card:
    def __init__(self, suit, rank):
        if (suit in SUITS) and (rank in RANKS):
            self.suit = suit
            self.rank = rank
        else:
            print "Invalid card: ", suit, rank

    def __str__(self):
        return self.suit + self.rank

    def get_suit(self):
        return self.suit

    def get_rank(self):
        return self.rank

    def draw(self, canvas, pos):
        card_loc = (card_size[0] * (0.5 + RANKS.index(self.rank)), card_size[1] * (0.5 + SUITS.index(self.suit)))
        canvas.draw_image(card_images, card_loc, card_size, [pos[0] + card_size[0] / 2, pos[1] + card_size[1] / 2], card_size)
#end class Card

################################################################################
# code for Hand class here
# the implementation of the Card class here
# define hand class
class Hand:
    def __init__(self):
        # create Hand object
        self.cards = []
        pass
    #end def __init__(self)

    def __str__(self):
        """
        # return a string representation of a hand
        """
        result = "Hand contains"
        for i in range(len(self.cards)):
            result += (" " + str(self.cards[i]))
        return result
        pass	
    #end def __str__(self)

    def add_card(self, card):
        self.cards.append(card)
        pass	# add a card object to a hand
    #end def add_card(self, card)

    def get_value(self):
        """
        # compute the value of the hand, see Blackjack video
        # count aces as 1, if the hand has an ace, 
        # then add 10 to hand value if it doesn't bust
        """
        value = 0
        count_aces = 0
        for c in self.cards:
            if 'A' != c.get_rank():
                value += VALUES[c.get_rank()]
            else:
                count_aces += 1
            #end if 'A' != r
        #end for r in self.cards:
        if 1 == count_aces:
            if value < 11:
                value += 11
            else:
                value += 1
            #end if value < 10
        #end if 1 == count_aces
        elif 2 == count_aces:
            if value < 10:
                value += 12
            else:
                value += 2
            #end if value < 10
        #end elif 2 == count_aces
        elif count_aces > 1:
            value += count_aces
        #end elif count_aces > 1
        return value
    #end def get_value(self)
   
    def draw(self, canvas, pos):
        pass	# draw a hand on the canvas, use the draw method for cards
#end class Hand

# define deck class 
class Deck:
    def __init__(self):
        """
        # create a Deck object
        """
        #self.cards = []
        #for r in RANKS:
        #    for s in SUITS:
        #        self.cards.append(Card(s, r))
        self.cards = [Card(s, r) for s in SUITS for r in RANKS ]
        pass	
    #end def __init__(self)

    def shuffle(self):
        # shuffle the deck 
        # use random.shuffle()
        random.shuffle(self.cards)
    #end def shuffle(self)

    def deal_card(self):
        return self.cards.pop(-1)
        pass	# deal a card object from the deck
    #end def deal_card(self):
    
    def __str__(self):
        """
        # return a string representing the deck
        """
        result = "Deck contains "
        for i in range(len(self.cards)):
            result += (" " + str(self.cards[i]))
        return result
        pass	
    #end def __str__(self)
#end class Deck
################################################################################

################################################################################
# Test code

print "###TEST Card Class Code#########################################################"
c1 = Card("S", "A")
print c1
print c1.get_suit(), c1.get_rank()
print type(c1)

c2 = Card("C", "2")
print c2
print c2.get_suit(), c2.get_rank()
print type(c2)

c3 = Card("D", "T")
print c3
print c3.get_suit(), c3.get_rank()
print type(c3)


################################################################################
# Output to console

#SA
#S A
#<class '__main__.Card'>
#C2
#C 2
#<class '__main__.Card'>
#DT
#D T
#<class '__main__.Card'>
    
################################################################################
# Test code

print "###TEST Hand Class Code#########################################################"
c1 = Card("S", "A")
c2 = Card("C", "2")
c3 = Card("D", "T")
print c1, c2, c3
print type(c1), type(c2), type(c3)

test_hand = Hand()
print test_hand

test_hand.add_card(c1)
print test_hand

test_hand.add_card(c2)
print test_hand

test_hand.add_card(c3)
print test_hand

print type(test_hand)

################################################################################
# Output to console
# note that the string representation of a hand will 
# vary based on how you implemented the __str__ method

#SA C2 DT
#<class '__main__.Card'> <class '__main__.Card'> <class '__main__.Card'>
#Hand contains 
#Hand contains SA 
#Hand contains SA C2 
#Hand contains SA C2 DT 
#<class '__main__.Hand'>

print "###TEST Card Class Code get_value()#############################################"

c1 = Card("S", "A")
c2 = Card("C", "2")
c3 = Card("D", "T")
c4 = Card("S", "K")
c5 = Card("C", "7")
c6 = Card("D", "A")

test_hand = Hand()
print test_hand
print test_hand.get_value()

test_hand.add_card(c2)
print test_hand
print test_hand.get_value()

test_hand.add_card(c5)
print test_hand
print test_hand.get_value()

test_hand.add_card(c3)
print test_hand
print test_hand.get_value()

test_hand.add_card(c4)
print test_hand
print test_hand.get_value()



test_hand = Hand()
print test_hand
print test_hand.get_value()

test_hand.add_card(c1)
print test_hand
print test_hand.get_value()

test_hand.add_card(c6)
print test_hand
print test_hand.get_value()

test_hand.add_card(c4)
print test_hand
print test_hand.get_value()

test_hand.add_card(c5)
print test_hand
print test_hand.get_value()

test_hand.add_card(c3)
print test_hand
print test_hand.get_value()



###################################################
# Output to console
# note that the string representation of a hand may vary
# based on your implementation of the __str__ method

#Hand contains 
#0
#Hand contains C2 
#2
#Hand contains C2 C7 
#9
#Hand contains C2 C7 DT 
#19
#Hand contains C2 C7 DT SK 
#29
#Hand contains 
#0
#Hand contains SA 
#11
#Hand contains SA DA 
#12
#Hand contains SA DA SK 
#12
#Hand contains SA DA SK C7 
#19
#Hand contains SA DA SK C7 DT 
#29

################################################################################
# Test code

print "###TEST Deck Class Code#########################################################"

test_deck = Deck()
print test_deck
print type(test_deck)

c1 = test_deck.deal_card()
print c1
print type(c1)
print test_deck

c2 = test_deck.deal_card()
print c2
print type(c2)
print test_deck

test_deck = Deck()
print test_deck
print "###shuffle######################################################################"
test_deck.shuffle()
print test_deck
print type(test_deck)

c3 = test_deck.deal_card()
print c3
print type(c3)
print test_deck

################################################################################
# Output to console
# output of string method for decks depends on your implementation of __str__
# note the output of shuffling is randomized so the exact order of cards
# need not match

#Deck contains CA C2 C3 C4 C5 C6 C7 C8 C9 CT CJ CQ CK SA S2 S3 S4 S5 S6 S7 S8 S9 ST SJ SQ SK HA H2 H3 H4 H5 H6 H7 H8 H9 HT HJ HQ HK DA D2 D3 D4 D5 D6 D7 D8 D9 DT DJ DQ DK 
#<class '__main__.Deck'>
#DK
#<class '__main__.Card'>
#Deck contains CA C2 C3 C4 C5 C6 C7 C8 C9 CT CJ CQ CK SA S2 S3 S4 S5 S6 S7 S8 S9 ST SJ SQ SK HA H2 H3 H4 H5 H6 H7 H8 H9 HT HJ HQ HK DA D2 D3 D4 D5 D6 D7 D8 D9 DT DJ DQ 
#DQ
#<class '__main__.Card'>
#Deck contains CA C2 C3 C4 C5 C6 C7 C8 C9 CT CJ CQ CK SA S2 S3 S4 S5 S6 S7 S8 S9 ST SJ SQ SK HA H2 H3 H4 H5 H6 H7 H8 H9 HT HJ HQ HK DA D2 D3 D4 D5 D6 D7 D8 D9 DT DJ 
#Deck contains CA C2 C3 C4 C5 C6 C7 C8 C9 CT CJ CQ CK SA S2 S3 S4 S5 S6 S7 S8 S9 ST SJ SQ SK HA H2 H3 H4 H5 H6 H7 H8 H9 HT HJ HQ HK DA D2 D3 D4 D5 D6 D7 D8 D9 DT DJ DQ DK 
#Deck contains CT H6 C4 H9 D6 HJ D2 S5 D8 H2 ST H4 HQ HK S8 D3 CJ D5 DK DQ DA S9 S6 S2 DJ C8 SJ C9 D4 C7 SK CK S3 CA SA S4 CQ S7 HA H3 C5 D9 DT H7 HT C2 SQ H8 C6 D7 C3 H5 
#<class '__main__.Deck'>
#H5
#<class '__main__.Card'>
#Deck contains CT H6 C4 H9 D6 HJ D2 S5 D8 H2 ST H4 HQ HK S8 D3 CJ D5 DK DQ DA S9 S6 S2 DJ C8 SJ C9 D4 C7 SK CK S3 CA SA S4 CQ S7 HA H3 C5 D9 DT H7 HT C2 SQ H8 C6 D7 C3 
################################################################################
#EOF
# vim: syntax=python:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
