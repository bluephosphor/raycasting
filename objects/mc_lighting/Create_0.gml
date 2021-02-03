function boundary(x1,y1,x2,y2) constructor {
	this.a = new vec2(x1,y1);
	this.b = new vec2(x2,y2);
}

function ray(x,y,dir) constructor{
	this.pos = new vec2(x,y);
	this.dir = dir;
	
	this.look = function(x,y){
		var _dir = point_direction(this.pos.x,this.pos.y,x,y);
		this.dir.x = lengthdir_x(1,_dir);
		this.dir.y = lengthdir_y(1,_dir);
	}
	
	this.update = function(){
		this.pos.x = mouse_x;
		this.pos.y = mouse_y;
	}
	
	this.cast = function(wall){
		var x1 = wall.a.x;
		var y1 = wall.a.y;
		var x2 = wall.b.x;
		var y2 = wall.b.y;
		
		var x3 = this.pos.x;
		var y3 = this.pos.y;
		var x4 = this.pos.x + this.dir.x;
		var y4 = this.pos.y + this.dir.y;
		
		var den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
		if (den == 0) return undefined;
		
		var t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
		var u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
		
		if (t > 0 and t < 1 and u > 0) {
			var point = new vec2(
				x1 + t * (x2 - x1),
				y1 + t * (y2 - y1)
			);
			return point;
		} else {
			return false;
		}
	}
}

reset = function(){
	var i = 0 repeat(line_count){
		delete lines[i];
		i++;
	}
	lines = [];
	line_count = 0;
	
	lines[line_count++] = new boundary(0,0,room_width,0);
	lines[line_count++] = new boundary(room_width-1,0,room_width-1,room_height);
	lines[line_count++] = new boundary(room_width,room_height-1,0,room_height-1);
	lines[line_count++] = new boundary(0,room_height,0,0);
}

lines = [];
line_count = 0;
linedraw_state = CEASE;
rays = [];
ray_count = 0;
rays_state = CEASE;

reset();

sub_surf = -1;
light_surf = -1;