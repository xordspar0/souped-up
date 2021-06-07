local mainMenu = require("menu/mainMenu")

local state

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")

	state = mainMenu.new()
end

function love.update(dt)
	state:update(dt)
end

function love.draw()
	state:draw()
end
