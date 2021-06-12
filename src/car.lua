local input = require("input")

local car = {}

function car.new()
	local self = setmetatable({}, {__index = car})

	self.x, self.y = 20, 20
	self.size = 15
	self.speed = 20

	return self
end

function car:update(dt)
	if input.up() then
		self.y = self.y - self.speed * dt
	end
	if input.down() then
		self.y = self.y + self.speed * dt
	end
	if input.left() then
		self.x = self.x - self.speed * dt
	end
	if input.right() then
		self.x = self.x + self.speed * dt
	end
end

function car:draw()
	local x = math.floor(self.x)
	local y = math.floor(self.y)
	love.graphics.rectangle("fill", x, y, self.size, self.size)
end

return car
