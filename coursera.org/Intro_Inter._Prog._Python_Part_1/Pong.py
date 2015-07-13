#!/usr/bin/python
################################################################################
# http://www.codeskulptor.org/#user40_DY5aJAiVrF_6.py
################################################################################
# Implementation of classic arcade game Pong

import simplegui
import random

# initialize globals - pos and vel encode vertical info for paddles
WIDTH = 600
HEIGHT = 400       
BALL_RADIUS = 20
PAD_WIDTH = 8
PAD_HEIGHT = 80
HALF_PAD_WIDTH = PAD_WIDTH / 2
HALF_PAD_HEIGHT = PAD_HEIGHT / 2
LEFT = False
RIGHT = True

# my initialize globals
time_tick = 0
scale = 100
paddle_speed = 6
ball_pos = [WIDTH / 2, HEIGHT / 2]
ball_rps = [ball_pos[0]*scale, ball_pos[1]*scale]
ball_vel = [int(5.55*scale), int(5.55*scale)] # pixels per update (1/60 seconds)
paddle1_vel = 0
paddle1_pos = HEIGHT / 2
paddle2_vel = 0
paddle2_pos = HEIGHT / 2

# initialize ball_pos and ball_vel for new bal in middle of table
# if direction is RIGHT, the ball's velocity is upper right, else upper left
def spawn_ball(direction):
    global ball_pos, ball_vel # these are vectors stored as lists
#end def spawn_ball(direction)

# define event handlers
def new_game():
    global paddle1_pos, paddle2_pos, paddle1_vel, paddle2_vel  # these are numbers
    global score1, score2  # these are ints
#end def new_game()

def check_pos(ball_pos):
    global ball_vel, paddle1_pos, paddle1_pos
    if BALL_RADIUS > ball_pos[1] or ball_pos[1] > (HEIGHT - BALL_RADIUS - 1):
        ball_vel[1] = -int(ball_vel[1]*1.01)
    #end if BALL_RADIUS > ball_pos[1] or ball_pos[1] > (HEIGHT - BALL_RADIUS)

    if (BALL_RADIUS + PAD_WIDTH) > ball_pos[0]:
        ball_vel[0] = -int(ball_vel[0]*1.01)
        if ball_pos[1] > paddle1_pos + PAD_HEIGHT + 1:
            print "FAIL1"
        #end if ball_pos[1] > paddle1_pos - PAD_HEIGHT
        elif ball_pos[1] < paddle1_pos - PAD_HEIGHT - 1:
            print "FAIL2"
        #end if ball_pos[1] > paddle1_pos - PAD_HEIGHT
    #end if (BALL_RADIUS + PAD_WIDTH) > ball_pos[0]

    if ball_pos[0] > (WIDTH - PAD_WIDTH - BALL_RADIUS - 1):
        ball_vel[0] = -int(ball_vel[0]*1.01)
        if ball_pos[1] > paddle2_pos + PAD_HEIGHT + 1:
            print "FAIL1"
        #end if ball_pos[1] > paddle2_pos - PAD_HEIGHT
        elif ball_pos[1] < paddle2_pos - PAD_HEIGHT - 1:
            print "FAIL2"
        #end if ball_pos[1] > paddle2_pos - PAD_HEIGHT
    #end if ball_pos[0] > (WIDTH - PAD_WIDTH - BALL_RADIUS - 1)

#end def check_pos():       

def update_ball():
    global score1, score2, paddle1_pos, paddle2_pos, ball_pos, ball_vel
    ball_rps[0] += ball_vel[0]
    ball_rps[1] += ball_vel[1]
    x = int(ball_rps[0] / scale)
    y = int(ball_rps[1] / scale)
    check_pos([x, y])
    ball_pos[0] = x
    ball_pos[1] = y
#end def update_ball(canvas)

