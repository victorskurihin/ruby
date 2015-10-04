#!/usr/bin/python
# -*- coding: utf-8 -*-
################################################################################
# http://www.codeskulptor.org/#user40_MR40fGIFIH_13.py
# Spaceship.py
################################################################################

# program template for Spaceship
import simplegui
import math
import random
import time

# my initialize globals
debug = True
debug_level = 1

# globals for user interface
WIDTH = 800
HEIGHT = 600
MISSILE_VEL = 5
SHIP_VEL_DEV = 1.025
SHIP_VEL_MUL = 0.75
SHIP_VEL_LIM = 10
sound_time = 0
score = 0
lives = 3
time = 0

class ImageInfo:
    def __init__(self, center, size, radius = 0, lifespan = None, animated = False):
        self.center = center
        self.size = size
        self.radius = radius
        if lifespan:
            self.lifespan = lifespan
        else:
            self.lifespan = float('inf')
        self.animated = animated

    def get_center(self):
        return self.center

    def get_size(self):
        return self.size

    def get_radius(self):
        return self.radius

    def get_lifespan(self):
        return self.lifespan

    def get_animated(self):
        return self.animated

#end class ImageInfo:
    
# art assets created by Kim Lathrop, may be freely re-used in non-commercial projects, please credit Kim
    
# debris images - debris1_brown.png, debris2_brown.png, debris3_brown.png, debris4_brown.png
#                 debris1_blue.png, debris2_blue.png, debris3_blue.png, debris4_blue.png, debris_blend.png
debris_info = ImageInfo([320, 240], [640, 480])
debris_image = simplegui.load_image("http://commondatastorage.googleapis.com/codeskulptor-assets/lathrop/debris2_blue.png")

# nebula images - nebula_brown.png, nebula_blue.png
nebula_info = ImageInfo([400, 300], [800, 600])
nebula_image = simplegui.load_image("http://commondatastorage.googleapis.com/codeskulptor-assets/lathrop/nebula_blue.f2014.png")

# splash image
splash_info = ImageInfo([200, 150], [400, 300])
splash_image = simplegui.load_image("http://commondatastorage.googleapis.com/codeskulptor-assets/lathrop/splash.png")

# ship image
ship_info = ImageInfo([45, 45], [90, 90], 35)
ship_image = simplegui.load_image("http://commondatastorage.googleapis.com/codeskulptor-assets/lathrop/double_ship.png")

# missile image - shot1.png, shot2.png, shot3.png
missile_info = ImageInfo([5,5], [10, 10], 3, 50)
missile_image = simplegui.load_image("http://commondatastorage.googleapis.com/codeskulptor-assets/lathrop/shot2.png")

# asteroid images - asteroid_blue.png, asteroid_brown.png, asteroid_blend.png
asteroid_info = ImageInfo([45, 45], [90, 90], 40)
asteroid_image = simplegui.load_image("http://commondatastorage.googleapis.com/codeskulptor-assets/lathrop/asteroid_blue.png")

# animated explosion - explosion_orange.png, explosion_blue.png, explosion_blue2.png, explosion_alpha.png
explosion_info = ImageInfo([64, 64], [128, 128], 17, 24, True)
explosion_image = simplegui.load_image("http://commondatastorage.googleapis.com/codeskulptor-assets/lathrop/explosion_alpha.png")

# sound assets purchased from sounddogs.com, please do not redistribute
soundtrack = simplegui.load_sound("http://commondatastorage.googleapis.com/codeskulptor-assets/sounddogs/soundtrack.mp3")
missile_sound = simplegui.load_sound("http://commondatastorage.googleapis.com/codeskulptor-assets/sounddogs/missile.mp3")
missile_sound.set_volume(.5)
ship_thrust_sound = simplegui.load_sound("http://commondatastorage.googleapis.com/codeskulptor-assets/sounddogs/thrust.mp3")
explosion_sound = simplegui.load_sound("http://commondatastorage.googleapis.com/codeskulptor-assets/sounddogs/explosion.mp3")

# helper functions to handle transformations
def angle_to_vector(ang):
    return [math.cos(ang), math.sin(ang)]
#end def angle_to_vector(ang):

def vector_product(a, b):
    return a[0]*b[0] + a[1]*b[1]
#end def dist(p,q):

def vector_lenght(v):
    return dist(v, [0, 0])
#def vector_lenght(v):

def dist(p,q):
    return math.sqrt((p[0] - q[0]) ** 2+(p[1] - q[1]) ** 2)
#end def dist(p,q):

