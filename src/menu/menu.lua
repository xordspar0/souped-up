local input = require("input")
local lume = require("vendor/lume")

local menu = {}

menu.bindings = {
	{ key = "confirm", action = function(menu) return menu.buttons[menu.selected].action() end },
	{ key = "up",      action = function(menu) menu.selected = menu.selected - 1 end },
	{ key = "down",    action = function(menu) menu.selected = menu.selected + 1 end },
	{ key = "up",      action = function(menu) end },
	{ key = "up",      action = function(menu) end },
}

function menu.new(buttons)
	self = setmetatable({}, {__index = menu})

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
		love.graphics.setColor(1, 1, 1)
		love.graphics.rectangle(
			self.selected == i and "fill" or "line",
			width / 2 - buttonWidth / 2,
			height / 2 + i * (buttonHeight + 10),
			buttonWidth,
			buttonHeight
		)

		if self.selected == i then love.graphics.setColor(0, 0, 0) end
		love.graphics.printf(
			button.name,
			width / 2 - buttonWidth / 2,
			height / 2 + i * (buttonHeight + 10) + 5,
			buttonWidth,
			"center"
		)
	end
end

return menu
