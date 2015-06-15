-- User Interface
local globalData = require ( "globalData" )

leftButtonPressed = false
rightButtonPressed = false
jumpButtonPressed = false
attackButtonPressed = false

moveLeftButton = display.newImage( "images/ButtonLeft.png")
moveRightButton = display.newImage( "images/ButtonRight.png")
jumpButton = display.newImage( "images/jumpButton.png")
attackButton = display.newImage( "images/attackButton.png")

function activateUI( event )

	userInterface = display.newImage("images/UI.png")
	userInterface.anchorX = 0
	userInterface.anchorY = 0
	userInterface.x = 0
	userInterface.y = 0
	userInterface.height = display.contentHeight
	userInterface.width = display.contentWidth / 3.5

	buttonGraphics()

	moveLeftButton:addEventListener( "touch", touchButtonLeft )

	moveRightButton:addEventListener( "touch", touchButtonRight )

	jumpButton:addEventListener( "touch", touchButtonJump )

	attackButton:addEventListener( "touch", touchButtonAttack )

	globalData.backgroundMostRight = true

	globalData.backgroundMostLeft = false

end

-- Button Animations
function buttonGraphics( event )

	if leftButtonPressed == false then
		moveLeftButton = display.newImage( "images/ButtonLeft.png")
		moveLeftButton.anchorX = 0
		moveLeftButton.anchorY = 0
		moveLeftButton.x = 0
		moveLeftButton.y = 0
		moveLeftButton.width = display.contentWidth / 3.5
		moveLeftButton.height = moveLeftButton.width
	else
		moveLeftButton = display.newImage( "images/ButtonLeftPushed.png")
		moveLeftButton.anchorX = 0
		moveLeftButton.anchorY = 0
		moveLeftButton.x = 0
		moveLeftButton.y = 0
		moveLeftButton.width = display.contentWidth / 3.5
		moveLeftButton.height = moveLeftButton.width
	end

	if rightButtonPressed == false then
		moveRightButton = display.newImage( "images/ButtonRight.png")
		moveRightButton.anchorX = 0
		moveRightButton.anchorY = 0
		moveRightButton.x = 0
		moveRightButton.y = moveLeftButton.height
		moveRightButton.width = display.contentWidth / 3.5
		moveRightButton.height = moveRightButton.width
	else
		moveRightButton = display.newImage( "images/ButtonRightPushed.png")
		moveRightButton.anchorX = 0
		moveRightButton.anchorY = 0
		moveRightButton.x = 0
		moveRightButton.y = moveLeftButton.height
		moveRightButton.width = display.contentWidth / 3.5
		moveRightButton.height = moveRightButton.width
	end

	if jumpButtonPressed == false then
		jumpButton = display.newImage( "images/jumpButton.png")
		jumpButton.anchorX = 0
		jumpButton.anchorY = 0
		jumpButton.x = 0
		jumpButton.y = display.contentHeight - (display.contentWidth / 3.5)
		jumpButton.width = display.contentWidth / 3.5
		jumpButton.height = jumpButton.width
	else
		jumpButton = display.newImage( "images/jumpButtonPushed.png")
		jumpButton.anchorX = 0
		jumpButton.anchorY = 0
		jumpButton.x = 0
		jumpButton.y = display.contentHeight - (display.contentWidth / 3.5)
		jumpButton.width = display.contentWidth / 3.5
		jumpButton.height = jumpButton.width
	end

	if attackButtonPressed == false then
		attackButton = display.newImage( "images/attackButton.png")
		attackButton.anchorX = 0
		attackButton.anchorY = 0
		attackButton.x = 0
		attackButton.y = display.contentHeight - (jumpButton.height * 2)
		attackButton.width = display.contentWidth / 3.5
		attackButton.height = attackButton.width
	else
		attackButton = display.newImage( "images/attackButtonPushed.png")
		attackButton.anchorX = 0
		attackButton.anchorY = 0
		attackButton.x = 0
		attackButton.y = display.contentHeight - (jumpButton.height * 2)
		attackButton.width = display.contentWidth / 3.5
		attackButton.height = attackButton.width
	end

end

-- Player Input

function touchButtonLeft( event )
	if event.phase == "began" then
		leftButtonPressed = true
		buttonGraphics()
		globalData.leftButtonPressed = true
	elseif event.phase == "moved" then

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
	elseif event.phase == "moved" then

	elseif event.phase == "ended" then
		rightButtonPressed = false
		buttonGraphics()
		globalData.rightButtonPressed = false
	end

end

function touchButtonJump( event )
		if event.phase == "began" then
		jumpButtonPressed = true
		buttonGraphics()
		elseif event.phase == "ended" then
		jumpButtonPressed = false
		buttonGraphics()
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
	buttonGraphics = buttonGraphics

}

return ui