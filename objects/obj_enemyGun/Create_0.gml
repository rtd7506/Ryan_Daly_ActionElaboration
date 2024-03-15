/// @description Insert description here
// You can write your code in this editor

dir = 0
aimDir = 0
host = instance_nearest(x,y,obj_enemy)
length = 14
alarm[0] = 1

shootStep = 45
alarm[1] = shootStep

randomAimStep = 240
alarm[2] = irandom_range(60,randomAimStep)
latchShots = 10