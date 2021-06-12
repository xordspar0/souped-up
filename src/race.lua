local car = require("car")
local track = require("track")

local race = {}

function race.new()
	local self = setmetatable({}, {__index = race})

	self.track = track.new()
	self.cars = {}
	for i = 1, 4 do
		self.cars[i] = car.new()
	end

	return self
end

function race:update(dt)
	for _, car in ipairs(self.cars) do
		car:update(dt)
	end
end

function race:draw()
	self.track:draw()
	for _, car in ipairs(self.cars) do
		car:draw()
	end
end

return race
