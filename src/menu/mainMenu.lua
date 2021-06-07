local menu = require("menu/menu")

local mainMenu = {}

function mainMenu.new()
	local self = setmetatable({}, {__index = mainMenu})

	self.selected = 1

	self.buttons = {
		{name = "New Game", action = function() return newGameMenu end},
		{name = "Quit", action = function() love.event.quit() end},
	}

	return self
end

function mainMenu:update()
	menu.update(self)
end

function mainMenu:draw()
	menu.draw(self)
end

return mainMenu
