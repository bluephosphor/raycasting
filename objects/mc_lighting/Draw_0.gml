var l, i = 0; repeat(total_lines) {
	l = lines_to_draw[i];
	draw_line(l[0],l[1],l[2],l[3]);
	i++;
}