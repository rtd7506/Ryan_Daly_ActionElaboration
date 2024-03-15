/// @description Insert description here
// You can write your code in this editor

dir = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y) + random_range(-5,5)
targets = [obj_enemy]//,obj_mole]
moveSpd = 5

function Destroy(){
	instance_destroy()
}
