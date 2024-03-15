/// @description Insert description here
// You can write your code in this editor

image_angle = dir

if x < obj_player.x{
	image_yscale=-1
}else{
	image_yscale=1
}
if sprite_index = spr_gunShoot && image_index > 2{
	sprite_index = spr_gun
}

if !obj_player.dying{
	draw_self()
}
