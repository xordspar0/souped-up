local mainMenu = require("menu/mainMenu")

local state

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")

	state = mainMenu.new()
end

function love.update(dt)
	state = state:update(dt) or state
end

function love.draw()
	love.graphics.scale(4)

	state:draw()
end
