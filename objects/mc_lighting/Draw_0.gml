line.draw();

var i = 0; repeat(ray_count){
	var pt = rays[i].cast(line);
	if (is_struct(pt)){
		draw_line(rays[i].pos.x,rays[i].pos.y,pt.x,pt.y);
	}
	i++;
}