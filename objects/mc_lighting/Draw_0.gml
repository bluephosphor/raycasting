line.draw();

var pt = rays.cast(line);
if (is_struct(pt)){
	draw_circle(pt.x,pt.y,3,0);
}
draw_line(rays.pos.x,rays.pos.y,rays.pos.x + rays.dir.x * 10, rays.pos.y + rays.dir.y * 10 );