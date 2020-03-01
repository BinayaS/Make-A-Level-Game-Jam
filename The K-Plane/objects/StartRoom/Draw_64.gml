draw_set_font(fntTitle);
draw_set_halign(fa_center);
draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/2 - 100, "The K-Plane", xScale, yScale, angle);
draw_text(display_get_gui_width()/2, display_get_gui_height()/2 + 200,"Press any Button To Start");