-- User Interface
local globalData = require ( "globalData" )
local graphics = display.newGroup()

leftButtonPressed = false
rightButtonPressed = false
jumpButtonPressed = false
attackButtonPressed = false

function activateUI( event )

	globalData.playerHealth = 5

	userInterface = display.newImage("images/UI.png")
	userInterface.anchorX = 0
	userInterface.anchorY = 0
	userInterface.x = 0
	userInterface.y = 0
	userInterface.height = display.contentHeight
	userInterface.width = display.contentWidth / 3
	uiGraphicsLayer:insert(userInterface)

	heartGraphics()
	buttonGraphics()

	moveLeftButton:addEventListener( "touch", touchButtonLeft )

	moveRightButton:addEventListener( "touch", touchButtonRight )

	jumpButton:addEventListener( "touch", touchButtonJump )

	attackButton:addEventListener( "touch", touchButtonAttack )

	globalData.backgroundMostRight = true

	globalData.backgroundMostLeft = false

	buttonsGraphicsLayer:insert(moveLeftButton)
	buttonsGraphicsLayer:insert(moveRightButton)
	buttonsGraphicsLayer:insert(attackButton)
	buttonsGraphicsLayer:insert(jumpButton)

end

function heartGraphics() -- this is it's own function because it changes based on player health

		local heart1 = display.newImage( "images/Heart.png")
		heart1.anchorX = 0
		heart1.anchorY = 0
		heart1.x = display.contentWidth - (display.contentWidth / 8)
		heart1.y = 0
		heart1.width = display.contentWidth / 9
		heart1.height = heart1.width

	if globalData.playerHealth >= 2 then

		local heart2 = display.newImage( "images/Heart.png")
		heart2.anchorX = 0
		heart2.anchorY = 0
		heart2.x = display.contentWidth - (display.contentWidth / 8)
		heart2.y = heart1.width
		heart2.width = display.contentWidth / 9
		heart2.height = heart2.width

	elseif globalData.playerHealth < 2 then

		local heart2 = display.newImage( "images/HeartEmpty.png")
		heart2.anchorX = 0
		heart2.anchorY = 0
		heart2.x = display.contentWidth - (display.contentWidth / 8)
		heart2.y = heart1.width
		heart2.width = display.contentWidth / 9
		heart2.height = heart2.width

	end

	if globalData.playerHealth >= 3 then

		local heart3 = display.newImage( "images/Heart.png")
		heart3.anchorX = 0
		heart3.anchorY = 0
		heart3.x = display.contentWidth - (display.contentWidth / 8)
		heart3.y = heart1.width * 2
		heart3.width = display.contentWidth / 9
		heart3.height = heart3.width

	elseif globalData.playerHealth < 3 then

		local heart3 = display.newImage( "images/HeartEmpty.png")
		heart3.anchorX = 0
		heart3.anchorY = 0
		heart3.x = display.contentWidth - (display.contentWidth / 8)
		heart3.y = heart1.width * 2
		heart3.width = display.contentWidth / 9
		heart3.height = heart3.width

	end

	if globalData.playerHealth >= 4 then

		local heart4 = display.newImage( "images/Heart.png")
		heart4.anchorX = 0
		heart4.anchorY = 0
		heart4.x = display.contentWidth - (display.contentWidth / 8)
		heart4.y = heart1.width * 3
		heart4.width = display.contentWidth / 9
		heart4.height = heart4.width

	elseif globalData.playerHealth < 4 then

		local heart4 = display.newImage( "images/HeartEmpty.png")
		heart4.anchorX = 0
		heart4.anchorY = 0
		heart4.x = display.contentWidth - (display.contentWidth / 8)
		heart4.y = heart1.width * 3
		heart4.width = display.contentWidth / 9
		heart4.height = heart4.width

	end

	if globalData.playerHealth >= 5 then

		local heart4 = display.newImage( "images/Heart.png")
		heart4.anchorX = 0
		heart4.anchorY = 0
		heart4.x = display.contentWidth - (display.contentWidth / 8)
		heart4.y = heart1.width * 4
		heart4.width = display.contentWidth / 9
		heart4.height = heart4.width

	elseif globalData.playerHealth < 5 then

		local heart4 = display.newImage( "images/HeartEmpty.png")
		heart4.anchorX = 0
		heart4.anchorY = 0
		heart4.x = display.contentWidth - (display.contentWidth / 8)
		heart4.y = heart1.width * 4
		heart4.width = display.contentWidth / 9
		heart4.height = heart4.width


	end



end