# Ship class
class Ship:
    def __init__(self, pos, vel, angle, image, info):
        self.pos = [pos[0], pos[1]]
        self.vel = [vel[0], vel[1]]
        self.thrust = False
        self.play = False
        self.angle = angle
        self.angle_vel = 0
        self.image = image
        self.image_center = info.get_center()
        self.image_center_x_no_thrust = self.image_center[0]
        self.image_size = info.get_size()
        self.radius = info.get_radius()
        self.forward = []
    #end def __init__(self, pos, vel, angle, image, info):
        
    def draw(self,canvas):
        canvas.draw_image(self.image, self.image_center,
                          self.image_size, self.pos,  
                          self.image_size, self.angle)
    #end def draw(self,canvas):

    def update(self):
        self.angle += self.angle_vel
        self.forward = angle_to_vector(self.angle)
        if debug and debug_level > 1:
            print("Ship.update(): angle=%f" % 
                  (self.angle))
            print("Ship.update(): vector[%d,%d]" % 
                  (self.forward[0], self.forward[1]))
        if self.thrust:
            if debug and debug_level > 1:
                print("Ship(%s).update(): vel[%d,%d]" % 
                      (str(self), self.vel[0], self.vel[1]))
            if abs(self.vel[0]) < abs(SHIP_VEL_LIM*self.forward[0]):
                self.vel[0] += (self.forward[0]*SHIP_VEL_MUL)
            if abs(self.vel[1]) < abs(SHIP_VEL_LIM*self.forward[1]):
                self.vel[1] += (self.forward[1]*SHIP_VEL_MUL)
            if debug and debug_level > 1:
                print("Ship(%s).update(): vel[%d,%d]" % 
                      (str(self), self.vel[0], self.vel[1]))
        else: # for if self.thrust:
            self.vel[0] /= SHIP_VEL_DEV
            self.vel[1] /= SHIP_VEL_DEV
        #end if self.thrust:
        self.pos[0] += int(self.vel[0])
        self.pos[1] += int(self.vel[1])
        self.pos[0] %= WIDTH
        self.pos[1] %= HEIGHT
    #end def update(self):

    def get_thrust(self, status = False):
        return self.thrust
    #end def get_thrust(self, status = False)

    def set_thrust(self, status = False):
        self.thrust = status
        if status:
            self.image_center[0] += (self.image_center_x_no_thrust*2)
            if not self.play:
                self.play = True
                ship_thrust_sound.play()
            #end if not self.play:
        else: #for if status:
            self.image_center[0] = self.image_center_x_no_thrust
            if self.play:
                ship_thrust_sound.pause()
                self.play = False
                ship_thrust_sound.rewind
            #end if self.play:
        #end else if status:
    #end def thrust(self):

    def shoot(self, vel = 0):
        global a_missile
        v = angle_to_vector(self.angle)
        # p = vector_product(self.vel, v) / vector_lenght(v)
        vel = [self.vel[0] + 3*v[0], self.vel[1] + 3*v[1] ]
        if debug:
            print "v[%0.3e,%0.3e]" % (v[0], v[1])
        # vel = [ int(1.5*abs(p)*v[0]) , int(1.5*abs(p)*v[1]) ]
        if debug:
            print "vel[%d,%d]" % (vel[0], vel[1])
        pos = list(self.pos)
        pos[0] += (v[0]*self.image_center_x_no_thrust)
        pos[1] += (v[1]*self.image_center[1])
        vector = angle_to_vector(self.angle)
        vel_missile = [ vector[0]*MISSILE_VEL + self.vel[0], 
                        vector[1]*MISSILE_VEL + self.vel[1] ]
        a_missile = Sprite(pos, vel_missile, 0, 0, missile_image, 
                           missile_info, missile_sound)
    #end def set_thrust(self):

    def set_angle_vel(self, vel = 0):
        self.angle_vel = vel
    #end def set_thrust(self):
#end class Ship:

# Sprite class
class Sprite:
    def __init__(self, pos, vel, ang, ang_vel, image, info, sound = None):
        self.pos = [pos[0],pos[1]]
        self.vel = [vel[0],vel[1]]
        self.angle = ang
        self.angle_vel = ang_vel
        self.image = image
        self.image_center = info.get_center()
        self.image_size = info.get_size()
        self.radius = info.get_radius()
        self.lifespan = info.get_lifespan()
        self.animated = info.get_animated()
        self.age = 0
        if sound:
            sound.rewind()
            sound.play()
    #end def __init__(self, pos, vel, ang, ang_vel, image, info, sound = None):
   
    def draw(self, canvas):
        canvas.draw_image(self.image, self.image_center,
                          self.image_size, self.pos,  
                          self.image_size, self.angle)
    #end def draw(self, canvas):
    
    def set_angle_vel(self, vel = 0):
        self.angle_vel = vel
    #end def set_thrust(self):

    def set_vel(self, vel = [0, 0]):
        self.vel = vel
    #end def set_thrust(self):

    def update(self):
        self.angle += self.angle_vel
        self.pos[0] += int(self.vel[0])
        self.pos[1] += int(self.vel[1])
        self.pos[0] %= WIDTH
        self.pos[1] %= HEIGHT
    #end def update(self):
