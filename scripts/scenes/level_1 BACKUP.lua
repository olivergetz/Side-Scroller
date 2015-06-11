-- LEVEL 1
local physics = require "physics"
physics.start()
physics.setGravity( -7, 0 )

system.activate( "multitouch" )

local background = display.newImage("images/background.png")

background.anchorX = 0
background.anchorY = 0
background.x = 0
background.y = 0
background.height = display.contentHeight
background.width = display.contentWidth

local player = display.newImage("images/player.png")
player.x = display.contentHeight / 2
player.y = display.contentWidth / 3
physics.addBody(player, "dynamic", {density = 1, bounce = 0})
player.canJump = 0

local userInterface = display.newImage("images/UI.png")
userInterface.anchorX = 0
userInterface.anchorY = 0
userInterface.x = 0
userInterface.y = 0
userInterface.height = display.contentHeight
userInterface.width = display.contentWidth / 3.5

local screenLeftPressed = false
local screenRightPressed = false
local jumpButtonPressed = false
local attackButtonPressed = false

ground = display.newImage( "images/ground.png", 240, 240)
ground.anchorX = 0
ground.anchorY = 0
ground.x = display.contentWidth / 3
ground.y = 0
physics.addBody(ground, "static", {density = 1, bounce = 0})

moveLeftButton = display.newImage( "images/ButtonLeft.png")
moveLeftButton.anchorX = 0
moveLeftButton.anchorY = 0
moveLeftButton.x = 0
moveLeftButton.y = 0
moveLeftButton.width = display.contentWidth / 3.5
moveLeftButton.height = moveLeftButton.width

moveRightButton = display.newImage( "images/ButtonRight.png")
moveRightButton.anchorX = 0
moveRightButton.anchorY = 0
moveRightButton.x = 0
moveRightButton.y = moveLeftButton.height
moveRightButton.width = display.contentWidth / 3.5
moveRightButton.height = moveRightButton.width

jumpButton = display.newImage( "images/jumpButton.png")
jumpButton.anchorX = 0
jumpButton.anchorY = 0
jumpButton.x = 0
jumpButton.y = display.contentHeight - (display.contentWidth / 3.5)
jumpButton.width = display.contentWidth / 3.5
jumpButton.height = jumpButton.width

attackButton = display.newImage( "images/attackButton.png")
attackButton.anchorX = 0
attackButton.anchorY = 0
attackButton.x = 0
attackButton.y = display.contentHeight - (jumpButton.height * 2)
attackButton.width = display.contentWidth / 3.5
attackButton.height = attackButton.width

-- buttons animation function

function buttonGraphics(event)
	if screenLeftPressed == false then
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

	if screenRightPressed == false then
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

end

-- input

local function handleEnterFrame(event)
	if screenLeftPressed == true then
		player.y = player.y - 10
	else

	end
end

Runtime:addEventListener("enterFrame", handleEnterFrame)

function touchScreenLeft(event)
	if event.phase == "began" then
		screenLeftPressed = true
		moveLeftButton.y = 0
		buttonGraphics()
	elseif event.phase == "moved" then
		screenLeftPressed = false
		buttonGraphics()
	elseif event.phase == "ended" and screenLeftPressed == true then
		screenLeftPressed = false
		buttonGraphics()
	end

end

moveLeftButton:addEventListener("touch", touchScreenLeft)

local function handleEnterFrame(event)
	if screenRightPressed == true then
		player.y = player.y + 10
	else

	end
end

Runtime:addEventListener("enterFrame", handleEnterFrame)

function touchScreenRight(event)
	if event.phase == "began" then
		screenRightPressed = true
		buttonGraphics()
	elseif event.phase == "moved" then
		screenRightPressed = false
		buttonGraphics()
	elseif event.phase == "ended" and screenRightPressed == true then
		screenRightPressed = false
		buttonGraphics()
	end

end

moveRightButton:addEventListener("touch", touchScreenRight)

local function handleEnterFrame(event)
	if jumpButtonPressed == true then
		player:applyForce( 125, 0, player.x, player.y )
		jumpButtonPressed = false
	else

	end
end

Runtime:addEventListener("enterFrame", handleEnterFrame)

function touchScreenJump(event)
	if event.phase == "began" then
		jumpButtonPressed = true
		buttonGraphics()
	elseif event.phase == "ended" then
		jumpButtonPressed = false
		buttonGraphics()

	end

end

jumpButton:addEventListener("touch", touchScreenJump)

local function handleEnterFrame(event)
	if attackButtonPressed == true then
		--enter attack code
	else

	end
end

Runtime:addEventListener("enterFrame", handleEnterFrame)

function touchScreenAttack(event)
	if event.phase == "began" then
		attackButtonPressed = true
		buttonGraphics()
	elseif event.phase == "ended" and attackButtonPressed == true then
		attackButtonPressed = false
		buttonGraphics()
	end

end

attackButton:addEventListener("touch", touchScreenAttack)