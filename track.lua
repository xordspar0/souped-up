local track = {}

function track.new()
	local self = setmetatable({}, {__index = track})

	self.segmentSize = 25
	self.segments = {'r', 'r', 'dr', 'd', 'dl', 'l', 'l', 'ul', 'u', 'ur'}

	return self
end

function track:draw()
	local x, y = 40, 40
	local l = self.segmentSize

	for i, segment in ipairs(self.segments) do
		if segment == "u" then
			love.graphics.rectangle("line", x, y, l, l)
			y = y - l
		elseif segment == "ur" then
			love.graphics.polygon('line', x, y + l, x + l, y, x + l, y + l)
			x = x + l
		elseif segment == "ul" then
			love.graphics.polygon('line', x, y, x + l, y, x + l, y + l)
			y = y - l
		elseif segment == "r" then
			love.graphics.rectangle("line", x, y, l, l)
			x = x + l
		elseif segment == "l" then
			love.graphics.rectangle("line", x, y, l, l)
			x = x - l
		elseif segment == "d" then
			love.graphics.rectangle("line", x, y, l, l)
			y = y + l
		elseif segment == "dr" then
			love.graphics.polygon('line', x, y, x + l, y + l, x, y + l)
			y = y + l
		elseif segment == "dl" then
			love.graphics.polygon('line', x, y, x + l, y, x, y + l)
			x = x - l
		end
	end
end

return track
