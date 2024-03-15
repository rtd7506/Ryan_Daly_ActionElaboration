/// @description Insert description here
// You can write your code in this editor

if host.alert && !host.latched{
	aimDir = point_direction(host.x,host.y,host.alertPos[0],host.alertPos[1])
}

dir += angle_difference(aimDir,dir)*0.1
image_angle = dir
x = host.x + lengthdir_x(length,dir)
y = host.y-2 + lengthdir_y(length,dir)
if x < host.x{
	image_yscale=-1
}else{
	image_yscale=1
}
	
if y < host.y{
	depth = host.depth+1
}else{
	depth = host.depth-1
}
/*
if host.aggressive{
	
	if x < host.x{
		image_yscale=-1
	}else{
		image_yscale=1
	}
	
	
	if y < host.y{
		depth = host.depth+1
	}else{
		depth = host.depth-1
	}

}