def update_paddles():
    global paddle1_pos, paddle2_pos, paddle1_vel, paddle2_vel
    if (HEIGHT - PAD_HEIGHT/2 - 1) > paddle1_pos and paddle1_vel > 0:
        paddle1_pos += paddle1_vel
    elif PAD_HEIGHT/2 < paddle1_pos and paddle1_vel < 0:
        paddle1_pos += paddle1_vel
    if (HEIGHT - PAD_HEIGHT/2 - 1) > paddle2_pos and paddle2_vel > 0:
        paddle2_pos += paddle2_vel
    elif PAD_HEIGHT/2 < paddle2_pos and paddle2_vel < 0:
        paddle2_pos += paddle2_vel
#end def update_paddles()

def draw_ball(canvas):
    canvas.draw_circle(ball_pos, BALL_RADIUS, 2, "Red", "White")
#end def draw_ball(canvas, ball_pos)

def draw_paddles(canvas):
    global paddle1_pos, paddle_pos2
    canvas.draw_polygon([(0, paddle1_pos - HALF_PAD_HEIGHT), 
                         (PAD_WIDTH, paddle1_pos - HALF_PAD_HEIGHT), 
                         (PAD_WIDTH, paddle1_pos + HALF_PAD_HEIGHT), 
                         (0, paddle1_pos + HALF_PAD_HEIGHT)], 1, "White", "White")
    canvas.draw_polygon([(WIDTH, paddle2_pos - HALF_PAD_HEIGHT), 
                         (WIDTH - PAD_WIDTH, paddle2_pos - HALF_PAD_HEIGHT), 
                         (WIDTH - PAD_WIDTH, paddle2_pos + HALF_PAD_HEIGHT), 
                         (WIDTH, paddle2_pos + HALF_PAD_HEIGHT)], 1, "White", "White")    
#end def draw paddles(canvas)

def draw(canvas):
    global score1, score2, paddle1_pos, paddle2_pos, ball_pos, ball_vel

    # draw mid line and gutters
    canvas.draw_line([WIDTH / 2, 0],[WIDTH / 2, HEIGHT], 1, "White")
    canvas.draw_line([PAD_WIDTH, 0],[PAD_WIDTH, HEIGHT], 1, "White")
    canvas.draw_line([WIDTH - PAD_WIDTH, 0],[WIDTH - PAD_WIDTH, HEIGHT], 1, "White")
        
    # update ball
    # update_ball()
    # draw ball
    draw_ball(canvas)
    # update paddle's vertical position, keep paddle on the screen
    
    # draw paddles
    draw_paddles(canvas)
    # determine whether paddle and ball collide    
    
    # draw scores
#end def draw(canvas)

def keydown(key):
    global paddle1_vel, paddle2_vel, paddle_speed
    if key == simplegui.KEY_MAP["w"]:
        paddle1_vel -= paddle_speed
    elif key == simplegui.KEY_MAP["s"]:
        paddle1_vel += paddle_speed
    elif key == simplegui.KEY_MAP["down"]:
        paddle2_vel += paddle_speed
    elif key == simplegui.KEY_MAP["up"]:
        paddle2_vel -= paddle_speed
#end def keydown(key)

def keyup(key):
    global paddle1_vel, paddle2_vel
    if key == simplegui.KEY_MAP["w"]:
        paddle1_vel = 0
    elif key == simplegui.KEY_MAP["s"]:
        paddle1_vel = 0
    elif key == simplegui.KEY_MAP["down"]:
        paddle2_vel = 0
    elif key == simplegui.KEY_MAP["up"]:
        paddle2_vel = 0
#end def keyup(key)

# define event handlers
def tick():
    global time, ball_rps
    time_tick = time_tick + 1
    update_ball()
    update_paddles()
    if 0 == time_tick % 10:
        print "%03d: pos[%d,%d], vel[%d,%d]" % (time_tick, ball_pos[0], ball_pos[1], ball_vel[0], ball_vel[1])
#end def tick()

timer = simplegui.create_timer(60, tick)

# create frame
frame = simplegui.create_frame("Pong", WIDTH, HEIGHT)
frame.set_draw_handler(draw)
frame.set_keydown_handler(keydown)
frame.set_keyup_handler(keyup)

# start frame
new_game()
frame.start()
# register event handlers
timer.start()

#EOF
# vim: syntax=python:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et

