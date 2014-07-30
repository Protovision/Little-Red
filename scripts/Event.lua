
local function push(self, event)
	table.insert(self.events, event)
end

local function pull(self)
	return table.remove(self.events, 1)
end

local function peek(self)
	if #self.events == 0 then return nil end
	return self.events[#self.events]
end

local function process(self)
	while #self.events > 0 do
		e = self:peek() 
		if (e.kind == "dialog" and novel.dialog) or
			(e.kind == "menu" and novel.menu) then return end
		e = self:pull()
		e:run()
		if e.kind == "pause" then break end
	end
end

return {
	events = {},
	push = push,
	pull = pull,
	peek = peek,
	process = process
}
