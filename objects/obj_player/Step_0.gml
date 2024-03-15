/// @description Insert description here
// You can write your code in this editor

if !dying && !inCutscene && !burrowing && !diving && !diving2{
	xInput=(keyboard_check(ord("D"))-keyboard_check(ord("A")))
	yInput=(keyboard_check(ord("S"))-keyboard_check(ord("W")))
}
if !latched{
	xVel=xInput*moveSpd+forceX+diveX
	yVel=yInput*moveSpd+forceY+diveY
}


if (abs(xVel)+abs(yVel)> moveSpd){
	xVel = xVel/sqrt(2)
	yVel = yVel/sqrt(2)
}

//Collisions
if !latched{
	if !place_meeting(x+xVel,y,obj_wall){
		x+=xVel
	}
	if !place_meeting(x,y+yVel,obj_wall){
		y+=yVel
	}
}else{
	x = latchTarget.x
	y = latchTarget.y
}

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
//Dive Forces
if diveX != 0 || diveY != 0{
	if diveX > diveDecay{
		diveX -= diveDecay
	}else if diveX < -diveDecay{
		diveX += diveDecay
	}else{
		diveX = 0
	}
	
	if diveY > diveDecay{
		diveY -= diveDecay
	}else if diveY < -diveDecay{
		diveY += diveDecay
	}else{
		diveY = 0
	}
}
if grounded{
	if (keyboard_check_pressed(vk_space) && burrowTimer >= burrowMax) && !dying{
		Burrow()
	}
}
if burrowed{
	invincible = true
	burrowTimer -= 1
	if (keyboard_check_pressed(vk_space) || burrowTimer < 0) && !dying{
		Emerge()
	}
	digStep+=1
	if digStep>digRate{
		digStep = 0
		instance_create_depth(x+random_range(-2,2),y+random_range(-2,2),340,obj_digVis)
		audio_play_sound(digSounds[irandom_range(0,array_length(digSounds)-1)],10,0,0.25,0,random_range(0.75,1.25))
	}
}else{
	if burrowTimer < burrowMax{
		burrowTimer += 0.25
	}
}
if (grounded || emerging || latched) && mouse_check_button_pressed(mb_left) && !dying{
	Dive()
}

if diving || diving2{
	if abs(diveX) < 0.25 && abs(diveY) < 0.25{
		diving = false
		diving2 = false
		grounded = true
	}
}

if place_meeting(x,y,obj_enemy) && (diving || diving2 || emerging){
	var en = instance_nearest(x,y,obj_enemy)
	if en != latchTarget && !en.dying{
		Latch(en)
	}
}
if latched{
	if latchTarget.dying{
		latched = false
		grounded = true
	}
	if dying{
		latched = false
		grounded = true
	}
}
//show_debug_message(mounted,grounded,jumping,burrowing,burrowed,emerging)



if keyboard_check_pressed(vk_space) && dying{
	room_restart()
}

if place_meeting(x,y,obj_cutsceneTrigger) && !inCutscene{
	obj_transitionManager.Out()
	audio_sound_gain(snd_musicLoop,0.5,800)
}
#region Hurt Fx
if hurtTimer > 0{
	hurtTimer -= 1
	//layer_set_visible(hurtLayer,true)
	if !layer_get_visible(hurtLayer){
		layer_set_visible(hurtLayer,true)
	}
	//[0.5,1] to [0.7,1.4]
	var edge1 = 0.5+(hp/10)
	var edge2 = edge1*2
	fx_set_parameter(hurtFx,"g_VignetteEdges",[edge1,edge2])
}else{
	if layer_get_visible(hurtLayer){
		layer_set_visible(hurtLayer,false)
		hp = 3
	}
}
#endregion

if !tutorialDone{
	if progress == 0{
		if xVel != 0 || yVel != 0{
			progress+=1
		}
	}else if progress == 1{
		if mouse_check_button_pressed(mb_left){
			progress+=1
		}
	}else if progress == 2{
		if keyboard_check_pressed(vk_space){
			tutorialDone = true
		}
	}
}

if !audio_is_playing(snd_musicLoop){
	audio_play_sound(snd_musicLoop,10,0,0.75)
}