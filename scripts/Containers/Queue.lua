
local function push(self, v)
	table.insert(self.q, v)
end

local function pull(self)
	return table.remove(self.q, 1)
end

local function peek(self)
	return self.q[1]
end

local function size(self)
	return #self.q
end

local function clear(self)
	self.q = {}	
end

return {
	q = {},
	push = push,
	pull = pull,
	peek = peek,
	size = size,
	clear = clear
}
