/// @description Insert description here
// You can write your code in this editor

event_inherited()

dir = instance_nearest(x,y,obj_enemyGun).dir  + random_range(-10,10)
targets = [obj_player,obj_enemy]
invincible = false
