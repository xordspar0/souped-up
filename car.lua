local car = {}

function car.new()
	local self = setmetatable({}, {__index = car})
	return self
end

function car:draw()
end

return car
