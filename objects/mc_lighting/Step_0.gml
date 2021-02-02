linedraw_init	= mouse_check_button_pressed(mb_left);
linedraw_cease	= mouse_check_button_released(mb_left);
delete_lines	= mouse_check_button_pressed(mb_right);

light_init		= keyboard_check_pressed(vk_space);
light_cease		= keyboard_check_released(vk_space);

//line states
switch (linedraw_state) {
    case INIT:
        lines[line_count++] = new boundary(mouse_x,mouse_y,mouse_x,mouse_y);
		linedraw_state = UPDATE;
        break;
	case UPDATE:
        lines[line_count-1].b.x = mouse_x;
		lines[line_count-1].b.y = mouse_y;
		if (linedraw_cease) linedraw_state = CEASE;
        break;
    case CEASE:
        if (delete_lines)  reset();
		if (linedraw_init) linedraw_state = INIT;
        break;
}


//rays states
switch(rays_state) {
	case INIT:
		var i = 0, d = 0; repeat(360){
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
	
	case UPDATE:
		var i = 0 repeat(ray_count){
			rays[i].update();
			i++;
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
	
	case CEASE: 
		if (light_init) rays_state = INIT;
		break;
}

ray_count = array_length(rays);