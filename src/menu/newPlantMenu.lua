local menu = require("menu/menu")

local newPlantMenu = {}

function newPlantMenu.new()
	local self = setmetatable({}, {__index = newPlantMenu})


	self.menu = menu.new("LR", {
		{image = love.graphics.newImage("res/sunflower.png")},
	})

	return self
end

function newPlantMenu:update()
	return self.menu:update()
end

function newPlantMenu:draw()
	self.menu:draw()
end

return newPlantMenu
