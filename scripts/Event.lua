local function push(self, event)
	if self.clear_dialog == true and event.kind == "dialog" then
		novel.dialog = nil
		self.clear_dialog = false
	end
	self.timeline:push(event)
end

local function rewind(self)
	while self.timeline:size() == 0 do
		self.universes:pop()
		self.timeline = self.universes:peek()
	end
end

local function pull(self)
	self:rewind()
	return self.timeline:pull()	
end

local function peek(self)
	self:rewind()
	return self.timeline:peek()
end

local function branch(self)
	self.universes:push( Call("scripts/Containers/Queue.lua") )
	self.timeline = self.universes:peek()
	self.clear_dialog = true
end

local e = {}
e.clear_dialog = false
e.universes = Call("scripts/Containers/Stack.lua")
e.universes:push( Call("scripts/Containers/Queue.lua") )
e.timeline = e.universes:peek()
e.push = push
e.pull = pull
e.peek = peek
e.branch = branch
e.rewind = rewind
return e
