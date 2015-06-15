local physics = require( "physics" )
local ui = require( "scripts.ui" )
local globalData = require( "globalData" )

player = display.newImage("images/player.png")
player.x = display.contentHeight / 2
player.y = display.contentWidth / 3

function activatePlayer( event )

	player = display.newImage("images/player.png")
	player.x = display.contentHeight / 2
	player.y = display.contentWidth / 3
	physics.addBody(player, "dynamic", {density = 1, bounce = 0})
	player.canJump = 0

	globalData.playerPosition = player.y
	globalData.rightButtonPressed = rightButtonPressed
	globalData.leftButtonPressed = leftButtonPressed

end

function movePlayer( event )

	-- Move Player when background is most Right

	if globalData.backgroundMostRight == true then

		if rightButtonPressed == true then

			player.y = player.y + 10
			globalData.playerPosition = player.y

		end

		if leftButtonPressed == true then

			player.y = player.y - 10
			globalData.playerPosition = player.y

		end


	else

		-- Do Nothing

	end

	-- Check if player is in the middle of the screen

	if globalData.playerPosition >= display.contentHeight / 2 then

		globalData.backgroundMostRight = false

	end

		-- Move Player when background is most Left

	if globalData.backgroundMostLeft == true then

		if rightButtonPressed == true then

			player.y = player.y + 10
			globalData.playerPosition = player.y

		end

		if leftButtonPressed == true then

			player.y = player.y - 10
			globalData.playerPosition = player.y

		end

	end

	-- Check again if player is in the middle of the screen

	if globalData.playerPosition <= display.contentHeight / 2 then

		globalData.backgroundMostLeft = false

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
	movePlayer = movePlayer,
	backgroundScroll = backgroundScroll

}

return player