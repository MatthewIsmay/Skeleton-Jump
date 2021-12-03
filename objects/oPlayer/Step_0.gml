/// core player logic
// You can write your code in this editor

//get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);


var _move = key_right - key_left;
hsp = _move * walksp;
vsp = vsp + grv 

if (key_jump){
	if ((place_meeting(x,y+1,oInvisibleWall)) || (place_meeting(x,y+1,oGreenPlat))
	|| (place_meeting(x,y+1,oInvisiblePlat)) || (place_meeting(x,y+1,oPurplePlat))
	|| (place_meeting(x,y+1,oInvisiblePlat2))){
		audio_play_sound(sndJump,1,false);
		vsp = -jumpsp;
	}
	else if (jumps_left){
		audio_play_sound(sndJump,1,false);
		jumps_left = 0;
		vsp = -jumpsp;
	}
}

//horizontal collision

if (place_meeting(x+hsp,y,oGreenPlat)){
	while (!place_meeting(x+sign(hsp),y,oGreenPlat)){
		x = x +sign(hsp);
		}
	hsp = 0;
}
if (place_meeting(x+hsp,y,oInvisibleWall)){
	while (!place_meeting(x+sign(hsp),y,oInvisibleWall)){
		x = x +sign(hsp);
		}
	hsp = 0;
}
if (place_meeting(x+hsp,y,oInvisiblePlat)){
	while (!place_meeting(x+sign(hsp),y,oInvisiblePlat)){
		x = x +sign(hsp);
		}
	hsp = 0;
}
if (place_meeting(x+hsp,y,oInvisiblePlat2)){
	while (!place_meeting(x+sign(hsp),y,oInvisiblePlat2)){
		x = x +sign(hsp);
		}
	hsp = 0;
}
if (place_meeting(x+hsp,y,oPurplePlat)){
	while (!place_meeting(x+sign(hsp),y,oPurplePlat)){
		x = x +sign(hsp);
		}
	hsp = 0;
}
if (place_meeting(x+hsp,y,oYellowPlat)){
	while (!place_meeting(x+sign(hsp),y,oYellowPlat)){
		x = x +sign(hsp);
		}
	hsp = 0;
}
if (place_meeting(x+hsp,y,oSpikeBall)){
	room_restart();
}

if (place_meeting(x+hsp,y,oSkulls)){
	room_goto_next();
}
x = x + hsp;

//vertical collision
if (place_meeting(x,y+vsp,oInvisibleWall)){
	oPlayer.visible = true;
	oInvisiblePlat2.visible = false;
	jumps_left = 1;
	while (!place_meeting(x,y+sign(vsp),oInvisibleWall)){
		y = y +sign(vsp);
		}
	vsp = 0;
}

if (place_meeting(x,y+vsp,oInvisiblePlat)){
	jumps_left = 1;
	while (!place_meeting(x,y+sign(vsp),oInvisiblePlat)){
		y = y +sign(vsp);
		}
	vsp = 0;
}

if (place_meeting(x,y+vsp,oInvisiblePlat2)){
	jumps_left = 1;
	while (!place_meeting(x,y+sign(vsp),oInvisiblePlat2)){
		y = y +sign(vsp);
		}
	vsp = 0;
}

if (place_meeting(x,y+vsp,oGreenPlat)){
	jumps_left = 1;
	oInvisiblePlat.visible = true;
	while (!place_meeting(x,y+sign(vsp),oGreenPlat)){
		y = y +sign(vsp);
		}
	vsp = 0;
} else {
	oInvisiblePlat.visible = false;
}

if (place_meeting(x,y+vsp,oPurplePlat)){
	jumps_left = 1;
	oPlayer.visible = false;
	oInvisiblePlat2.visible = true;
	while (!place_meeting(x,y+sign(vsp),oPurplePlat)){
		y = y +sign(vsp);
		}
	vsp = 0;
} 

if (place_meeting(x,y+vsp,oYellowPlat)){
	jumps_left = 1;
	vsp = -25;
}

if (place_meeting(x,y+vsp,oSpikeBall)){
	audio_play_sound(sndLand,1,false);
	room_restart();
}
if (place_meeting(x,y+vsp,oSkulls)){
	room_goto_next();
}

y = y + vsp;

//animation
image_speed = 1;
if (hsp == 0){
	sprite_index = sPlayer;
}
else{	
	sprite_index = sPlayerWalk;
}

if (hsp != 0) image_xscale = sign(hsp);