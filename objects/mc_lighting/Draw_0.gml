if (!surface_exists(light_surf)){
	light_surf = surface_create(room_width, room_height);
    surface_set_target(light_surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    draw_rectangle(0, 0, room_width, room_height, false);
    surface_reset_target();
} else {
	draw_sprite(spr_light,0,mouse_x,mouse_y);
	surface_set_target(light_surf);
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(0, 0, room_width, room_height, 0);
	gpu_set_blendmode(bm_subtract);
	
	var l, nl, i = 0; repeat(total_lines) {
		l = lines_to_draw[i];
		switch(l[0]){
			case drawtype.line:
				draw_line_width(l[1],l[2],l[3],l[4],2);
				break;
			case drawtype.triangle:
				nl = undefined;
				if (i < total_lines-1) nl = lines_to_draw[i+1];
				if (nl != undefined) draw_triangle(l[1],l[2],l[3],l[4],nl[3],nl[4],false);
				break;
		}
		i++;
	}
	
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface(light_surf, 0, 0);
}