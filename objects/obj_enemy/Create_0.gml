/// @description Insert description here
// You can write your code in this editor

event_inherited()

gun = instance_create_depth(x,y,depth,obj_enemyGun)
gun.host = self

moves = [1,0,0]
moveX = 0
moveY = 0
moveSpd = 0.5//0.35
xVel = 0
yVel = 0

moveStep = 30
aimStep = 30

alarm[0] = moveStep

idle = true
aggressive = false
alert = false
latched = false

detectRangeH=85
detectRangeV=57
alertPos = [0,0]

animsIdle = [spr_scIdleF,spr_scIdleB]
animsRun = [spr_scRunF,spr_scRunB]
xDir = 1 //scale of -1 or 1
yDir = 0 //scale of 0 or 1

hp = 2
dying = false
dead = false
invincible = false

hurtSounds = [snd_moleHurt1,snd_moleHurt2]

flashTime = 0

//instance_activate_layer("HurtLayer")


function Hit(_dir,_damage){
	flashTime = 5
	hp -= _damage
	if hp <= 0{
		dying = true
		image_index = 0
		Force(3,_dir)
		audio_play_sound(snd_sciHurt,5,0,1.5,0,random_range(0.75,1.25))
	}else{
		Force(1.5,_dir)
		audio_play_sound(snd_sciHurt,5,0,1.5,0,random_range(0.75,1.25))
	}
	audio_play_sound(snd_sciHurt,5,0,0.75,0,random_range(0.25,0.75))
}

function Alert(){
	alert = true
	alertPos = [obj_player.x,obj_player.y]
	alarm[1] = irandom_range(60,120)
	//show_debug_message("SHOW YOURSELF")
}

function Latched(){
	latched = true
	gun.alarm[3] = 60
}

function UnLatch(dir){
	latched = false
	Hit(dir+180,10)
}