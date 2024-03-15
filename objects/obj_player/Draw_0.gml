/// @description Insert description here
// You can write your code in this editor

if xInput != 0{
	moveDirX=xInput
}
if grounded{
	if !(xVel == 0 && yVel == 0){
		sprite_index = animRun
	}else{
		sprite_index = animIdle
	}
}
if !inCutscene{
	if !dying{
		image_xscale = -moveDirX
	}
}
if burrowing{
	sprite_index = animBurrow
	if image_index > image_number-1{
		burrowed = true
		burrowing = false
		//show_debug_message("TEST")
	}
}

if burrowed{
	sprite_index = animDug
}
if emerging{
	sprite_index = animEmerge
	if image_index > image_number-1{
		grounded = true
		emerging = false
		//show_debug_message("TEST")
	}
}

if dying{
	xInput = 0
	yInput = 0
	sprite_index = animDeath
	if image_index > 3{
		dead = true
		image_speed = 0
		image_index = 4
	}
}
if dead{
	sprite_index = animDeath
	image_index = 4
}
if flashTime > 0{
	flashTime -= 1
	sprite_index = animFlash
}

//if burrowTimer < burrowMax{
//draw_circle(x,y,50,true)
//draw_sprite(spr_scDeath,0,x,y)
//}
if !burrowed && !latched{
	draw_sprite(spr_shadow,0,x,y)
}

if diving{
	sprite_index = animDive
	diveDir = point_direction(0,0,diveX,diveY)
	if diveDir < 90 || diveDir > 270{
		image_xscale = -1
	}else{
		image_xscale = 1
	}
	if image_index > image_number-1{
		diving2 = true
		diving = false
	}
}
if diving2{
	sprite_index = animDiving
	diveDir = point_direction(0,0,diveX,diveY)
	if diveDir < 90 || diveDir > 270{
		image_xscale = -1
	}else{
		image_xscale = 1
	}
}
depth = -y/100
if latched{
	image_xscale = latchTarget.xDir
	if latchTarget.yDir == 1{
		sprite_index = animLatchB
		depth -= 10
	}else{
		sprite_index = animLatchF
	}
}

draw_self()

if (grounded || burrowing || burrowed || emerging) && !dying{
	draw_set_alpha(0.5)
	draw_set_color(c_grey)
	draw_rectangle(x-6,y+3,x+5,y+4,false)
	draw_set_color(c_yellow)
	draw_rectangle(x-6,y+3,x-5+lerp(0,10,burrowTimer/burrowMax),y+4,false)
	draw_set_alpha(1)
}
