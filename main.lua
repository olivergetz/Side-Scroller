display.setStatusBar(display.HiddenStatusBar)

local physics = require "physics"
physics.start()
physics.setGravity( -7, 0 )

system.activate( "multitouch" )

local background = display.newImage("images/background.png")

background.anchorX = 0
background.anchorY = 0
background.x = 0
background.y = 0

local player = display.newImage("images/player.png")
player.x = 300
player.y = 640
physics.addBody(player, "dynamic", {density = 1, bounce = 0})
player.canJump = 0

local userInterface = display.newImage("images/UI.png")
userInterface.anchorX = 0
userInterface.anchorY = 0

local screenLeftPressed = false
local screenRightPressed = false
local jumpButtonPressed = false
local attackButtonPressed = false

ground = display.newImage( "images/ground.png", 240, 240)
ground.anchorX = 0
ground.anchorY = 0
ground.x = 260
ground.y = 0
physics.addBody(ground, "static", {density = 1, bounce = 0})

moveLeftButton = display.newImage( "images/ButtonLeft.png", 240, 240)
moveLeftButton.anchorX = 0
moveLeftButton.anchorY = 0
moveLeftButton.x = 0
moveLeftButton.y = 0

moveRightButton = display.newImageRect( "images/ButtonRight.png", 240, 240)
moveRightButton.anchorX = 0
moveRightButton.anchorY = 0
moveRightButton.x = 0
moveRightButton.y = 240

jumpButton = display.newImageRect( "images/jumpButton.png", 240, 240)
jumpButton.anchorX = 0
jumpButton.anchorY = 0
jumpButton.x = 0
jumpButton.y = 1040

attackButton = display.newImageRect( "images/attackButton.png", 240, 240)
attackButton.anchorX = 0
attackButton.anchorY = 0
attackButton.x = 0
attackButton.y = 800

-- buttons animation function

function buttonGraphics(event)
	if screenLeftPressed == false then
		moveLeftButton = display.newImage( "images/ButtonLeft.png", 240, 240)
		moveLeftButton.anchorX = 0
		moveLeftButton.anchorY = 0
		moveLeftButton.x = 0
		moveLeftButton.y = 0
	else
		moveLeftButton = display.newImage( "images/ButtonLeftPushed.png", 240, 240)
		moveLeftButton.anchorX = 0
		moveLeftButton.anchorY = 0
		moveLeftButton.x = 0
		moveLeftButton.y = 0
	end

	if screenRightPressed == false then
		moveRightButton = display.newImageRect( "images/ButtonRight.png", 240, 240)
		moveRightButton.anchorX = 0
		moveRightButton.anchorY = 0
		moveRightButton.x = 0
		moveRightButton.y = 240
	else
		moveRightButton = display.newImageRect( "images/ButtonRightPushed.png", 240, 240)
		moveRightButton.anchorX = 0
		moveRightButton.anchorY = 0
		moveRightButton.x = 0
		moveRightButton.y = 240
	end

	if attackButtonPressed == false then
		attackButton = display.newImageRect( "images/attackButton.png", 240, 240)
		attackButton.anchorX = 0
		attackButton.anchorY = 0
		attackButton.x = 0
		attackButton.y = 800
	else
		attackButton = display.newImageRect( "images/attackButtonPushed.png", 240, 240)
		attackButton.anchorX = 0
		attackButton.anchorY = 0
		attackButton.x = 0
		attackButton.y = 800
	end

	if jumpButtonPressed == false then
		jumpButton = display.newImageRect( "images/jumpButton.png", 240, 240)
		jumpButton.anchorX = 0
		jumpButton.anchorY = 0
		jumpButton.x = 0
		jumpButton.y = 1040
	else
		jumpButton = display.newImageRect( "images/jumpButtonPushed.png", 240, 240)
		jumpButton.anchorX = 0
		jumpButton.anchorY = 0
		jumpButton.x = 0
		jumpButton.y = 1040
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
