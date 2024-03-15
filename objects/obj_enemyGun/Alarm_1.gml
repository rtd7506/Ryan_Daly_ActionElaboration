/// @description Shoot
// You can write your code in this editor
if !host.dying{
if host.aggressive{
	instance_create_depth(x,y,depth-1,obj_enemyBullet)
	sprite_index = spr_gunShoot
	image_index = 0
	ScreenShake(10,0.5)
	host.Force(-1,dir)
	audio_play_sound(snd_shoot,5,0,0.25,0,random_range(0.75,1.25))
}
if host.latched{
	shootStep = irandom_range(10,20)
	latchShots -= 1
}
if latchShots > 0{
	alarm[1] = shootStep
}
}
