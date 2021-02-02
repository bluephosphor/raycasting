linedraw_init	= mouse_check_button_pressed(mb_left);
linedraw_cease	= mouse_check_button_released(mb_left);
delete_lines	= mouse_check_button_pressed(mb_right);

light_init		= keyboard_check_pressed(vk_space);
light_cease		= keyboard_check_released(vk_space);

//line states
switch (linedraw_state) {
    case INIT://///////////////////////////////////////////////////////////////////////////
        lines[line_count++] = new boundary(mouse_x,mouse_y,mouse_x,mouse_y);
		linedraw_state = UPDATE;
        break;
	case UPDATE://///////////////////////////////////////////////////////////////////////////
        lines[line_count-1].b.x = mouse_x;
		lines[line_count-1].b.y = mouse_y;
		if (linedraw_cease) linedraw_state = CEASE;
        break;
    case CEASE://///////////////////////////////////////////////////////////////////////////
        if (delete_lines)  reset();
		if (linedraw_init) linedraw_state = INIT;
        break;
}

//resetting line draw array
lines_to_draw = [];
total_lines = 0;

var curr_line, i = 0; repeat(line_count){
	curr_line = lines[i];
	lines_to_draw[total_lines++] = [drawtype.line,curr_line.a.x,curr_line.a.y,curr_line.b.x,curr_line.b.y];
	i++;
}

//rays states
switch(rays_state) {
	case INIT://///////////////////////////////////////////////////////////////////////////
		var i = 0, d = 0; repeat(361){
			var direction_vector = new vec2(
				lengthdir_x(1,d),
				lengthdir_y(1,d)
			);
			rays[i] = new ray(mouse_x,mouse_y,direction_vector);
			i ++;
			d ++;
		}
		rays_state = UPDATE;
		break;
	
	case UPDATE://///////////////////////////////////////////////////////////////////////////
		
		var curr_ray, record, pt, dist, closest;

		var r = 0; repeat(ray_count){
			closest	 = undefined;
			record   = infinity;
			curr_ray = rays[r];
			curr_ray.update();
			
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
			if (is_struct(closest)) lines_to_draw[total_lines++] = [drawtype.triangle,curr_ray.pos.x,curr_ray.pos.y,closest.x,closest.y];
			r++;
		}
		
		if (light_cease) {
			var i = 0 repeat(ray_count){
				delete rays[i]
				i++;
			}
			rays = [];
			rays_state = CEASE;
		}
		break;
	
	case CEASE: /////////////////////////////////////////////////////////////////////////////
		if (light_init) rays_state = INIT;
		break;
}

ray_count = array_length(rays);