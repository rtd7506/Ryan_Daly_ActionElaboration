/// @description Aim
// You can write your code in this editor
if !host.dying{
	if host.aggressive && !host.latched{
		aimDir = point_direction(host.x,host.y-2,obj_player.x,obj_player.y)+random_range(-15,15)
	}

	alarm[0] = irandom_range(15,30)
}
