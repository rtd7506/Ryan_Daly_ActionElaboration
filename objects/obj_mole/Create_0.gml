/// @description Insert description here
// You can write your code in this editor
event_inherited()
host = instance_nearest(x,y,obj_enemy)
mountOffset = 0
animsMount = [spr_moleMountF,spr_moleMountB]

mounted = true
falling = false
escaping = false
burrowing = false
dying=false

hp=1

escapeTime = 60
escapeDir=0

moveSpd = 0.75
xVel = 0
yVel = 0

function Free(){
	mounted = false
	falling=true
	escapeDir = irandom_range(0,360)
	alarm[0] = escapeTime
	image_index=0
}

function Hit(_dir,_damage){
	if mounted{
		host.Hit(_dir,_damage)
	}
}