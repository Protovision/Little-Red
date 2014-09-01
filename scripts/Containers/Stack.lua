
local function push(self, v)
	table.insert(self.s, v)
end

local function pop(self)
	return table.remove(self.s)
end

local function size(self)
	return #self.s
end

local function peek(self)
	return self.s[#self.s]
end

local function clear(self)
	self.s = {}
end

return {
	s = {},
	push = push,
	pop = pop,
	size = size,
	peek = peek,
	clear = clear
}
