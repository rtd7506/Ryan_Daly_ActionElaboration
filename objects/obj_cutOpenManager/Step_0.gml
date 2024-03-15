/// @description Insert description here
// You can write your code in this editor

if progress == 0{
	//USE SEQUENCE
}

if layer_sequence_is_finished(sq_opening) && progress == 0{
	progress = 1
	layer_sequence_destroy(sq_opening)
}

if progress == 2{
	for (var i =0; i<array_length(alpha);i++){
		if alpha[i] < 1{
			alpha[i] += 0.01
			i=3
		}
	}
	if array_equals(alpha,alphaEnd){
		progress+=1
	}
}

if keyboard_check_pressed(vk_space){
	progress += 1
	if progress == 1{
		layer_sequence_destroy(sq_opening)
	}
	
}
if progress > 2{
	room_goto(rm_main)
}
/*
if !audio_is_playing(snd_musicIntro){
	audio_play_sound(snd_musicIntro,10,0,0.5)
}
*/
if !audio_is_playing(snd_musicLoop){
	audio_play_sound(snd_musicLoop,10,0,0.5)
}