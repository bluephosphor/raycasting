light_init		= keyboard_check_pressed(vk_space);
light_cease		= keyboard_check_released(vk_space);

switch(state){
	case INIT:
		var i = 0, d = 0; repeat(36){
			var direction_vector = new vec2(
				lengthdir_x(1,d),
				lengthdir_y(1,d)
			);
			rays[i] = new ray(mouse_x,mouse_y,direction_vector);
			i ++;
			d += 10;
		}
		state = UPDATE;
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
			state = CEASE;
		}
		break;
	
	case CEASE: 
		if (light_init) state = INIT;
		break;
}

ray_count = array_length(rays);