function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	bg = love.graphics.newImage("res/test.png")
end

function love.draw()
	love.graphics.draw(bg)
end
