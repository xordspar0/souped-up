local input = require("input")

local menu = {}

function menu.update(menu)
	local limit = #menu.buttons

	if input.confirm() then
		menu.buttons[menu.selected].action()
	elseif input.up() then
		menu.selected = menu.selected - 1
	elseif input.down() then
		menu.selected = menu.selected + 1
	end

	if menu.selected > limit then
		menu.selected = limit
	end

	if menu.selected < 1 then
		menu.selected = 1
	end
end

local buttonWidth = 350
local buttonHeight = 50
function menu.draw(menu)
	local width, height = love.graphics.getDimensions()
	for i, button in ipairs(menu.buttons) do
		love.graphics.setColor(1, 1, 1)
		love.graphics.rectangle(
			menu.selected == i and "fill" or "line",
			width / 2 - buttonWidth / 2,
			height / 2 + i * (buttonHeight + 10),
			buttonWidth,
			buttonHeight
		)

		if menu.selected == i then love.graphics.setColor(0, 0, 0) end
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
