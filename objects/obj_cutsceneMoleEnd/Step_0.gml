/// @description Insert description here
// You can write your code in this editor


if x < obj_player.x && !latched{
	x+=5
}else{
	if !latched{
		latched = true
		audio_play_sound(snd_sciHurt,0,0,12.5,0,1)
		obj_transitionManager.Out()
		//show_debug_message("WHAT")
	}
}

if latched{
	sprite_index = spr_moleMountF
	image_index = 0
	image_xscale = 1.1
	x = obj_player.x
}

