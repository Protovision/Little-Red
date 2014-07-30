
local function draw(self)
	if #self.animations == 0 then
		DrawBackground(self.background)
		return
	end

	self.draw_time = GetTicks()
	self.draw_lasttime = self.draw_lasttime or 0

	DrawBackground(self.background)
	DrawBackground(self.animations[self.frame].image)

	if (self.draw_time - self.draw_lasttime >= self.animations[self.frame].time) then	
		self.frame = self.frame + 1
		if self.frame > #self.animations then
			self.frame = 1
		end
		self.draw_lasttime = self.draw_time
	end

end

local function show(self)
	e = {}
	e.kind = "scene"
	e.object = self
	e.run = function (self)
		self.object.background = resource:open(self.object.imagefile)
		if novel.scene then
			resource:close(novel.scene.background)
		end
		novel.scene = self.object
		novel.dialog = nil
	end
	event:push(e)
end

local function animate(self, animations, loop)
	self.loop = loop or true
	for i, v in ipairs(animations) do
		self.animations[i] = { image = resource:open(v[1]), time = v[2] }	
	end
end

local function free(self)
	resource:close(self.background)
	for i, v in ipairs(self.animations) do
		resource:close(v.image)
	end
end

function Scene(image_file)
	local s = {}

	s.imagefile = image_file --resource:open(image_file)
	s.animations = {}
	s.frame = 1 
	s.loop = true
		
	s.show = show
	s.animate = animate
	s.draw = draw
	s.free = free
	return s
end


