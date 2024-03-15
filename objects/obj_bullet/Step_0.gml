/// @description Insert description here
// You can write your code in this editor


x += lengthdir_x(moveSpd,dir)
y += lengthdir_y(moveSpd,dir)

if place_meeting(x,y,obj_wall){
	audio_play_sound(snd_ding,0,0,0.15,0,random_range(0.5,1))
	Destroy()
}
if instance_place(x,y,targets){//place_meeting(){
	var _other = instance_place(x,y,targets)
	if !_other.dying && !_other.invincible{
		_other.Hit(dir,1)
		if _other == obj_player.id{
			ScreenShake(0,3)
		}
		Destroy()
	}
}