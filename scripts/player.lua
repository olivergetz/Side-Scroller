local physics = require "physics"
local ui = require "scripts.ui"

player = display.newImage("images/player.png")
player.x = display.contentHeight / 2
player.y = display.contentWidth / 3

function activatePlayer( event )

	player = display.newImage("images/player.png")
	player.x = display.contentHeight / 2
	player.y = display.contentWidth / 3
	physics.addBody(player, "dynamic", {density = 1, bounce = 0})
	player.canJump = 0

end

function movePlayer( event )
	if leftButtonPressed == true then
		player.y = player.y - 10
	elseif rightButtonPressed == true then
		player.y = player.y + 10
	end
end

Runtime:addEventListener( "enterFrame", movePlayer )

function jumpPlayer( event )
	if jumpButtonPressed == true then
		player.x = player.x + 10
	else
		
	end
end

Runtime:addEventListener( "enterFrame", jumpPlayer )

--functions to be used in other scripts
local player = {
	
	activatePlayer = activatePlayer,
	movePlayer = movePlayer

}

return player