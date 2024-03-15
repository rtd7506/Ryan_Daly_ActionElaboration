/// @description Insert description here
// You can write your code in this editor
if mounted{
	image_xscale = host.image_xscale
}else if falling{
	yVel=0.5
}else if escaping{
	xVel = lengthdir_x(moveSpd,escapeDir)
	yVel = lengthdir_y(moveSpd,escapeDir)
	image_xscale = -xVel/abs(xVel)
}else if burrowing{
	xVel=0
	yVel=0
}

//Collisions
if !mounted{
	if !place_meeting(x+xVel,y,obj_wall){
		x+=xVel
	}
	if !place_meeting(x,y+yVel,obj_wall){
		y+=yVel
	}
}
/*
x = host.x
y = host.y-9
*/



//Forces
if forceX != 0 || forceY != 0{
	if forceX > forceDecay{
		forceX -= forceDecay
	}else if forceX < -forceDecay{
		forceX += forceDecay
	}else{
		forceX = 0
	}
	
	if forceY > forceDecay{
		forceY -= forceDecay
	}else if forceY < -forceDecay{
		forceY += forceDecay
	}else{
		forceY = 0
	}
}