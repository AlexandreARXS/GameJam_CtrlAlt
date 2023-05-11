
// Input do jogador
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
keyActive = keyboard_check_pressed(ord("E"));
keyItem= keyboard_check_pressed(vk_control);


var key = key_right - key_left !=0 || key_up - key_down != 0;

// Calculo de movimento
dir = point_direction(0,0,key_right - key_left, key_down - key_up)
mag = (key_right - key_left !=0) || (key_down - key_up !=0);

hsp = lengthdir_x(walksp * key, dir);
vsp = lengthdir_y(walksp * key, dir);


//Colisão Horizontal Parede
if(place_meeting(x+hsp,y, oWall)){
	while(!place_meeting(x+sign(hsp),y,oWall)){
		x= x+sign(hsp);
	}
	hsp =0;
}

//Colisão Vertical Parede
if(place_meeting(x,y+vsp, oWall)){
	while(!place_meeting(x,y+sign(vsp),oWall)){
		y += sign(vsp);
	}
	vsp =0;
}

//Colisão Horizontal Porta
if(place_meeting(x+hsp,y, oDoor)){
	while(!place_meeting(x+sign(hsp),y,oDoor)){
		x += sign(hsp);
	}
	hsp =0;
}

//Colisão Vertical Porta
if(place_meeting(x,y+vsp, oDoor)){
	while(!place_meeting(x,y+sign(vsp),oDoor)){
		y += sign(vsp);
	}
	vsp =0;
}

//Colisão Horizontal Mesa
if(place_meeting(x+hsp,y, oTable)){
	while(!place_meeting(x+sign(hsp),y,oTable)){
		x += sign(hsp);
	}
	hsp =0;
}

//Colisão Vertical Mesa
if(place_meeting(x,y+vsp, oTable)){
	while(!place_meeting(x,y+sign(vsp),oTable)){
		y += sign(vsp);
	}
	vsp =0;
}

x += hsp;
y += vsp;

var _oldSprite = sprite_index;

if(mag !=0){
	direction = dir
	sprite_index = SpriteIdle;
} 

if(_oldSprite != sprite_index) 
	localFrame = 0 ;