-- Button Animations
function buttonGraphics( event )

	if leftButtonPressed == false then
		moveLeftButton = display.newImage( "images/ButtonLeft.png")
		moveLeftButton.anchorX = 0
		moveLeftButton.anchorY = 0
		moveLeftButton.x = display.contentWidth / 7.7
		moveLeftButton.y = 0
		moveLeftButton.width = display.contentWidth / 5
		moveLeftButton.height = moveLeftButton.width
	else
		moveLeftButton = display.newImage( "images/ButtonLeftPushed.png")
		moveLeftButton.anchorX = 0
		moveLeftButton.anchorY = 0
		moveLeftButton.x = display.contentWidth / 7.7
		moveLeftButton.y = 0
		moveLeftButton.width = display.contentWidth / 5
		moveLeftButton.height = moveLeftButton.width
	end

	if rightButtonPressed == false then
		moveRightButton = display.newImage( "images/ButtonRight.png")
		moveRightButton.anchorX = 0
		moveRightButton.anchorY = 0
		moveRightButton.x = 0
		moveRightButton.y = moveLeftButton.height / 1.15
		moveRightButton.width = display.contentWidth / 5
		moveRightButton.height = moveRightButton.width
	else
		moveRightButton = display.newImage( "images/ButtonRightPushed.png")
		moveRightButton.anchorX = 0
		moveRightButton.anchorY = 0
		moveRightButton.x = 0
		moveRightButton.y = moveLeftButton.height / 1.15
		moveRightButton.width = display.contentWidth / 5
		moveRightButton.height = moveRightButton.width
	end

	if jumpButtonPressed == false then
		jumpButton = display.newImage( "images/ButtonJump.png")
		jumpButton.anchorX = 0
		jumpButton.anchorY = 0
		jumpButton.x = display.contentWidth / 7.7
		jumpButton.y = display.contentHeight - (display.contentWidth / 5)
		jumpButton.width = display.contentWidth / 5
		jumpButton.height = jumpButton.width
	else
		jumpButton = display.newImage( "images/ButtonJumpPushed.png")
		jumpButton.anchorX = 0
		jumpButton.anchorY = 0
		jumpButton.x = display.contentWidth / 7.7
		jumpButton.y = display.contentHeight - (display.contentWidth / 5)
		jumpButton.width = display.contentWidth / 5
		jumpButton.height = jumpButton.width
	end

	if attackButtonPressed == false then
		attackButton = display.newImage( "images/ButtonAttack.png")
		attackButton.anchorX = 0
		attackButton.anchorY = 0
		attackButton.x = 0
		attackButton.y = display.contentHeight - (jumpButton.height * 1.8)
		attackButton.width = display.contentWidth / 5
		attackButton.height = attackButton.width
	else
		attackButton = display.newImage( "images/ButtonAttackPushed.png")
		attackButton.anchorX = 0
		attackButton.anchorY = 0
		attackButton.x = 0
		attackButton.y = display.contentHeight - (jumpButton.height * 1.8)
		attackButton.width = display.contentWidth / 5
		attackButton.height = attackButton.width
	end

	optionsBtn = display.newImage("images/ButtonMenu.png")
	optionsBtn.anchorX = 0
	optionsBtn.anchorY = 0
	optionsBtn.x = display.contentWidth - (display.contentWidth / 7)
	optionsBtn.y = display.contentHeight - (optionsBtn.width / 2.3)
	optionsBtn.width = attackButton.width / 2
	optionsBtn.height = optionsBtn.width

end

-- Player Input

function touchButtonLeft( event )
	if event.phase == "began" then
		leftButtonPressed = true
		buttonGraphics()
		globalData.leftButtonPressed = true
	elseif event.phase == "ended" then
		leftButtonPressed = false
		buttonGraphics()
		globalData.leftButtonPressed = false
	end

end

function touchButtonRight( event )
	if event.phase == "began" then
		rightButtonPressed = true
		buttonGraphics()
		globalData.rightButtonPressed = true
	elseif event.phase == "ended" then
		rightButtonPressed = false
		buttonGraphics()
		globalData.rightButtonPressed = false
	end

end

function jumpTimer( event )

	globalData.canJump = true

end

function touchButtonJump( event )

		if event.phase == "began" then

		jumpButtonPressed = true
		buttonGraphics()

		elseif event.phase == "ended" then

		jumpButtonPressed = false -- Controls graphics
		buttonGraphics()
		globalData.canJump = false -- Controls whether or not player can jump

		end

end

function touchButtonAttack( event )

	if event.phase == "began" then
		attackButtonPressed = true
		buttonGraphics()
	elseif event.phase == "moved" then
		attackButtonPressed = false
		buttonGraphics()
	elseif event.phase == "ended" then
		attackButtonPressed = false
		buttonGraphics()
	end

end

-- Clean up

function deactivateUI( event )
	-- body
end

-- all funtions that will be used in other scripts
local ui = {
	
	activateUI = activateUI,
	buttonGraphics = buttonGraphics,
	jumpTimer = jumpTimer

}

return ui