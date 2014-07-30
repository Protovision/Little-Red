
local function play(self, file, loop, fadein)
	loop = loop or false 
	fadein = fadein or 0

	e = {}
	e.kind = "sound"
	e.run = function (self)
			PlaySound(resource:open(file), loop, fadein)
		end

	event:push(e)
end

local function stop(self)
	e = {}
	e.kind = "sound"
	e.run = function (self)
			StopSound(-1)
		end
	event:push(e)	
end

local function set_volume(self, volume)
	
	e = {}
	e.kind = "sound"
	e.run = function (self)
			SetSoundVolume(-1, volume)
		end
	event:push(e)
end

return {
	play = play,
	stop = stop,
	set_volume = set_volume
}
