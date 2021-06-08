local menu = require("menu/menu")

local mainMenu = {}

function mainMenu.new()
	local self = setmetatable({}, {__index = mainMenu})

	self.menu = menu.new({
		{name = "New Game", action = function() return newGameMenu end},
		{name = "Quit", action = function() love.event.quit() end},
	})

	return self
end

function mainMenu:update()
	self.menu:update()
end

function mainMenu:draw()
	self.menu:draw()
end

return mainMenu
