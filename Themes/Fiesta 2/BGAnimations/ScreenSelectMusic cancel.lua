return Def.Quad {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,0,0,0,0);
	OnCommand=cmd(diffusealpha,0;linear,.075;diffusealpha,1);
};