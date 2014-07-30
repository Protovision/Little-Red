local function real_open(file, size)
	if string.sub(file, -string.len(".ttf")) == ".ttf" then
		return LoadFont(file, size)
	elseif string.sub(file, -string.len(".jpg")) == ".jpg" or
		string.sub(file, -string.len(".png")) == ".png" then
		return LoadImage(file)
	elseif string.sub(file, -string.len(".wav")) == ".wav" then
		return LoadSound(file)
	elseif string.sub(file, -string.len(".ogg")) == ".ogg" then
		return LoadMusic(file)
	end
	return nil
end

local function real_close(filename, handle)
	if string.sub(filename, -string.len(".ttf")) == ".ttf" then
		FreeFont(handle)
	elseif string.sub(filename, -string.len(".jpg")) == ".jpg" or
		string.sub(filename, -string.len(".png")) == ".png" then
		FreeImage(handle)
	elseif string.sub(filename, -string.len(".wav")) == ".wav" then
		FreeSound(handle)
	elseif string.sub(filename, -string.len(".ogg")) == ".ogg" then
		FreeMusic(handle)
	end

end

local function open(self, file, size)
	local r = {}
	for k, v in pairs(self.resources) do
		if v.filename == file and v.size == size then
			v.count = v.count + 1
			return v.handle
		end
	end
	r.handle = real_open(file, size)
	r.filename = file
	r.size = size
	r.count = 1
	if r.handle == nil then return nil end
	table.insert(self.resources, r)
	return r.handle
end

local function close(self, handle)
	if handle == nil then return end
	for k, v in pairs(self.resources) do
		if v.handle == handle then
			v.count = v.count - 1
			if v.count ~= 0 then return end	
			real_close(v.filename, v.handle)
			self.resources[k] = nil
			return
		end
	end
end

local function shutdown(self)
	for k, v in pairs(self.resources) do
		real_close(v.filename, v.handle)
	end
end

return {
	resources = {},
	open = open,
	close = close, 
	shutdown = shutdown
}
