#!/usr/bin/python
# -*- coding: utf-8 -*-
################################################################################
# http://www.codeskulptor.org/#user40_dZNt2vlKBD_4.py
# blackjack_template.py
################################################################################

# Mini-project #6 - Blackjack

debug = True

import simplegui
import random

# load card sprite - 936x384 - source: jfitz.com
CARD_SIZE = (72, 96)
CARD_CENTER = (36, 48)
card_images = simplegui.load_image("http://storage.googleapis.com/codeskulptor-assets/cards_jfitz.png")

CARD_BACK_SIZE = (72, 96)
CARD_BACK_CENTER = (36, 48)
card_back = simplegui.load_image("http://storage.googleapis.com/codeskulptor-assets/card_jfitz_back.png")

# initialize some useful global variables
in_play = False
outcome = ""
score = 0

# define globals for cards
SUITS = ('C', 'S', 'H', 'D')
RANKS = ('A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K')
VALUES = {
        'A':1, '2':2, '3':3, '4':4, '5':5, '6':6, '7':7, '8':8, '9':9, 'T':10,
        'J':10, 'Q':10, 'K':10}
deck = None
dealer = None
player = None

################################################################################
# define card class
class Card:
    def __init__(self, suit, rank):
        if (suit in SUITS) and (rank in RANKS):
            self.suit = suit
            self.rank = rank
        else:
            self.suit = None
            self.rank = None
            print "Invalid card: ", suit, rank

    def __str__(self):
        return self.suit + self.rank

    def get_suit(self):
        return self.suit

    def get_rank(self):
        return self.rank

    def draw(self, canvas, pos):
        card_loc = (CARD_CENTER[0] + CARD_SIZE[0] * RANKS.index(self.rank), 
                    CARD_CENTER[1] + CARD_SIZE[1] * SUITS.index(self.suit))
        canvas.draw_image(card_images, card_loc, CARD_SIZE, 
                          [pos[0] + CARD_CENTER[0], pos[1] + CARD_CENTER[1]],
                          CARD_SIZE)
#end class Card
################################################################################
        
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
        elif count_aces > 2:
            value += count_aces
        #end elif count_aces > 2
        return value
    #end def get_value(self)
   
    def draw(self, canvas, pos):
        pass	# draw a hand on the canvas, use the draw method for cards
#end class Hand
################################################################################
        
################################################################################
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

#define event handlers for buttons
def deal():
    global outcome, in_play, deck, dealer, player
    # your code goes here
    deck = Deck()
    if debug:
        print "## DEBUG Deck Class Code #######################################"
        print type(deck)
        print deck
    #end if debug
    deck.shuffle()
    if debug:
        print "###shuffle######################################################"
        print type(deck)
        print deck
    #end if debug
    dealer = Hand()
    if debug:
        print "## DEBUG Hand Class Code #######################################"
        print "## DEBUG dealer ################################################"
        print type(dealer)
        print dealer
    #end if debug
    dealer.add_card(deck.deal_card())
    dealer.add_card(deck.deal_card())
    if debug:
        print "## DEBUG dealer add deal two cards #############################"
        print type(dealer)
        print dealer
    #end if debug
    player = Hand()
    if debug:
        print "## DEBUG player ################################################"
        print type(player)
        print player
    #end if debug
    player.add_card(deck.deal_card())
    player.add_card(deck.deal_card())
    if debug:
        print "## DEBUG player add deal two cards #############################"
        print type(player)
        print player
    #end if debug
    if debug:
        print "## DEBUG Deck Class Code first deal ############################"
        print type(deck)
        print deck
    #end if debug
    in_play = True
#end def deal()
    
def hit():
    """
    # replace with your code below
    """
    global in_play
    if not in_play:
        return
    global player, score
    if player.get_value() > 21:
        print "You have busted"
        return
    # end if player.get_value() > 21
    # if the hand is in play, hit the player
    if player.get_value() < 22:
        player.add_card(deck.deal_card())
    #end if player.get_value() < 22
    if debug:
        print "## DEBUG player ################################################"
        print type(player)
        print player
    #end if debug
    # if busted, assign a message to outcome, update in_play and score
    if player.get_value() > 21:
        print "You have busted = %d" % player.get_value()
        score -= 1
    #end if player.get_value() > 21
#end def hit()
       
def stand():
    """
    # replace with your code below
    """
    global in_play
    if not in_play:
        return
    global dealer, player, score
    if player.get_value() > 21:
        print "You have busted = %d" % player.get_value()
        return
    # end if player.get_value() > 21
    # if hand is in play, repeatedly hit dealer until his hand has value 17 or 
    #     more
    # while the value of the dealer's hand is less than 17
    #     hit the dealer's hand
    while dealer.get_value() < 17:
        dealer.add_card(deck.deal_card())
        if debug:
            print "## DEBUG dealer while loop##################################"
            print type(dealer)
            print dealer
        #end if debug
    #end while dealer.get_value() < 17
    # assign a message to outcome, update in_play and score
    print "You have = %d" % player.get_value()
    if dealer.get_value() > 21:
        print "The dealer busted = %d" % dealer.get_value()
        score -= 1
    #end if dealer.get_value() > 21
    elif player.get_value() <= dealer.get_value():
        print "The dealer win = %d" % dealer.get_value()
        score -= 1
    #end elif player.get_value() <= dealer.get_value()
    else:
        print "You win!"
        print "The dealer have = %d" % dealer.get_value()
        score += 1
    #end else
    in_play = False
#end def stand()

# draw handler    
def draw(canvas):
    # test to make sure that card.draw works, replace with your code below
    
    card = Card("S", "A")
    card.draw(canvas, [300, 300])


# initialization frame
frame = simplegui.create_frame("Blackjack", 600, 600)
frame.set_canvas_background("Green")

#create buttons and canvas callback
frame.add_button("Deal", deal, 200)
frame.add_button("Hit",  hit, 200)
frame.add_button("Stand", stand, 200)
frame.set_draw_handler(draw)


# get things rolling
deal()
frame.start()


# remember to review the gradic rubric

################################################################################
#EOF
# vim: syntax=python:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
