
novel = {}

resource = Call("scripts/Resource.lua")
music = Call("scripts/Music.lua")
sound = Call("scripts/Sound.lua")
event = Call("scripts/Event.lua")

Call("scripts/Scene.lua")
Call("scripts/Sprite.lua")
Call("scripts/Character.lua")

local function pause(self, seconds)
	e = {}
	e.kind = "pause"
	e.obj = self
	e.run = function (self)
			self.obj.wait = seconds * 1000
			self.obj.wait_lasttime = GetTicks()
		end
	event:push(e)
end

local function choice(self, choices, fgcolor, bgcolor)
	local w, h = GetWindowSize()
	local button_width = w / 6 * 4
	local button_height = h / 18

	local m = {}
	m.fgcolor = fgcolor or "0xffffffff"
	m.bgcolor = bgcolor or "0x000000ff"	
	m.buttons = {}
	m.width = button_width
	m.height = button_height
	if MENU_IMAGE ~= nil then
		m.image = resource:open(MENU_IMAGE)
	end
	
	local x = w / 6
	local y = (h / 3) - (m.height * #choices)
	if y < m.height then y = m.height - m.height / 3 end

	local fontsize = 28

	for i, v in ipairs(choices) do
		m.buttons[i] = {}
		m.buttons[i].x = x 
		m.buttons[i].y = y
		m.buttons[i].text = v[1]
		m.buttons[i].func = v[2]
		repeat
			fontsize = fontsize - 1
			resource:close(m.buttons[i].font)
			if NORMAL_FONT == nil then NORMAL_FONT = "fonts/FreeSans.ttf" end
			m.buttons[i].font = resource:open(NORMAL_FONT, fontsize)
			local tw, th = GetTextSize(m.buttons[i].text, m.buttons[i].font)
		until tw < m.width 
		y = y + m.height + m.height / 3
		if y >= h - h / 3 then break end
	end
	
	m.draw = function (self)
		for i, v in ipairs(m.buttons) do
			if m.image ~= nil then
				DrawImage(v.x, v.y, m.image, m.width, m.height)
			else
				DrawRect(v.x, v.y, m.width, m.height)
				SetColor(m.bgcolor)
				FillRect(v.x, v.y, m.width, m.height)
			end

			DrawText(v.x, v.y, v.text, m.fgcolor, v.font)
		end
	end
	
	local e = {}
	e.kind = "menu"
	e.menu = m
	e.run = function (self)
			novel.menu = self.menu
		end
	event:push(e)
end

function process_events()
	while event:peek() ~= nil do
		e = event:peek()
		if (e.kind == "dialog" and novel.dialog) or
		(e.kind == "menu" and novel.menu) then
			return
		end
		e = event:pull()
		e:run()
		if e.kind == "pause" or 
		e.kind == "menu" or
		e.kind == "dialog" then break end
	end

end

function update()
	if novel.wait then
		novel.wait_time = GetTicks()
		if novel.wait_time - novel.wait_lasttime >= novel.wait then
			novel.wait = nil
		end
	end

	if novel.wait == nil and novel.menu == nil and novel.dialog == nil then
		process_events()
	end

	if novel.scene then novel.scene:draw() end

	if novel.sprites then
		for k, v in pairs(novel.sprites) do
			v:draw()
		end
	end

	if novel.dialog then novel.dialog:draw() end
	if novel.menu then novel.menu:draw() end
end

function mousebutton(x, y, button, status)
	if not (button == BUTTON_LEFT and status == PRESSED) then
		return
	end
	
	if novel.wait then return end
	
	if novel.menu then
		for i, v in ipairs(novel.menu.buttons) do
			if x > v.x and x < v.x + novel.menu.width and
				y > v.y and y < v.y + novel.menu.height then
				novel.menu = nil
				event:branch()
				v.func()
				break
			end
		end
		return
	end

	e = event:peek()
	if e == nil then return end
	if e.kind ~= "dialog" and e.kind ~= "menu" then
		process_events()
	end

	e = event:pull()
	if e == nil then return end
	e:run()

end

function shutdown()
	resource:shutdown()	
end


narrator = Character("_", 0)
novel.pause = pause
novel.choice = choice
