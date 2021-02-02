if (window_get_width() == resolution.width) exit;

window_set_size(resolution.width * window_scale, resolution.height * window_scale);
alarm[0] = 1;