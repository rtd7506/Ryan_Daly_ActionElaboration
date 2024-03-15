/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
if transitioning{
	if step < 1{
		step+=0.05
	}else{
		transitioning = false
		room_goto(rm_end)
	}
	draw_rectangle(0,0,1280,lerp(0,720/2,step),0)
	draw_rectangle(0,720,1280,lerp(720,720/2,step),0)
}


