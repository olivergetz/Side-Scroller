local physics = require( "physics" )
local ui = require( "scripts.ui" )
local globalData = require( "globalData" )

function activatePlayer( event )

	player = display.newImage("images/player.png")
	player.x = display.contentHeight / 2
	player.y = display.contentWidth / 3

	if globalData.playerInArena == false then -- size of player if not in an arena
		player.height = 25
		player.width = 25
	elseif globalData.playerInArena == true then -- size of player if in an arena
		player.height = 50
		player.width = 50
	end

	physics.addBody(player, "dynamic", {density = 1, bounce = 0})
	playerGraphicsLayer:insert(player)

	player:addEventListener( "collision", player )

	globalData.playerPosition = player.y
	globalData.rightButtonPressed = rightButtonPressed
	globalData.leftButtonPressed = leftButtonPressed
	globalData.canJump = true

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

	if jumpButtonPressed == true and globalData.canJump == true then

		player:applyLinearImpulse( 8, 0, player.x, player.y )

		globalData.canJump = false

		timer.performWithDelay( 3000, jumpTimer)

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