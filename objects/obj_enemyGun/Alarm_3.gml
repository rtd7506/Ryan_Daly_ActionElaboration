/// @description Latch Aim
// You can write your code in this editor

if host.latched{
	aimDir = point_direction(mouse_x,mouse_y,obj_player.x,obj_player.y)+random_range(-30,30)
	alarm[3] = 10
}