#end class Sprite:

           
def draw(canvas):
    global time
    
    # animiate background
    time += 1
    wtime = (time / 4) % WIDTH
    center = debris_info.get_center()
    size = debris_info.get_size()
    canvas.draw_image(nebula_image, nebula_info.get_center(),
                      nebula_info.get_size(), [WIDTH / 2, HEIGHT / 2],
                      [WIDTH, HEIGHT])
    canvas.draw_image(debris_image, center, size,
                      (wtime - WIDTH / 2, HEIGHT / 2), (WIDTH, HEIGHT))
    canvas.draw_image(debris_image, center, size,
                      (wtime + WIDTH / 2, HEIGHT / 2), (WIDTH, HEIGHT))

    # draw ship and sprites
    my_ship.draw(canvas)
    a_rock.draw(canvas)
    a_missile.draw(canvas)
    
    # update ship and sprites
    my_ship.update()
    a_rock.update()
    a_missile.update()
#end def draw(canvas):

RND1 = 10
RND2 = 0.8
RND3 = 0.005
RND4 = 5.428
RND5 = 0.7
RND6 = 1.5
RND7 = 0.4

# timer handler that spawns a rock    
def rock_spawner():
    global a_rock
    a_rock = Sprite([random.randrange(WIDTH), random.randrange(HEIGHT)],
                    [1, 1], 0, 0, asteroid_image, asteroid_info)
    r = random.random()
    a = ((r/RND1)*(r - RND2) + RND3)
    a_rock.set_angle_vel(a)
    r0 = random.random()
    r1 = random.random()
    v0 = ((r0*RND4)*(r0 - RND5) + (r1*RND6)*(r1 - RND7))*2
    v1 = ((r1*RND4)*(r1 - RND5) + (r0*RND6)*(r0 - RND7))*2
    if debug and debug_level > 1:
        print "a: %0.4f, r: %0.4f, v0: %0.4f, r0: %0.4f, v1: %0.4f, r1: %0.4f\n" % \
                (a, r, v0, r0, v1, r1)
    a_rock.set_vel([v0,v1])
#end def rock_spawner():

def keydown(key):
    global my_ship
    if key == simplegui.KEY_MAP["down"]:
        my_ship.set_thrust(True)
    elif key == simplegui.KEY_MAP["up"]:
        my_ship.set_thrust(True)

    if key == simplegui.KEY_MAP["left"]:
        my_ship.set_angle_vel(-0.15)
    elif key == simplegui.KEY_MAP["right"]:
        my_ship.set_angle_vel(0.15)

    if key == simplegui.KEY_MAP["space"]:
        my_ship.shoot()
#end def keydown(key)

def keyup(key):
    global my_ship
    if key == simplegui.KEY_MAP["down"]:
        my_ship.set_thrust(False)
    elif key == simplegui.KEY_MAP["up"]:
        my_ship.set_thrust(False)

    if key == simplegui.KEY_MAP["left"]:
        my_ship.set_angle_vel(0)
    elif key == simplegui.KEY_MAP["right"]:
        my_ship.set_angle_vel(0)
#end def keyup(key)

scale = 100
time_tick = 0

# define event handlers
def tick():
    global my_ship
    global time_tick
    global sound_time
    global my_ship
    time_tick = time_tick + 1
    if debug and 0 == time_tick % scale:
        # print "tick %03d: " % (int(time_tick/scale))
        pass
    if 0 == time_tick % scale:
        my_ship.update()
    #end if 0 == time_tick % 10:
    if my_ship.get_thrust():
        sound_time += 1
        if sound_time > 500:
            my_ship.set_thrust(False)
            my_ship.set_thrust(True)
            
#end def tick()

# initialize frame
frame = simplegui.create_frame("Asteroids", WIDTH, HEIGHT)

# initialize ship and two sprites
my_ship = Ship([WIDTH / 2, HEIGHT / 2], [0, 0], 0, ship_image, ship_info)
a_rock = Sprite([WIDTH / 3, HEIGHT / 3], [1, 1], 0, 0, asteroid_image, asteroid_info)
a_missile = Sprite([2 * WIDTH / 3, 2 * HEIGHT / 3], [-1,1], 0, 0, missile_image, missile_info, missile_sound)

# register handlers
frame.set_draw_handler(draw)
frame.set_keydown_handler(keydown)
frame.set_keyup_handler(keyup)

tmrtk = simplegui.create_timer(45, tick)
timer = simplegui.create_timer(1000.0, rock_spawner)

# get things rolling
tmrtk.start()
timer.start()
frame.start()

################################################################################
# TODO
# http://www.codeskulptor.org/#user40_RrPOEFKCwLqSnEz.py Very Good!
# http://www.codeskulptor.org/#user40_82DAN7LGrqlljbF.py Ok
# http://www.codeskulptor.org/#user40_VXLJoI9HdkToAks.py Bad
# http://www.codeskulptor.org/#user40_FydFZTw31q_13.py Good.
# http://www.codeskulptor.org/#user40_d7i2uDalxN_8.py Ok Ok Angle!
################################################################################
#EOF
# vim: syntax=python:fileencoding=utf-8:fileformat=unix:tw=78:ts=4:sw=4:sts=4:et
