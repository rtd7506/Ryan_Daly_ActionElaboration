/// @description Insert description here
// You can write your code in this editor

if mounted{
	sprite_index = animsMount[host.yDir]
	if host.yDir == 0{
		depth = host.depth+10
	}else{
		//mountOffset = 9
		depth = host.depth-10
	}
}else if falling{
	sprite_index = spr_moleFall
	if image_index > 5{
		escaping = true
		falling = false
	}
}else if escaping{
	sprite_index = spr_moleRun
	draw_sprite(spr_shadow,0,x,y)
}else if burrowing{
	sprite_index = spr_moleBurrow
	if image_index > 7{
		instance_destroy()
	}
	draw_sprite(spr_shadow,0,x,y)
}

draw_self()




