#macro INIT 0
#macro UPDATE 1
#macro CEASE 2

#macro this self
#macro c_nokialight make_color_rgb(199, 240, 216)
#macro c_nokiadark  make_color_rgb(67, 82, 61)

enum drawtype {
	line,
	triangle
}

globalvar resolution, window_scale;

resolution = {width: 640, height: 360};
window_scale = 1;

function vec2(x,y) constructor{
	this.x = x;
	this.y = y;
}