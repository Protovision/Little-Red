local function say(self, message, font)
	local d = {}
	local w, h = GetWindowSize()

	local dialog_width = w
	local dialog_height = h / 3

	font = font or NORMAL_FONT

	d.box = {}
	d.box.x = 0
	d.box.y = h - dialog_height
	if DIALOG_IMAGE ~= nil then
		d.box.image = resource:open(DIALOG_IMAGE)
	end
	d.box.w = dialog_width
	d.box.h = dialog_height

	local text_x = d.box.x + d.box.w / 5
	local text_y = d.box.y + d.box.h / 10
	local text_w = d.box.w - (text_x - d.box.x) - d.box.w / 12
	local text_h = d.box.h - (text_y - d.box.y) - d.box.h / 3 

	d.name = {}	
	d.name.x = text_x
	d.name.y = text_y
	d.name.string = self.name
	d.name.color = self.color

	d.text = {}
	d.text.lines = {}

	local fontsize = 28

	repeat
		fontsize = fontsize - 1
		resource:close(d.text.font)
		if font == nil then font = "fonts/FreeSans.ttf" end
		d.text.font = resource:open(font, fontsize)
		tw, th = GetTextSize(message, d.text.font)
	until tw / text_w * th < text_h - th

	if BOLD_FONT == nil then BOLD_FONT = "fonts/FreeSansBold.ttf" end
	d.name.font = resource:open(BOLD_FONT, fontsize)

	i = th
	nextline = nil

	repeat
		tw, th = GetTextSize(message, d.text.font)
		if tw >= text_w then
			repeat
				first, last = string.find(message, ".* ")
				if first == nil then break end
				if nextline == nil then
					nextline = string.sub(message, last + 1)
				else
					nextline = string.sub(message, last + 1) .. " " .. nextline
				end
				message = string.sub(message, first, last - 1)
				tw, th = GetTextSize(message, d.text.font)
			until tw < text_w 
		end
		local line = {}
		line.x = text_x
		line.y = text_y + i
		line.string = message
		table.insert(d.text.lines, line)
		message = nextline
		nextline = nil
		i = i + th 
	until message == nil

	if self.tag ~= nil then
		d.avatar = {}
		d.avatar.x = d.box.x + d.box.w / 30
		d.avatar.y = d.box.y 
		d.avatar.image = self.images[self.tag]
		d.avatar.w = d.box.w / 6 
		d.avatar.h = d.box.h 
	end

	d.draw = function (self)
		if self.box.image ~= nil then
			DrawImage(self.box.x, self.box.y, self.box.image, self.box.w, self.box.h)
		end
		if self.avatar ~= nil and self.name.string ~= "_" then
			DrawImage(self.avatar.x, self.avatar.y, self.avatar.image, self.avatar.w, self.avatar.h)
		end
		if self.name.string ~= "_" then 
			DrawText(self.name.x, self.name.y, self.name.string, self.name.color, self.name.font)
		end
		for k, v in pairs(self.text.lines) do
			DrawText(v.x, v.y, v.string, COLOR_WHITE, self.text.font)
		end
	end
		
	local e = {}
	e.kind = "dialog"
	e.dialog = d
	e.run = function (self)
			novel.dialog = self.dialog
		end
	event:push(e)
end

local function image(self, tag, filename)
	self.images[tag] = resource:open(filename)	
end

local function avatar(self, tag)
	self.tag = tag
end

function Character(name, color)
	local c = {}
	c.images = {}
	c.name = name
	c.color = color

	c.say = say
	c.image = image
	c.avatar = avatar	

	return c
end
