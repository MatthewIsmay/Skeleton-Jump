/// @description Insert description here
// You can write your code in this editor
audio_stop_sound(sndMusic);
audio_play_sound(sndMusic,1,true);

menuTxt = "Press Spacebar to start";
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(menuFont);
draw_set_color(c_white);
