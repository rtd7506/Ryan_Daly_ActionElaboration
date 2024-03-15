/// @description Insert description here
// You can write your code in this editor

var gunDir = gun.dir mod 360
if gunDir < 0{
	gunDir += 360
}
if gunDir < 90 || gunDir > 270{
	xDir = 1
}else{
	xDir = -1
}
if gunDir < 15 || gunDir > 165{
	yDir = 0
}else{
	yDir = 1
}

image_xscale = xDir
if xVel == 0 && yVel == 0{
	sprite_index = animsIdle[yDir]
}else{
	sprite_index = animsRun[yDir]
}

if dying{
	sprite_index = spr_scDeath
	//show_debug_message(image_index)
	if image_index > 3{
		dead = true
		image_speed = 0
		image_index = 5
	}
}
if dead{
	sprite_index = spr_scDeath
	image_index = 5
}
if flashTime > 0{
	flashTime -= 1
	sprite_index = spr_scFlash
}
draw_sprite(spr_shadow,0,x,y+5)
draw_self()


