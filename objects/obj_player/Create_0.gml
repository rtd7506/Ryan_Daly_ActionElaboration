/// @description Insert description here
// You can write your code in this editor

event_inherited()
moveSpd = 0.9

xVel=0
yVel=0
moveDirX=1

xInput = 0
yInput = 0

//gun = instance_create_depth(x,y,0,obj_gun)

animIdle = spr_moleIdle
animRun = spr_moleRun
animDeath = spr_moleDeath
animFlash = spr_moleFlash
animBurrow = spr_moleBurrow
animDug = spr_moleBurrowed
animEmerge = spr_moleEmerge
animDive = spr_moleJump
animDiving = spr_moleDiving
animLatchF = spr_moleMountF
animLatchB = spr_moleMountB

hp = 3//300
dying = false
dead = false
invincible = false

mounted = false
grounded = true
burrowing = false
burrowed = false
emerging = false
diving = false
diving2 = false
latched = false

digSpd = 1.5
digRate = 2
digStep = 0


canDive = true 
diveSpd = 4
diveX = 0
diveY = 0
diveDecay = 0.1
diveDir = 0

flashTime = 0

burrowMax = 120
burrowTimer = burrowMax

latchTarget = noone

inCutscene = false
cutsceneStep = 0
audio_stop_sound(snd_musicIntro)
audio_sound_gain(snd_musicLoop,1,0)
diveSounds = [snd_moleIdle1,snd_moleIdle2,snd_moleIdle3]
digSounds = [snd_dig1,snd_dig2,snd_dig3,snd_dig4,snd_dig5,snd_dig6,snd_dig7,snd_dig8]

hurtLayer = layer_get_id("HurtLayer")
hurtTimer = 0
hurtFx = layer_get_fx(hurtLayer)
fxEdges = fx_get_parameter(hurtFx,"g_VignetteEdges")

tutorial = ["WASD to move","Right click to dive","Space to burrow"]
progress = 0
tutorialDone = false

function Hit(_dir,_damage){
	flashTime = 5
	if hp <= 1{
		dying = true
		burrowing = false
		image_index = 0
		Force(3,_dir)
		if object_index = obj_player{
			ScreenShake(0,3)
			TimeControl(20,40)
		}
		audio_sound_gain(snd_musicLoop,0.25,600)
	}else{
		hp -= _damage
		Force(1.5,_dir)
		if object_index = obj_player{
			TimeControl(10,1)
			ScreenShake(0,3)
		}
	}
	hurtTimer = 240
	audio_play_sound(snd_moleHurt1,0,0,1.5,0,random_range(0.75,1.25))
}

function Burrow(){
	moveSpd = digSpd
	burrowing = true
	grounded = false
	xInput = 0
	yInput = 0
	image_index = 0
	audio_play_sound(snd_digStart,10,0,1.5,0,random_range(0.75,1.25))
}

function Emerge(){
	moveSpd = 0.9
	emerging = true
	burrowed = false
	invincible = false
	image_index = 0
	audio_play_sound(snd_digEnd,10,0,1.5,0,random_range(0.75,1.25))
}
 
function Dive(){
	audio_play_sound(diveSounds[irandom_range(0,array_length(diveSounds)-1)],5,0,0.25,0,random_range(0.5,1))
	grounded = false
	emerging = false
	diving = true
	alarm[1] = 60
	var dir = point_direction(x,y,mouse_x,mouse_y)
	diveX = lengthdir_x(diveSpd,dir)
	diveY = lengthdir_y(diveSpd,dir)
	if latched{
		latched = false
		latchTarget.UnLatch(dir)
		diving = true
	}
	xInput = 0
	yInput = 0
}

function Latch(_other){
	diving = false
	diving2 = false
	emerging = false
	latched = true
	latchTarget = _other
	_other.Latched()
}