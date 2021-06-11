local track = {}

function track.new()
	local self = setmetatable({}, {__index = track})

	self.segmentSize = 32
	self.segments = {'r', 'r', 'dr', 'd', 'dl', 'l', 'l', 'ul', 'u', 'ur'}

	self.track_ud = love.graphics.newImage("res/track_ud.png")
	self.track_rl = love.graphics.newImage("res/track_rl.png")
	self.track_ur = love.graphics.newImage("res/track_ur.png")
	self.track_ul = love.graphics.newImage("res/track_ul.png")
	self.track_dr = love.graphics.newImage("res/track_dr.png")
	self.track_dl = love.graphics.newImage("res/track_dl.png")

	return self
end

function track:draw()
	local x, y = 40, 40
	local l = self.segmentSize

	for i, segment in ipairs(self.segments) do
		if segment == "u" then
			love.graphics.draw(self.track_ud, x, y)
			y = y - l
		elseif segment == "ur" then
			love.graphics.draw(self.track_ur, x, y)
			x = x + l
		elseif segment == "ul" then
			love.graphics.draw(self.track_ul, x, y)
			y = y - l
		elseif segment == "r" then
			love.graphics.draw(self.track_rl, x, y)
			x = x + l
		elseif segment == "l" then
			love.graphics.draw(self.track_rl, x, y)
			x = x - l
		elseif segment == "d" then
			love.graphics.draw(self.track_ud, x, y)
			y = y + l
		elseif segment == "dr" then
			love.graphics.draw(self.track_dr, x, y)
			y = y + l
		elseif segment == "dl" then
			love.graphics.draw(self.track_dl, x, y)
			x = x - l
		end
	end
end

return track
