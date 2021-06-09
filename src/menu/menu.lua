local input = require("input")
local lume = require("vendor/lume")

local menu = {}

menu.bindings = {
	{ key = "confirm", action = function(self) return self.buttons[self.selected].action() end },
	{ key = "up",      action = function(self) self.selected = self.selected - 1 end },
	{ key = "down",    action = function(self) self.selected = self.selected + 1 end },
	{ key = "left",    action = function(self) end },
	{ key = "right",   action = function(self) end },
}

function menu.new(direction, buttons)
	self = setmetatable({}, {__index = menu})

	if not (direction == "TD" or direction == "LR") then
		error("Invalid direction: " .. direction)
	end
	self.direction = direction

	self.selected = 1
	self.buttons = buttons

	self.alreadyPressed = {}
	for _, binding in ipairs(self.bindings) do
		self.alreadyPressed[binding.key] = true
	end

	return self
end

function menu:update()
	for _, binding in ipairs(self.bindings) do
		local key = binding.key
		local action = binding.action

		if input[key]() then
			if not self.alreadyPressed[key] then
				nextMenu = action(self)
				if nextMenu ~= nil then
					return nextMenu
				end
			end

			self.alreadyPressed[key] = true
		else
			self.alreadyPressed[key] = false
		end
	end

	self.selected = lume.clamp(self.selected, 1, #self.buttons)
end

local buttonWidth = 350
local buttonHeight = 50
function menu:draw()
	local width, height = love.graphics.getDimensions()
	for i, button in ipairs(self.buttons) do
		local x = width / 2 - buttonWidth / 2
		local y = height / 2 + i * (buttonHeight + 10)

		love.graphics.setColor(1, 1, 1)
		love.graphics.rectangle(
			self.selected == i and "fill" or "line",
			x,
			y,
			buttonWidth,
			buttonHeight
		)

		if button.name then
			if self.selected == i then love.graphics.setColor(0, 0, 0) end
			love.graphics.printf(
				button.name,
				x,
				y + 5,
				buttonWidth,
				"center"
			)
		end

		if button.image then
			love.graphics.draw(button.image, x, y)
		end
	end
end

return menu
