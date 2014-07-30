
local function play(self, file, loop, fadein)
	loop = loop or true
	fadein = fadein or 0

	e = {}
	e.kind = "music"
	e.run = function (self)
			PlayMusic(resource:open(file), loop, fadein)
		end

	event:push(e)
end

local function stop(self)
	e = {}
	e.kind = "music"
	e.run = function (self)
			StopMusic()
		end
	event:push(e)	
end

local function set_volume(self, volume)

	e = {}
	e.kind = "music"
	e.run = function (self)
			SetMusicVolume(volume)
		end
	event:push(e)
end

return {
	play = play,
	stop = stop,
	set_volume = set_volume
}
