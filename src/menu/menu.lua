local input = require("input")
local lume = require("vendor/lume")

local menu = {}

function menu.new(direction, buttons)
	local self = setmetatable({}, {__index = menu})

	self.bindings = {
		{ key = "confirm", action = function(self) return self.buttons[self.selected].action() end },
	}

	if direction == "TD" then
		self.buttonWidth = 100
		self.buttonHeight = 30

		self.bindings = lume.extend(self.bindings,
			{ key = "up",      action = function(self) self.selected = self.selected - 1 end },
			{ key = "down",    action = function(self) self.selected = self.selected + 1 end }
		)
	elseif direction == "LR" then
		self.buttonWidth = 64
		self.buttonHeight = 64

		self.bindings = lume.extend(self.bindings,
			{ key = "left",    action = function(self) self.selected = self.selected - 1 end },
			{ key = "right",   action = function(self) self.selected = self.selected + 1 end }
		)
	else
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
				local nextMenu = action(self)
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

function menu:draw(t)
	local width, height = love.graphics.inverseTransformPoint(love.graphics.getDimensions())

	for i, button in ipairs(self.buttons) do
		local x, y
		if self.direction == "TD" then
			x = width / 2 - self.buttonWidth / 2
			y = height / 2 + (i - 1) * (self.buttonHeight + 10)
		elseif self.direction == "LR" then
			x = width / 3 + (i - 1) * (self.buttonWidth + 10)
			y = height / 2 + 10
		end

		love.graphics.setColor(1, 1, 1)
		love.graphics.rectangle(
			self.selected == i and "fill" or "line",
			x,
			y,
			self.buttonWidth,
			self.buttonHeight
		)

		if button.name then
			if self.selected == i then love.graphics.setColor(0, 0, 0) end
			love.graphics.printf(
				button.name,
				x,
				y + 5,
				self.buttonWidth,
				"center"
			)
		end

		if button.image then
			if self.selected ~= i then love.graphics.setColor(.5, .5, .5) end
			love.graphics.draw(button.image, x, y)
		end
	end
end

return menu
