local lume = require("vendor/lume")

local input = {}

function input.up()
	if love.keyboard.isDown("up") then
		return true
	end
	return lume.any(love.joystick.getJoysticks(), function(joystick)
		return joystick:getGamepadAxis("lefty") < -0.2 or joystick:isGamepadDown("dpup")
	end)
end

function input.down()
	if love.keyboard.isDown("down") then
		return true
	end
	return lume.any(love.joystick.getJoysticks(), function(joystick)
		return joystick:getGamepadAxis("lefty") > 0.2 or joystick:isGamepadDown("dpdown")
	end)
end

function input.left()
	if love.keyboard.isDown("left") then
		return true
	end
	return lume.any(love.joystick.getJoysticks(), function(joystick)
		return joystick:getGamepadAxis("leftx") < -0.2 or joystick:isGamepadDown("dpleft")
	end)
end

function input.right()
	if love.keyboard.isDown("right") then
		return true
	end
	return lume.any(love.joystick.getJoysticks(), function(joystick)
		return joystick:getGamepadAxis("leftx") > 0.2 or joystick:isGamepadDown("dpright")
	end)
end

function input.confirm()
	if love.keyboard.isDown("return") then
		return true
	end
	return lume.any(love.joystick.getJoysticks(), function(joystick)
		return joystick:isGamepadDown("a")
	end)
end

return input
