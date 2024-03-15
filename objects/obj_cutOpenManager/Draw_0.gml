/// @description Insert description here
// You can write your code in this editor

if progress == 1{
	if image_alpha < 1{
		image_alpha+=0.01
	}
	draw_self()
}
if progress == 2{
	draw_set_color(c_white)
	draw_set_alpha(alpha[0])
	draw_text(room_width/2,200,"DAY 0")
	draw_set_alpha(alpha[1])
	draw_text(room_width/2-125,350,"Objective:")
	draw_set_alpha(alpha[2])
	draw_set_color(c_red)
	draw_text(room_width/2+200,350,"KILL THEM ALL")
}


