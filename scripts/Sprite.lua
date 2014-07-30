
local function show(self, tag, position, fadein)

	fadein = fadein or 0

	e = {}
	e.kind = "sprite"

	w, h = GetWindowSize()

	position = position or "center"

	--self.y = h / 4
	e.y = h / 8

--[[
	if position == "left" then
		self.x = 0
	elseif position == "center left" then
		self.x = w / 5
	elseif position == "center" then
		self.x = w / 5 * 2 
	elseif position == "center right" then
		self.x = w / 5 * 3
	elseif position == "right" then
		self.x = w / 5 * 4
	end
--]]

	if position == "left" then
		e.x = 0
	elseif position == "center" then
		e.x = w / 3
	elseif position == "right" then
		e.x = w / 3 * 2
	end

	e.w, e.h = GetImageSize(self.images[tag])
	if e.w > w then e.w = w / 3 end
	if e.h > h then e.h = h end

	e.object = self
	e.tag = tag
	e.fadein = fadein * 1000
	e.run = function(self)
			if novel.sprites == nil then novel.sprites = {} end
			self.object.x = self.x
			self.object.y = self.y
			self.object.w = self.w
			self.object.h = self.h
			self.object.tag = self.tag
			if self.fadein ~= 0 then
				self.object.fadein = self.fadein
				self.object.alpha = nil
			else
				self.object.fadein = nil
				self.object.fadeout = nil
				FadeImage(self.object.images[self.object.tag], 255)
			end
			novel.sprites[self.object.name] = self.object
		end

	event:push(e)
end

--[[
local function hide(self)
	e = {}
	e.kind = "sprite"
	e.object = self
	e.run = function (self)
			if not novel.sprites then return end
			novel.sprites[self.object.name] = nil
			novel.redraw = true
		end

	event:push(e)
end
--]]

local function hide(self, fadeout)
	fadeout = fadeout or 0
	e = {}
	e.kind = "sprite"
	e.object = self
	e.fadeout = fadeout * 1000
	e.run = function (self)
			if not novel.sprites then return end
			if fadeout ~= 0 then
				self.object.fadeout = self.fadeout
				self.object.alpha = nil
			else
				self.object.fadeout = nil
				self.object.fadein = nil
				novel.sprites[self.object.name] = nil
			end
		end
	event:push(e)
end

local function draw(self)
	
	if self.fadein == nil and self.fadeout == nil then
		DrawImage(self.x, self.y, self.images[self.tag], self.w, self.h)
		return
	end
	
	self.fade_time = GetTicks()
	self.fade_lasttime = self.fade_lasttime or 0

	if self.fadein then
		if not self.alpha then
			self.alpha = 0
		else
			self.alpha = self.alpha + (255 / self.fadein * (self.fade_time - self.fade_lasttime))
		end

		if self.alpha >= 255 then
			self.alpha = 255
			self.fadein = nil
		end

	elseif self.fadeout then
		if not self.alpha then
			self.alpha = 255
		else
			self.alpha = self.alpha - (255 / self.fadeout * (self.fade_time - self.fade_lasttime))
		end

		if self.alpha <= 0 then
			self.alpha = 0
			self.fadeout = nil
		end
	end

	FadeImage(self.images[self.tag], self.alpha)
	DrawImage(self.x, self.y, self.images[self.tag], self.w, self.h)

	self.fade_lasttime = self.fade_time

end

local function image(self, tag, filename)
	self.images[tag] = resource:open(filename)
end

function Sprite(name)
	local s = {}
	s.images = {}
	s.name = name

	s.image = image
	s.show = show
	s.hide = hide
	s.draw = draw
	return s	
end
