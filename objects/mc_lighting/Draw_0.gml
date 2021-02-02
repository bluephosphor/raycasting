var i = 0; repeat(line_count){
	lines[i].draw();
	i++;
}

var r = 0; repeat(ray_count){
	var pt = rays[r].cast(lines[0]);
	if (is_struct(pt)){
		draw_line(rays[r].pos.x,rays[r].pos.y,pt.x,pt.y);
	}
	r++;
}