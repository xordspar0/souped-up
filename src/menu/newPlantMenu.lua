local menu = require("menu/menu")
local race = require("race")

local newPlantMenu = {}

function newPlantMenu.new()
	local self = setmetatable({}, {__index = newPlantMenu})

	local startRace = function() return race.new() end

	self.menu = menu.new("LR", {
		{image = love.graphics.newImage("res/sunflower.png"), action = startRace},
		{image = love.graphics.newImage("res/potato.png"),    action = startRace},
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
