var i = 0; repeat(line_count){
	lines[i].draw();
	i++;
}

var curr_ray, record, pt, dist, closest;

var r = 0; repeat(ray_count){
	closest		= undefined;
	record		= infinity;
	curr_ray	= rays[r];
	var l = 0; repeat(line_count){
		pt = curr_ray.cast(lines[l]);
		if (is_struct(pt)){
			dist = point_distance(curr_ray.pos.x,curr_ray.pos.y,pt.x,pt.y);
			if (dist < record){
				record = min(dist, record);
				closest = pt;
			}
		}
		l++;
	}
	if (is_struct(closest)) draw_line(curr_ray.pos.x,curr_ray.pos.y,closest.x,closest.y);
	r++;
}