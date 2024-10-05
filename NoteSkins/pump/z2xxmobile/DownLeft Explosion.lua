local bbuton = Var "Button";
local player = Var "Player";
Trace("NOTESKIN: ".. bbuton);
local tnames = {
	["DownLeft"] = 0,
	["UpLeft"] = 1,
	["Center"] = 2,
	["DownRight"] = 4,
	["UpRight"] = 3,
};
local fstate = tnames[bbuton];
Trace("NOTESKIN_ID: ".. fstate);
local iState = 0;
return Def.ActorFrame {
	--note graphic
	NOTESKIN:LoadActor(Var "Button", "Tap Note") .. {
		InitCommand=cmd(blend,"BlendMode_Add";playcommand,"Glow");
		W1Command=cmd(playcommand,"Glow");
		W2Command=cmd(playcommand,"Glow");
		W3Command=cmd(playcommand,"Glow");
		W4Command=cmd();	W5Command=cmd();
		HitMineCommand=cmd(playcommand,"Glow");
		GlowCommand=cmd(setstate,0;finishtweening;diffusealpha,1;zoom,1;linear,0.15;diffusealpha,0.9;zoom,1.2;linear,0.15;diffusealpha,0;zoom,1.3);
		HeldCommand=cmd(playcommand,"Glow");
	};
	--tap
	LoadActor("_OutlineReceptor")..{
		TapCommand=cmd(finishtweening;diffusealpha,1;zoom,1;linear,0.2;diffusealpha,0;zoom,1.24);
		InitCommand=cmd(animate,false;setstate,fstate;playcommand,"Tap");
		HeldCommand=cmd(playcommand,"Tap");
		ColumnJudgmentMessageCommand=cmd(playcommand,"Tap");
		PressCommand=cmd(playcommand,"Tap");
		ButtonPressedMessageCommand=function(self, params)
			if player == params.Player and bbuton == params.Button then
				self:finishtweening():playcommand("Tap");
			end;
		end;
	};
	NOTESKIN:LoadActor(Var "Button", "Tap Note") .. {
		InitCommand=cmd(playcommand,"Glow");
		W1Command=cmd(playcommand,"Glow");
		W2Command=cmd(playcommand,"Glow");
		W3Command=cmd(playcommand,"Glow");
		W4Command=cmd();	W5Command=cmd();
		HitMineCommand=cmd(playcommand,"Glow");
		GlowCommand=cmd(stoptweening;setstate,0;diffusealpha,0.45;sleep,0.21;diffusealpha,0;);
		HeldCommand=cmd(playcommand,"Glow");
	};
	
	--explosion
	LoadActor("_note_blue_l 8x1")..{
		InitCommand=cmd(blend,"BlendMode_Add";animate,false;zoom,0.84;playcommand,"Frames");
		W1Command=function(self) self:finishtweening(); iState = 0 self:playcommand("Frames") end;
		W2Command=function(self) self:finishtweening(); iState = 0 self:playcommand("Frames") end;
		W3Command=function(self) self:finishtweening(); iState = 0 self:playcommand("Frames") end;
		W4Command=cmd();
		W5Command=cmd();
		HoldingOnCommand=function(self) self:finishtweening(); iState = 0 self:playcommand("Frames") end;
		HitMineCommand=function(self) self:finishtweening(); iState = 0 self:playcommand("Frames") end;
		HeldCommand=function(self) self:finishtweening(); iState = 0 self:playcommand("Frames") end;
		ItemCommand=function(self) self:finishtweening(); iState = 0 self:playcommand("Frames") end;
		ItemDummyCommand=function(self) self:finishtweening(); iState = 0 self:playcommand("Frames") end;
		FramesCommand=function(self)
			self:setstate(iState);
			self:sleep(0.21/6);
			iState = iState+1
			if iState < self:GetNumStates() then
				self:queuecommand("Frames");
				self:diffusealpha(1);
			else
				self:diffusealpha(0);
			end
		end;
	};
	Def.Quad {
		InitCommand=cmd(zoomto,2000,2000;diffusealpha,0);
		HitMineCommand=cmd(finishtweening;diffusealpha,1;linear,0.5;diffusealpha,0);
		FlashCommand=cmd(finishtweening;diffusealpha,1;linear,0.5;diffusealpha,0);		
	};
}