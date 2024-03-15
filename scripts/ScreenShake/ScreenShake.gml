// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenShake(_priority,_amt){
	if _priority <= obj_camera.priority{
		obj_camera.priority = _priority
		obj_camera.shaking = true
		obj_camera.intensity = _amt
	}
}