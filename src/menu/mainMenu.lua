local menu = require("menu/menu")
local newPlantMenu = require("menu/newPlantMenu")

local mainMenu = {}

function mainMenu.new()
	local self = setmetatable({}, {__index = mainMenu})

	self.menu = menu.new("TD", {
		{name = "New Game", action = function() return newPlantMenu.new() end},
		{name = "Quit", action = function() love.event.quit() end},
	})

	return self
end

function mainMenu:update()
	return self.menu:update()
end

function mainMenu:draw()
	self.menu:draw()
end

return mainMenu
