#macro INIT 0
#macro UPDATE 1
#macro CEASE 2

#macro this self
#macro c_nokialight make_color_rgb(199, 240, 216)
#macro c_nokiadark  make_color_rgb(67, 82, 61)

function vec2(x,y) constructor{
	this.x = x;
	this.y = y;
}

globalvar resolution, window_scale;

resolution = {width: 84, height: 48};
window_scale = 6;