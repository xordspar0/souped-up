local input = require("input")
local lume = require("vendor/lume")

local car = {}

function car.new()
	local self = setmetatable({}, {__index = car})

	self.image = love.graphics.newImage("res/car.png")
	self.canvasA = love.graphics.newCanvas()
	self.canvasB = love.graphics.newCanvas()

	self.width = 16
	self.height = 20

	self.maxSpeed = 1
	self.x, self.y = 20, 20
	self.r = 0
	self.speed = 0

	return self
end

function car:update(dt)
	if input.up() then
		self.speed = self.maxSpeed
	elseif input.down() then
		self.speed = -self.maxSpeed
	else
		self.speed = 0
	end

	if input.left() then
		self.r = self.r - 0.1
	end
	if input.right() then
		self.r = self.r + 0.1
	end

	local x, y = lume.vector(self.r - math.pi/2, self.speed)
	self.x = self.x + x
	self.y = self.y + y
end

function car:draw()
	local x = math.floor(self.x)
	local y = math.floor(self.y)

	-- rotate
	love.graphics.push()
	love.graphics.scale(1/4, 1/4)

	love.graphics.setCanvas(self.canvasA)
	love.graphics.clear()
	love.graphics.draw(self.image, self.width*4, self.height*4, self.r, 4, 4, self.width/2, self.height/2)
	love.graphics.setCanvas(self.canvasB)
	love.graphics.clear()
	love.graphics.draw(self.canvasA, 0, 0, 0, 1/4, 1/4)
	love.graphics.setCanvas()

	love.graphics.pop()

	-- draw
	love.graphics.draw(self.canvasB, x, y, 0, 1, 1, self.width, self.height)
end

return car
