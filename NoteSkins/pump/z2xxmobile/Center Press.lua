return Def.ActorFrame {
	LoadActor("GLOW 5x2")..{
		InitCommand=cmd(pause;setstate,7;zoom,.85;diffusealpha,0);
		PressCommand=cmd(finishtweening;diffusealpha,1;zoom,.85;linear,.2;diffusealpha,0;zoom,.85);
	};
}