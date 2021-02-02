light_init		= keyboard_check_pressed(vk_space);
light_cease		= keyboard_check_released(vk_space);

switch(state){
	case INIT:
		var i = 0; repeat(359){
			rays(i) = new ray()
			i++;
		}
		break;
	
	case UPDATE:
		if (light_cease) state = CEASE;
		break;
	
	case CEASE: 
		if (light_init) state = INIT;
		break;
}